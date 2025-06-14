--[[
    /src/ecs/Entity.lua
    ECS Entity methods.
--]]
local Entity = {}
Entity.__index = Entity

-- Declares metatable and assign identifier tables
function Entity:new()
    return setmetatable({
        next_id = 1,
        recycled = {} -- queue of reusables.
    }, self)
end

-- Instantiate an new entity and identifier.
function Entity:create()
    if #self.recycled > 0 then
        return table.remove(self.recycled)
    end
    local id = self.next_id
    self.next_id = self.next_id + 1
    return id
end

-- Remove entity from World and put identifier in queue.
function Entity:destroy(id)
    table.insert(self.recycled, id)
end

return Entity