local M = {}
local cache = {}

function M.get(word)
  return cache[word]
end

function M.set(word, synonyms)
  cache[word] = synonyms
end

return M
