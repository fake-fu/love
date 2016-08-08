x = 5
a = {} -- empty table
b = { key = x, anotherKey = 10 } -- strings as keys
c = { [x] = b, ["string"] = 10, [34] = 10, [b] = x } -- variables and literals as keys

-- assignment
a[1] = 20
a["foo"] = 50
a[x] = "bar"

-- retrieval
print(b["key"]) -- 5
print(c["string"]) -- 10
print(c[34]) -- 10
print(c[b]) -- 5

c = { [x] = b, ["string"] = 10, [34] = 10, [b] = x } -- variables and literals as keys

-- tamanho da tabela c
pairs(a)



---#LOOPS#---
a = { x = 400, y = 300, [20] = "foo" }
b = { 20, 30, 40 }

for key, value in pairs(a) do
  print(key, value)
end

for index, value in ipairs(b) do
  print(index, value)
end
t = { 24, 25, 8, 13, 1, 40 }
table.insert(t, 50) -- inserts 50 at end
table.insert(t, 3, 89) -- inserts 89 at index 3
table.remove(t, 2) -- removes item at index 2
table.sort(t) -- sorts via the < operator


--strings
s = "foo\nbar"
t = 'he said "hello world"'
u = "Hello \"world\""
v = [[
<html>
  <body>
    <p>Hello world!</p>
  </body>
</html>
]]
