class = require 'lib/middleclass'
require 'utils'
require 'game'

function love.load()
  math.randomseed(os.time())
  love.graphics.setBackgroundColor(0, 0, 51)

  -- Start Memory sweep game
  Ms = Game:new(math.random(5), 5)
end

function love.update(dt)
  Ms.revealTimer = Ms.revealTimer + dt

  if not Ms.started then
    if Ms.revealTimer >= 4 then
      Ms:revealGrid(false)
      Ms:start()
    elseif Ms.revealTimer >= 1 then
      Ms:revealGrid(true)
    end
  end
end

function love.draw()
  Ms:draw()
end
