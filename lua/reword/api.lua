local M = {}

local cache = require("reword.cache")

function M.get_synonyms(word, callback)
  local cached = cache.get(word)
  if cached then
    callback(cached)
    return
  end

  local url = "https://api.dictionaryapi.dev/api/v2/entries/en/" .. word

  vim.fn.jobstart({ "curl", "-s", url }, {
    stdout_buffered = true,

    on_stdout = function(_, data)
      local ok, json = pcall(vim.fn.json_decode, table.concat(data, ""))
      if not ok or not json or type(json) ~= "table" then
        callback({})
        return
      end

      local synonyms_set = {}

      for _, entry in ipairs(json) do
        if entry.meanings then
          for _, meaning in ipairs(entry.meanings) do
            -- Top-level synonyms under the meaning
            if meaning.synonyms then
              for _, syn in ipairs(meaning.synonyms) do
                synonyms_set[syn] = true
              end
            end

            for _, def in ipairs(meaning.definitions or {}) do
              -- Per-definition synonyms
              if def.synonyms then
                for _, syn in ipairs(def.synonyms) do
                  synonyms_set[syn] = true
                end
              end
            end
          end
        end
      end

      local synonyms = {}
      for syn in pairs(synonyms_set) do
        table.insert(synonyms, syn)
      end

      table.sort(synonyms) -- Optional: sort alphabetically

      cache.set(word, synonyms)
      callback(synonyms)
    end,

    on_stderr = function(_, _)
      callback({})
    end
  })
end

return M
