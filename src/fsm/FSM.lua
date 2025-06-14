--[[
    /src/fsm/FSM.lua
    Finite State Machine
--]]
local FSM = {}
FSM.__index = FSM

function FSM:new(initial)
    local obj = {
        current = initial,
        states = {}
    }
    return setmetatable(obj, self)
end

function FSM:add(name, state)
    self.states[name] = state
end

function FSM:switch(name, ...)
    if self.current and self.states[self.current].exit then
        self.states[self.current]:exit()
    end
    self.current = name
    if self.current and self.states[name].enter then
        self.states[name]:enter(...)
    end
end

function FSM:update(dt)
    if self.current then
        self.states[self.current]:update(dt)
    end
end

function FSM:draw()
    if self.current then
        self.states[self.current]:draw()
    end
end

function FSM:keypressed(key)
    if self.current and self.states[self.current].keypressed then
        self.states[self.current]:keypressed(key)
    end
end

function FSM:mousepressed(x, y, button, isTouch)
    if self.current and self.states[self.current].mousepressed then
        self.states[self.current]:mousepressed(x, y, button, isTouch)
    end
end

return FSM