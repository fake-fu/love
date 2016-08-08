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
