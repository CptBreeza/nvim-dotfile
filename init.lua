local core_modules = {
  "utils",
  "options",
  "mappings",
  "commands"
}

for _, module in ipairs(core_modules) do
  local ok, err = pcall(require, "core."..module)

  if not ok then
    error("Error loading " .. module .. "\n\n" ..err)
  end
end
