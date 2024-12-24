local wezterm = require("wezterm")

local function setup(config)
	if wezterm.target_triple == "x86_64-pc-windows-msvc" then
		-- config.front_end = "Software" -- OpenGL doesn't work quite well with RDP.
		-- config.term = "" -- Set to empty so FZF works on windows

		config.default_prog = { "powershell.exe" }

		table.insert(config.launch_menu, { label = "PowerShell", args = { "powershell.exe", "-NoLogo" } })
		table.insert(config.launch_menu, { label = "CMD", args = { "cmd.exe", "-NoLogo" } })

		-- Find installed visual studio version(s) and add their compilation
		-- environment command prompts to the menu
		for _, vsvers in ipairs(wezterm.glob("Microsoft Visual Studio/20*", "C:/Program Files (x86)")) do
			local year = vsvers:gsub("Microsoft Visual Studio/", "")
			table.insert(config.launch_menu, {
				label = "x64 Native Tools VS " .. year,
				args = {
					"cmd.exe",
					"/k",
					"C:/Program Files (x86)/" .. vsvers .. "/BuildTools/VC/Auxiliary/Build/vcvars64.bat",
				},
			})
		end
	else
		config.default_prog = { "/bin/bash", "-l" }
		table.insert(config.launch_menu, { label = "bash", args = { "bash", "-l" } })
		table.insert(config.launch_menu, { label = "fish", args = { "fish", "-l" } })
	end
end

return setup
