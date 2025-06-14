local State = require 'src.scenes.State'
local Title = setmetatable({}, {__index = State})

-- Override
---@diagnostic disable-next-line: duplicate-set-field
function Title:draw()
    love.graphics.print("Press Enter to Start")
end

-- Override
---@diagnostic disable-next-line: duplicate-set-field
function Title:keypressed(key)
    if key == "return" then
        self.fsm:switch("game")
    end
end

-- Override
---@diagnostic disable-next-line: duplicate-set-field
function Title:enter(fsm)
    self.fsm = fsm
end

return Title