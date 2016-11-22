debug = true

playerImg = nil -- this is just for storage
playerQuadPhase = {}

fpsCounter = 0
phase = 0
diff = 0
lastTimeStamp = love.timer.getTime()

function love.load(arg)
  playerImg = love.graphics.newImage('assets/player.png')
  playerQuadPhase[0] = love.graphics.newQuad(0, 0, 40, 100, playerImg:getDimensions())
  playerQuadPhase[1] = love.graphics.newQuad(40, 0, 40, 100, playerImg:getDimensions())
  playerQuadPhase[2] = love.graphics.newQuad(80, 0, 40, 100, playerImg:getDimensions())
  playerQuadPhase[3] = love.graphics.newQuad(120, 0, 40, 100, playerImg:getDimensions())
end


function love.update(dt)
  phase = phase + 1
  if phase > 3
  then
    phase = 0
  end
  
end

function love.draw(dt)
  
  now = love.timer.getTime() 
  diff = diff + now - lastTimeStamp

  if diff >= 1
  then
    love.window.setTitle("FPSmine= " .. fpsCounter .. " FPSintern=" .. love.timer.getFPS())
    fpsCounter = 0
    diff = 0
  end 

  love.graphics.draw(playerImg, playerQuadPhase[phase], 10, 10)
  lastTimeStamp =  now
  fpsCounter = fpsCounter + 1
end





