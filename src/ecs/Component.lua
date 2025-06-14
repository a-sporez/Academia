--[[
    /src/ecs/Component.lua
    ECS component store methods.
--]]
local Component = {}
Component.__index = Component

function Component:new()
    return setmetatable({data = {}}, self)
end

function Component:add(entity_id, component_data)
    self.data[entity_id] = component_data
end

function Component:get(entity_id)
    return self.data[entity_id]
end

function Component:remove(entity_id)
    self.data[entity_id] = nil
end

function Component:has(entity_id)
    return self.data[entity_id] ~= nil
end

return Component