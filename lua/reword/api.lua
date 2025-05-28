local M = {}

local curl = vim.fn.jobstart and vim.fn.system or os.execute

function M.get_synonyms(word, callback)
  local url = "https://api.datamuse.com/words?max=12&ml=" .. word

  vim.fn.jobstart({ "curl", "-s", url }, {
    stdout_buffered = true,

    on_stdout = function(_, data)
      local ok, json = pcall(vim.fn.json_decode, table.concat(data, ""))
      if not ok or not json then
        callback({})
        return
      end

      local synonyms = {}
      for _, entry in ipairs(json) do
        if entry.word then
          table.insert(synonyms, entry.word)
        end
      end
      callback(synonyms)
    end,

    on_stderr = function(_, err)
      callback({})
    end
  })
end

return M
