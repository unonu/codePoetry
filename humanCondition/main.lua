function love.load(ar)
Z	= ar[2]
love.window.setMode(Z,Z)
ID	= love.image.newImageData(Z,Z)
I	= love.graphics.newImage(ID)
C	= love.graphics.newCanvas()
S	= love.graphics.newShader([[
vec4 effect(vec4 C,Image T,vec2 TO,vec2 SO)
{vec4 TC = Texel(T,vec2(SO[0]/]]..Z..[[.,SO[1]/]]..Z..[[.))+
Texel(T,vec2((SO[0]+1)/]]..Z..[[., (SO[1]-1)/]]..Z..[[.));
if((TC)*C==vec4(1.))
return vec4(0.,0.,0.,1.);
return (TC)*C;}
]])
love.graphics.setShader(S)
love.graphics.setBlendMode(ar[3])
end
function love.draw()
C:renderTo(function()love.graphics.draw(I) end)
love.graphics.draw(C)
end
function love.update(dt)
if love.keyboard.isDown('escape') then
love.event.quit() end
local r=math.random(0,Z^2)
if love.mouse.isDown('l') then
ID:setPixel(r%Z,math.floor(r/Z),
math.random(0,128),
math.random(0,128),
math.random(0,128)) end
I:refresh()
ID:mapPixel(function(x,y,r,g,b)R,G,B=C:getPixel(x,y)
if R+G+B==765 then
return 0,0,0,255 end
return	R-(R>0 and 2 or 0),
G-(G>0 and 2 or 0),
B-(B>0 and 2 or 0),255 end)
end