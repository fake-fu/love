dofile("functions.lua")
-- globals
debug = true
x = 0
go = 1 -- global to initiate arrow_angle function
pressed = "Alemanha"
function love.load(arg)
 background = love.graphics.newImage("asset/plain.jpg")
 arrow = love.graphics.newImage("asset/arrow.png")
end

function love.update(dt)
    pressed = "Alemanha"
    if not love.keyboard.isDown('s') then
      x = arrow_angle(x,0,math.pi/2,0.03)
      pressed = "Alemanha"
    end
end

function love.draw(dt)
  --love.graphics.draw(background,0,0)
  love.graphics.draw(arrow,400 ,400-arrow:getHeight() ,x,1,1,arrow:getWidth()/2,arrow:getHeight())
  love.graphics.rectangle("fill", 400, 400 - arrow:getHeight(), 100, 1)
  love.graphics.print(x, 400,200)
  love.graphics.print(pressed, 400,210)
end
