-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Set up the autocommand to run the function when leaving insert mode
-- vim.cmd([[ autocmd InsertLeave * lua _G.conform_format_on_leave() ]])
vim.cmd([[ autocmd BufLeave * silent! update]])

local function create_prettierrc()
	local prettierrc_path = vim.fn.getcwd() .. "/.prettierrc"

	if vim.fn.filereadable(prettierrc_path) == 1 then
		print(".prettierrc already exists")
		return
	end

	local default_config = [[
{
  "semi": false,
  "singleQuote": false,
  "trailingComma": "es5",
  "printWidth": 80,
  "tabWidth": 3,
  "useTabs": true
}
]]

	local file = io.open(prettierrc_path, "w")
	if file then
		file:write(default_config)
		file:close()
		print("Created .prettierrc with default configuration")
	else
		print("Error creating .prettierrc")
	end
end

local function formatNotTelescope()
	local bufType = vim.bo.filetype
	if bufType ~= "TelescopePrompt" and bufType ~= "go" then
		vim.cmd("LazyFormat")
	end
end

vim.api.nvim_create_user_command("CreatePrettierRC", create_prettierrc, {})
vim.api.nvim_create_user_command("FormatIfNotTelescopeBuffer", formatNotTelescope, {})
