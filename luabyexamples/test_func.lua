dofile("funcs.lua")
print(soma(1,2))
print(...)
a = 2
b = 3
c = 5
for keys, values in pairs(_G) do
  print(keys, values)
end
