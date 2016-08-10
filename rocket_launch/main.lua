dofile("functions.lua")
-- globals
debug = true
x = 0
go = 1 -- global to initiate arrow_angle function
step = 0

x0 = 30
y0 = 320
xi = 30

yi = 320
t= 0
power = 0
rocket = {}
frames = {}
function love.load(arg)
 background = love.graphics.newImage("asset/plain.jpg")
 arrow = love.graphics.newImage("asset/arrow.png")
 rocket.img1 = love.graphics.newImage("asset/rocket1.png")
 rocket.img2 = love.graphics.newImage("asset/rocket2.png")
 rocket.sound = love.audio.newSource("asset/rocket.wav","static")
end

function love.update(dt)

  if step == 0 then
    if not love.keyboard.isDown('space') then
      x = arrow_angle(x,0.5,math.pi/2,0.003)
      angulo = x
    else
      step = 0.25
    end
  end
  if step == 0.25 then
    if not love.keyboard.isDown('c')  then
      power = power + 0.5
      if power > 20 then
        power = 0
      end
    else
      step = 1
    end
  end
  --launch
  if step == 1 then
    t = t + dt
    xi = (xi + power*t*math.cos(x))
    yi = (yi - power*t*math.sin(x) + 10*t*t)
    frame = {img= rocket.img2,x= xi,y = yi}
    table.insert(frame,frames)
    angulo = x + t*math.pi/3.4
    if xi > love.graphics.getWidth( ) then
      step = 0
    end
  end
end

function love.draw(dt)
  love.graphics.draw(background,0,0)
  debug_option(debug)
  if step == 0 then
    rocket.sound:stop()
    --love.graphics.circle('fill',x0 ,y0 , 32, 32 )
    love.graphics.draw(rocket.img1,x0 ,y0,x,1,1,rocket.img1:getWidth()/2,rocket.img1:getHeight())
  end
  if step == 0.25 then
    --love.graphics.circle('fill',x0 ,y0 , 32, 32 )
    love.graphics.draw(rocket.img1,x0 ,y0,x,1,1,rocket.img1:getWidth()/2,rocket.img1:getHeight())
    love.graphics.rectangle('fill',x0 + 40, y0, 20, -power)
  end
  if step == 1 then
  for i,frame in ipairs(frames) do
    love.graphics.draw(frame.img,frame.x ,frame.y,angulo,1,1,rocket.img2:getWidth()/2,rocket.img2:getHeight())
  end
  love.graphics.draw(rocket.img2,xi ,yi,angulo,1,1,rocket.img2:getWidth()/2,rocket.img2:getHeight())
  rocket.sound:play()
  --love.graphics.circle('fill', xi , yi , 32, 32 )
  end


end
