local FSM       = require 'src.fsm.FSM'
local Title     = require 'src.fsm.states.Title'
--[[
    /main.lua
--]]

function love.load()
    _G.fsm = FSM:new("title")
    fsm:add('title', Title)
end

function love.update(dt)
    fsm:update(dt)
end

function love.draw()
    fsm:draw()
end

function love.keypressed(key)
    fsm:keypressed(key)
end

function love.mousepressed(x , y, button, isTouch)
    fsm:mousepressed(x, y, button, isTouch)
end
--[[
function love.keyreleased(key)
    
end

function love.mousereleased(x, y, button, isTouch)
    
end
--]]