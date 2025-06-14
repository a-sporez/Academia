--[[
    /src/scenes/Scene.lua
    Mase method for scenes.
--]]
local Scene = {}
Scene.__index = Scene

function Scene:new()
    return setmetatable({}, self)
end

function Scene:enter(...) end
function Scene:exit() end
function Scene:update(dt) end
function Scene:draw() end
function Scene:keypressed(key) end
function Scene:mousepressed(x, y, button, isTouch) end

return Scene