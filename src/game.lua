local physics = require('physics')

local DEFAULT_COUNT_VALUE = 0

local GAME = {
	tapCount = DEFAULT_COUNT_VALUE,
	tapText = display.newText(DEFAULT_COUNT_VALUE, display.contentCenterX, 20, native.systemFont, 40)
}

local function pushBalloon(event)
	local balloon = event.target
	balloon:applyLinearImpulse(0, -0.75, balloon.x, balloon.y)
	GAME.incrementTapCount()
end

function GAME.start()
	physics.start()

	local platform = display.newImageRect('./platform.png', 300, 50)
	platform.x = display.contentCenterX
	platform.y = display.contentHeight - 25
	physics.addBody(platform, 'static')

	local balloon = display.newImageRect('./balloon.png', 112, 112)
	balloon.x = display.contentCenterX
	balloon.y = display.contentCenterY
	balloon.alpha = 0.8
	physics.addBody(balloon, 'dynamic', { radius = 50, bounce = 0.3 })
	balloon:addEventListener('tap', pushBalloon)

	GAME.tapText:setFillColor(0, 0, 0)
end

function GAME.incrementTapCount()
	GAME.tapCount = GAME.tapCount + 1
	GAME.tapText.text = GAME.tapCount
end

return GAME
