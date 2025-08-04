local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function run_script_in_new_tab(entry)
	local script = entry.script
	local dir = entry.path
	local initial_name = "[pnpm] " .. script .. " (running)"

	-- Open a new tab and get the current buffer
	vim.cmd("tabnew")
	local bufnr = vim.api.nvim_get_current_buf()

	-- Start the terminal, which automatically sets buftype = "terminal"
	vim.fn.termopen({ "pnpm", "run", script }, {
		cwd = dir,
		on_exit = function(_, code)
			local status = code == 0 and "✅" or "❌"
			local final_name = string.format("[pnpm] %s (%s)", script, status)
			vim.schedule(function()
				-- Safely rename the buffer to include status
				if vim.api.nvim_buf_is_valid(bufnr) then
					vim.api.nvim_buf_set_name(bufnr, final_name)
					vim.notify("Script '" .. script .. "' exited with code " .. code)
				end
			end)
		end,
	})

	-- Set initial name after termopen (once buffer is valid terminal)
	vim.api.nvim_buf_set_name(bufnr, initial_name)
	vim.cmd("startinsert")
end

local function scripts_picker(opts)
	opts = opts or {}

	local filePath = vim.fn.getcwd()

	local locations = vim.fn.systemlist(
		string.format('find %s -path "*/node_modules/*" -prune -o -name "package.json" -print', filePath)
	)

	if #locations == 0 then
		filePath = vim.fn.expand("%:p:h")
		locations = vim.fn.systemlist(
			string.format('find %s -path "*/node_modules/*" -prune -o -name "package.json" -print', filePath)
		)
		if #locations == 0 then
			error("No package.json found")
		end
	end

	local results = {}
	for _, package_json in ipairs(locations) do
		local file = io.open(package_json, "rb")
		local jsonString = file:read("*a")
		local jsonDecode = vim.fn.json_decode(jsonString)
		local scripts = jsonDecode["scripts"]
		for name, code in pairs(scripts) do
			table.insert(results, {
				path = vim.fs.dirname(package_json),
				name = jsonDecode["name"],
				code = code,
				script = name,
			})
		end
		file:close()
	end

	pickers
		.new(opts, {
			prompt_title = "Scripts",
			finder = finders.new_table({
				results = results,
				entry_maker = function(entry)
					return {
						value = entry,
						display = string.format("%s: %s -> %s", entry.name, entry.script, entry.code) .. entry.path,
						ordinal = entry.name .. " " .. entry.script .. " " .. entry.code,
					}
				end,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(_, map)
				actions.select_default:replace(function(prompt_bufnr)
					actions.close(prompt_bufnr)
					local entry = action_state.get_selected_entry()
					run_script_in_new_tab(entry.value)
				end)
				return true
			end,
		})
		:find()
end

return require("telescope").register_extension({
	setup = function(opts) end,
	exports = {
		scripts = function(opts)
			return scripts_picker(opts)
		end,
	},
})
