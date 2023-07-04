print("Hello World")

--[[This is a comment]]

local a = 5 --[[ local var ]]
B = 10 --[[ Global var ]]

print(type(B)) 

--[[ Basic operators exists here too ]]

local c = a..B --[[ '..' concatenates two elements ]]

print(#"ok") --[[ returns the length of the string here its 2]]

for i=10,1,-1 --[[ Same as C style for loops ]]
do
    print(i)
end

while(a<20)
do
    print("Ok")
    a = a+1
end

if(a<20)
then
    print("Alright")
elseif(a==20)
then
    print("Still alright")
else
    print("All good")
end

--[[Functions]]
function Max(num1, num2)
    if(num1 > num2) then
        Result = num1
    else
        Result = num2
    end
    return Result
end

Myprint = function(param)
    print("This is my print function -   ##",param,"##")
 end

Myprint(10)


--[[Arrays]]
--[[Indexing starts from the 1, possible to initialize negative values as well]]
Array = {}

for i= -2, 2 do
   Array[i] = i *2
end

for i = -2,2 do
   print(Array[i])
end


-- Multidimensional arrays
Array = {}

for i=1,3 do
   Array[i] = {}
	
   for j=1,3 do
      Array[i][j] = i*j
   end
	
end

-- Accessing the array

for i=1,3 do

   for j=1,3 do
      print(Array[i][j])
   end
	
end

-- Tables
-- they are basically like objects in json so key value pairs
ok = {}
ok["ok"] = "ok"
ok[2] = "damn"


-- Modularisation
--[[
    Basically other lua files which can be used in the current lua code
    hence reusing the code.

    require "mymath"
]]

local mymath =  {}

function mymath.add(a,b)
   print(a+b)
end

function mymath.sub(a,b)
   print(a-b)
end

function mymath.mul(a,b)
   print(a*b)
end

function mymath.div(a,b)
   print(a/b)
end

return mymath	

-- Usage of the above file as a module
--[[ 
mymathmodule = require("mymath")
mymathmodule.add(10,20)
mymathmodule.sub(30,20)
mymathmodule.mul(10,20)
mymathmodule.div(30,20) ]]

-- So just make a table add all the necessary functionalities and then
-- return the table and require this file in other files.

