local Registry      = require 'src.ecs.Registry'
local EntityFactory = require 'src.factories.EntityFactory'
--[[
    /src/ecs/World.lua
    Core simulation manager.
--]]
local World = {}
World.__index = World

function World:new()
    local instance          = setmetatable({}, World)
    instance.registry       = Registry:new()
    instance.factory        = EntityFactory:new(instance.registry)
    instance.map            = nil
    instance.initialized    = false
    return instance
end

function World:initialize()
    if self.initialized then return end
    self.initialized = true
    self:loadMap("placeholder")

    -- self.player = self.factory:spawn("placeholder", {x, y})
end

function World:load(mapID)
    self.map = {
        draw = function ()
            love.graphics.print("Loaded map:"..mapID, 10, 20)
        end
    }
end

function World:update(dt)
    self.registry:update(dt)
end

function World:draw()
    if self.map then self.map:draw() end
    self.registry:draw()
end

function World:keypressed(key)
    -- placeholder stub
end

function World:mousepressed(x, y, button, isTouch)
    -- placeholder stub
end

return World