dofile("functions.lua")
-- globals
debug = true
x = 0
go = 1 -- global to initiate arrow_angle function
step = 0
xi = 400
yi = 400 - 60
table = {}
function love.load(arg)
 background = love.graphics.newImage("asset/plain.jpg")
 arrow = love.graphics.newImage("asset/arrow.png")
end

function love.update(dt)
  if step == 0 then
    if not love.keyboard.isDown('s') then
      x = arrow_angle(x,0,math.pi/2,0.03)
    else
      step = 1
    end
  end
  --launch
  if step == 1 then
    xi = xi + 50*dt
    yi = yi - 5*dt + 10*dt*dt
  end

end

function love.draw(dt)
  love.graphics.print(x, 400,200)
  love.graphics.print(step, 400,210)
  --love.graphics.draw(background,0,0)
  if step == 0 then
    love.graphics.circle('fill',400 ,400-arrow:getHeight(), 32, 32 )
    love.graphics.draw(arrow,400 ,400-arrow:getHeight() ,x,1,1,arrow:getWidth()/2,arrow:getHeight())
  end
  if step == 1 then
  love.graphics.circle('fill', xi*math.cos(x), yi*math.sin(x), 32, 32 )
  end

end
