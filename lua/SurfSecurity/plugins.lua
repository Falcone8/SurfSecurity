local config = require "SurfSecurity.config"
local log = require "SurfSecurity.logging"

local _M = {}

for _, v in ipairs(config.plugins) do
	local p = require("SurfSecurity.plugins."..v)
	package.loaded["SurfSecurity.plugins."..v] = nil
	if p.triggers then
		for funct, trgs in pairs(p.triggers) do
			for i = 1, #trgs do
				-- interpret any whitespace character in commands just as space
				trgs[i] = trgs[i]:gsub(' ', '%%s+')
			end
			if not p[funct] then
				p.trgs[funct] = nil
				log.warn('triggers ignored in {v}: {funct} function not defined', {v=v, funct=funct})
			end
		end
	end
	table.insert(_M, p)
end

return _M
