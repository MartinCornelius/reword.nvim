local M = {}

local in_memory = {}
local cache_file = vim.fn.stdpath("data") .. "/reword_cache.json"
local use_persistence = true

local function load_cache()
  local f = io.open(cache_file, "r")
  if not f then return end
  local content = f:read("*a")
  f:close()
  local ok, data = pcall(vim.fn.json_decode, content)
  if ok and type(data) == "table" then
    in_memory = data
  end
end

local function save_cache()
  if not use_persistence then return end
  local f = io.open(cache_file, "w")
  if not f then return end
  f:write(vim.fn.json_encode(in_memory))
  f:close()
end

function M.setup(opts)
  opts = opts or {}
  use_persistence = opts.persist ~= false
  if use_persistence then
    load_cache()
  end
end

function M.clear_cache()
  if use_persistence then
    local f = io.open(cache_file, "w")
    if not f then return end
    f:write("")
    f:close()
  end
end

function M.get_synonyms(word)
  return in_memory[word] and in_memory[word].synonyms
end

function M.set_synonyms(word, synonyms)
  in_memory[word] = in_memory[word] or {}
  in_memory[word].synonyms = synonyms
  save_cache()
end

function M.get_definitions(word)
  return in_memory[word] and in_memory[word].definitions
end

function M.set_definitions(word, definitions)
  in_memory[word] = in_memory[word] or {}
  in_memory[word].definitions = definitions
  save_cache()
end

return M
