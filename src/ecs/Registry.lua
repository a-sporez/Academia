local Entity    = require 'src.ecs.Entity'
local Component = require 'src.ecs.Component'
--[[
    /src/ecs/Registry.lua
    ECS context store and controller.
--]]
local Registry = {}
Registry.__index = Registry

function Registry:new()
    local reg = {
        entity      = Entity:new(),
        components  = {},
        systems     = {}
    }
    return setmetatable(reg, self)
end

-- Component registration.
function Registry:registerComponent(name)
    self.components[name] = Component:new()
end

function Registry:addComponent(entity_id, name, data)
    self.components[name]:add(entity_id, data)
end

function Registry:getComponent(entity_id, name)
    return self.components[name]:get(entity_id)
end

function Registry:removeComponent(entity_id, name)
    self.components[name]:remove(entity_id)
end

-- Entity life cycle.
function Registry:createEntity()
    return self.entity:create()
end

function Registry:destroyEntity(entity_id)
    for _, store in pairs(self.components) do
        store:remove(entity_id)
    end
    self.entity:destroy(entity_id)
end

--System registration.
function Registry:update(dt)
    for _, sys in ipairs(self.systems) do
        if sys.update then sys:update(self, dt) end
    end
end

function Registry:draw()
    for _, sys in ipairs(self.systems) do
        if sys.draw then sys:draw(self) end
    end
end

function Registry:query(required_components)
    local result = {}
    local first = self.components[required_components[1]]
    if not first then return result end

    for entity_id in pairs(first.data) do
        local valid = true
        for i = 2, #required_components do
            if not self.components[required_components[i]]:has(entity_id) then
                valid = false
                break
            end
        end
        if valid then table.insert(result, entity_id) end
    end
    return result
end

return Registry