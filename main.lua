-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local physics = require('physics')
physics.start()


local background = display.newImageRect("./background.png", 360, 570)
background.x = display.contentCenterX
background.y = display.contentCenterY

local platform = display.newImageRect('./platform.png', 300, 50)
platform.x = display.contentCenterX
platform.y = display.contentHeight - 25
physics.addBody(platform, 'static')

local balloon = display.newImageRect('./balloon.png', 112, 112)
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8
physics.addBody(balloon, 'dynamic', { radius = 50, bounce = 0.3 })


