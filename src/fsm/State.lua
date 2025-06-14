--[[
    /src/fsm/FSM.lua
    State base method.
--]]
local State = {}
State.__index = State

function State:new()
    return setmetatable({}, self)
end

function State:enter(...) end
function State:exit() end
function State:update(dt) end
function State:draw() end
function State:keypressed(key) end
function State:mousepressed(x, y, button, isTouch) end

return State