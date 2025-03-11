--- LSP Signature Help module with automatic trigger detection and customizable display
-- @module lsp_signature
-- @field setup Configures automatic signature help for LSP clients
local M = {}
local api = vim.api

-- Configure signature help display with conditional border style
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = vim.g.transparency and "rounded" or "solid",
	focusable = false,
	silent = true,
	max_height = 7,
	close_events = { "CursorMoved", "InsertLeave" },
})

--- Checks if current cursor position matches any trigger characters
-- @param triggerChars (table) List of trigger characters from LSP server
-- @return (boolean) True if trigger character detected
local function check_triggered_chars(triggerChars)
	local cur_line = api.nvim_get_current_line()
	local pos = api.nvim_win_get_cursor(0)[2] -- 0-based column index

	-- Handle edge cases for beginning of line
	local prev_char = pos > 0 and cur_line:sub(pos, pos) or ""
	local curr_char = cur_line:sub(pos + 1, pos + 1)

	for _, char in ipairs(triggerChars) do
		if prev_char == char or curr_char == char then
			return true
		end
	end
	return false
end

--- Sets up automatic signature help for LSP client
-- @param client (table) LSP client object
-- @param bufnr (number) Buffer number
M.setup = function(client, bufnr)
	local capabilities = client.server_capabilities
	if not capabilities.signatureHelpProvider then
		return
	end

	local triggerChars = capabilities.signatureHelpProvider.triggerCharacters
	if not triggerChars or #triggerChars == 0 then
		return
	end

	local group_name = "LspSignature_" .. client.id
	api.nvim_create_augroup(group_name, { clear = true })

	-- Create autocmd with buffer-local handling
	api.nvim_create_autocmd("TextChangedI", {
		group = group_name,
		buffer = bufnr,
		desc = "Trigger LSP signature help on specific characters",
		callback = function()
			-- Use defer to avoid blocking input
			vim.defer_fn(function()
				if check_triggered_chars(triggerChars) then
					vim.lsp.buf.signature_help()
				end
			end, 0)
		end,
	})
end

return M
