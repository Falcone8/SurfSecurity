local controller = require "SurfSecurity.controller"
local health = require "SurfSecurity.health"

local _M = {}

function _M.go()
	controller.run()
end

function _M.health()
	health.run()
end

function _M.test(update)
	controller.mock(update)
end

return _M
