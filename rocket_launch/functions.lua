function arrow_angle(x,a,b,dx)
  if x < b and go == 1 then
    x = x + dx *math.pi
    if x >= b then
      go = 0
    end
  end
  if x > b or go == 0 then
    x = x - dx *math.pi
    if x <= a then
      go = 1
    end
  end
  return x
end
function debug_option(deb)
  if deb == true then
    love.graphics.print(x,20,20)
    love.graphics.print(step, 20,30)
    love.graphics.print(power, 20,40)
  end

end
