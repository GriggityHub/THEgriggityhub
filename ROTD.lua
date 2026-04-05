local a=game:GetService"Players"
local b=a.LocalPlayer
local c=game:GetService"RunService"
local d=game:GetService"ReplicatedStorage"
local e=game:GetService"UserInputService"

local f={
enabled=false,
range=50,
fireRate=0.05,
multiHit=1
}

local g={
kills=0,
inRange=0
}

local h=0
local i
local j={1,3,6,12}

local k=Instance.new"ScreenGui"
k.Name="ROTDKillAll"
k.ResetOnSpawn=false
k.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
k.Parent=b.PlayerGui

local l=Instance.new"Frame"
l.Size=UDim2.new(0,240,0,370)
l.Position=UDim2.new(0,20,0,20)
l.BackgroundColor3=Color3.fromRGB(18,18,20)
l.BorderSizePixel=0
l.ClipsDescendants=true
l.Parent=k
Instance.new("UICorner",l).CornerRadius=UDim.new(0,8)

local m=Instance.new"Frame"
m.Size=UDim2.new(1,0,0,36)
m.BackgroundColor3=Color3.fromRGB(28,28,32)
m.BorderSizePixel=0
m.Parent=l
Instance.new("UICorner",m).CornerRadius=UDim.new(0,8)

local n=Instance.new"Frame"
n.Size=UDim2.new(1,0,0,8)
n.Position=UDim2.new(0,0,1,-8)
n.BackgroundColor3=Color3.fromRGB(28,28,32)
n.BorderSizePixel=0
n.Parent=m

local o=Instance.new"TextLabel"
o.Size=UDim2.new(1,-48,1,0)
o.Position=UDim2.new(0,12,0,0)
o.BackgroundTransparency=1
o.Text="rise of the dead  |  kill all"
o.TextColor3=Color3.fromRGB(200,200,210)
o.TextSize=12
o.Font=Enum.Font.GothamMedium
o.TextXAlignment=Enum.TextXAlignment.Left
o.Parent=m

local p=Instance.new"TextButton"
p.Size=UDim2.new(0,28,0,28)
p.Position=UDim2.new(1,-32,0.5,-14)
p.BackgroundTransparency=1
p.Text="❌"
p.TextSize=12
p.Font=Enum.Font.Gotham
p.Parent=m

p.MouseButton1Click:Connect(function()
if i then
i:Disconnect()
i=nil
end
k:Destroy()
end)

local q=Instance.new"ScrollingFrame"
q.Size=UDim2.new(1,0,1,-36)
q.Position=UDim2.new(0,0,0,36)
q.BackgroundTransparency=1
q.BorderSizePixel=0
q.ScrollBarThickness=0
q.CanvasSize=UDim2.new(0,0,0,0)
q.AutomaticCanvasSize=Enum.AutomaticSize.Y
q.Parent=l

local r=Instance.new"UIListLayout"
r.FillDirection=Enum.FillDirection.Vertical
r.SortOrder=Enum.SortOrder.LayoutOrder
r.Padding=UDim.new(0,10)
r.Parent=q

local s=Instance.new"UIPadding"
s.PaddingLeft=UDim.new(0,12)
s.PaddingRight=UDim.new(0,12)
s.PaddingTop=UDim.new(0,10)
s.PaddingBottom=UDim.new(0,10)
s.Parent=q

local function makeLabel(t,u)
local v=Instance.new"TextLabel"
v.Size=UDim2.new(1,0,0,14)
v.BackgroundTransparency=1
v.Text=t
v.TextColor3=Color3.fromRGB(120,120,135)
v.TextSize=11
v.Font=Enum.Font.Gotham
v.TextXAlignment=Enum.TextXAlignment.Left
v.Parent=u
return v
end

local function makeSlider(t,u,v,w,x,y)
local z=Instance.new"Frame"
z.Size=UDim2.new(1,0,0,28)
z.BackgroundTransparency=1
z.Parent=t

local A=Instance.new"Frame"
A.Size=UDim2.new(1,-44,0,4)
A.Position=UDim2.new(0,0,0.5,-2)
A.BackgroundColor3=Color3.fromRGB(50,50,58)
A.BorderSizePixel=0
A.Parent=z
Instance.new("UICorner",A).CornerRadius=UDim.new(1,0)

local B=Instance.new"Frame"
B.Size=UDim2.new((w-u)/(v-u),0,1,0)
B.BackgroundColor3=Color3.fromRGB(29,158,117)
B.BorderSizePixel=0
B.Parent=A
Instance.new("UICorner",B).CornerRadius=UDim.new(1,0)

local C=Instance.new"TextButton"
C.Size=UDim2.new(0,14,0,14)
C.AnchorPoint=Vector2.new(0.5,0.5)
C.Position=UDim2.new((w-u)/(v-u),0,0.5,0)
C.BackgroundColor3=Color3.fromRGB(255,255,255)
C.BorderSizePixel=0
C.Text=""
C.Parent=A
Instance.new("UICorner",C).CornerRadius=UDim.new(1,0)

local D=Instance.new"TextLabel"
D.Size=UDim2.new(0,40,1,0)
D.Position=UDim2.new(1,-40,0,0)
D.BackgroundTransparency=1
D.Text=x<1 and string.format("%.2f",w)or tostring(w)
D.TextColor3=Color3.fromRGB(220,220,230)
D.TextSize=12
D.Font=Enum.Font.GothamMedium
D.TextXAlignment=Enum.TextXAlignment.Right
D.Parent=z

local E=false
local F=w

local function updateFromX(G)
local H=A.AbsolutePosition.X
local I=A.AbsoluteSize.X
local J=math.clamp((G-H)/I,0,1)
local K=u+(v-u)*J
local L=math.floor(K/x+0.5)*x
F=math.clamp(L,u,v)
B.Size=UDim2.new((F-u)/(v-u),0,1,0)
C.Position=UDim2.new((F-u)/(v-u),0,0.5,0)
D.Text=x<1 and string.format("%.2f",F)or tostring(math.floor(F))
y(F)
end

C.MouseButton1Down:Connect(function()
E=true
end)

e.InputChanged:Connect(function(G)
if E and G.UserInputType==Enum.UserInputType.MouseMovement then
updateFromX(G.Position.X)
end
end)

e.InputEnded:Connect(function(G)
if G.UserInputType==Enum.UserInputType.MouseButton1 then
E=false
end
end)

A.InputBegan:Connect(function(G)
if G.UserInputType==Enum.UserInputType.MouseButton1 then
updateFromX(G.Position.X)
end
end)

return z
end

local function makeSnapSlider(t,u,v)
local w=Instance.new"Frame"
w.Size=UDim2.new(1,0,0,28)
w.BackgroundTransparency=1
w.Parent=t

local x=Instance.new"Frame"
x.Size=UDim2.new(1,-44,0,4)
x.Position=UDim2.new(0,0,0.5,-2)
x.BackgroundColor3=Color3.fromRGB(50,50,58)
x.BorderSizePixel=0
x.Parent=w
Instance.new("UICorner",x).CornerRadius=UDim.new(1,0)

local y=Instance.new"Frame"
y.Size=UDim2.new(0,0,1,0)
y.BackgroundColor3=Color3.fromRGB(29,158,117)
y.BorderSizePixel=0
y.Parent=x
Instance.new("UICorner",y).CornerRadius=UDim.new(1,0)

local z=Instance.new"TextButton"
z.Size=UDim2.new(0,14,0,14)
z.AnchorPoint=Vector2.new(0.5,0.5)
z.Position=UDim2.new(0,0,0.5,0)
z.BackgroundColor3=Color3.fromRGB(255,255,255)
z.BorderSizePixel=0
z.Text=""
z.Parent=x
Instance.new("UICorner",z).CornerRadius=UDim.new(1,0)

local A=Instance.new"TextLabel"
A.Size=UDim2.new(0,40,1,0)
A.Position=UDim2.new(1,-40,0,0)
A.BackgroundTransparency=1
A.Text="off"
A.TextColor3=Color3.fromRGB(120,120,135)
A.TextSize=12
A.Font=Enum.Font.GothamMedium
A.TextXAlignment=Enum.TextXAlignment.Right
A.Parent=w

local B=1
local C=false

local function setStop(D)
B=math.clamp(D,1,#u)
local E=(B-1)/(#u-1)
y.Size=UDim2.new(E,0,1,0)
z.Position=UDim2.new(E,0,0.5,0)
local F=u[B]
if F==1 then
A.Text="off"
A.TextColor3=Color3.fromRGB(120,120,135)
else
A.Text=tostring(F)
A.TextColor3=Color3.fromRGB(220,220,230)
end
v(F)
end

local function updateFromX(D)
local E=x.AbsolutePosition.X
local F=x.AbsoluteSize.X
local G=math.clamp((D-E)/F,0,1)
local H=math.floor(G*(#u-1)+0.5)+1
setStop(H)
end

setStop(1)

z.MouseButton1Down:Connect(function()
C=true
end)

e.InputChanged:Connect(function(D)
if C and D.UserInputType==Enum.UserInputType.MouseMovement then
updateFromX(D.Position.X)
end
end)

e.InputEnded:Connect(function(D)
if D.UserInputType==Enum.UserInputType.MouseButton1 then
C=false
end
end)

x.InputBegan:Connect(function(D)
if D.UserInputType==Enum.UserInputType.MouseButton1 then
updateFromX(D.Position.X)
end
end)

return w
end

local function makeToggle(t,u)
local v=Instance.new"Frame"
v.Size=UDim2.new(1,0,0,28)
v.BackgroundTransparency=1
v.Parent=t

local w=Instance.new"TextLabel"
w.Size=UDim2.new(1,-54,1,0)
w.BackgroundTransparency=1
w.Text="enabled"
w.TextColor3=Color3.fromRGB(160,160,175)
w.TextSize=12
w.Font=Enum.Font.Gotham
w.TextXAlignment=Enum.TextXAlignment.Left
w.Parent=v

local x=Instance.new"TextButton"
x.Size=UDim2.new(0,44,0,22)
x.Position=UDim2.new(1,-44,0.5,-11)
x.BackgroundColor3=Color3.fromRGB(50,50,58)
x.BorderSizePixel=0
x.Text=""
x.Parent=v
Instance.new("UICorner",x).CornerRadius=UDim.new(1,0)

local y=Instance.new"Frame"
y.Size=UDim2.new(0,16,0,16)
y.Position=UDim2.new(0,3,0.5,-8)
y.BackgroundColor3=Color3.fromRGB(130,130,145)
y.BorderSizePixel=0
y.Parent=x
Instance.new("UICorner",y).CornerRadius=UDim.new(1,0)

local z=false
x.MouseButton1Click:Connect(function()
z=not z
if z then
x.BackgroundColor3=Color3.fromRGB(29,158,117)
y.Position=UDim2.new(1,-19,0.5,-8)
y.BackgroundColor3=Color3.fromRGB(255,255,255)
else
x.BackgroundColor3=Color3.fromRGB(50,50,58)
y.Position=UDim2.new(0,3,0.5,-8)
y.BackgroundColor3=Color3.fromRGB(130,130,145)
end
u(z)
end)

return v
end

local function makeDivider(t)
local u=Instance.new"Frame"
u.Size=UDim2.new(1,0,0,1)
u.BackgroundColor3=Color3.fromRGB(40,40,46)
u.BorderSizePixel=0
u.Parent=t
return u
end

local t,u

local function makeStatGrid(v)
local w=Instance.new"Frame"
w.Size=UDim2.new(1,0,0,56)
w.BackgroundTransparency=1
w.Parent=v

local function makeStat(x,y,z)
local A=Instance.new"Frame"
A.Size=UDim2.new(0.48,0,1,0)
A.Position=UDim2.new(x,0,0,0)
A.BackgroundColor3=Color3.fromRGB(28,28,32)
A.BorderSizePixel=0
A.Parent=w
Instance.new("UICorner",A).CornerRadius=UDim.new(0,6)

local B=Instance.new"TextLabel"
B.Size=UDim2.new(1,-8,0,14)
B.Position=UDim2.new(0,8,0,6)
B.BackgroundTransparency=1
B.Text=y
B.TextColor3=Color3.fromRGB(100,100,115)
B.TextSize=10
B.Font=Enum.Font.Gotham
B.TextXAlignment=Enum.TextXAlignment.Left
B.Parent=A

local C=Instance.new"TextLabel"
C.Size=UDim2.new(1,-8,0,26)
C.Position=UDim2.new(0,8,0,22)
C.BackgroundTransparency=1
C.Text="0"
C.TextColor3=z and Color3.fromRGB(29,158,117)or Color3.fromRGB(200,200,210)
C.TextSize=20
C.Font=Enum.Font.GothamMedium
C.TextXAlignment=Enum.TextXAlignment.Left
C.Parent=A

return C
end

t=makeStat(0,"kills",true)
u=makeStat(0.52,"in range",false)

return w
end

makeToggle(q,function(v)
f.enabled=v
end)

makeDivider(q)
makeLabel("range (studs)",q)
makeSlider(q,10,600,50,10,function(v)
f.range=v
end)
makeLabel("fire rate (sec)",q)
makeSlider(q,0.01,0.5,0.05,0.01,function(v)
f.fireRate=v
end)
makeLabel("multi-hit",q)
makeSnapSlider(q,j,function(v)
f.multiHit=v
end)
makeDivider(q)
makeStatGrid(q)

local v=false
local w
local x

m.InputBegan:Connect(function(y)
if y.UserInputType==Enum.UserInputType.MouseButton1 then
v=true
w=y.Position
x=l.Position
end
end)

e.InputChanged:Connect(function(y)
if v and y.UserInputType==Enum.UserInputType.MouseMovement then
local z=y.Position-w
l.Position=UDim2.new(
x.X.Scale,
x.X.Offset+z.X,
x.Y.Scale,
x.Y.Offset+z.Y
)
end
end)

e.InputEnded:Connect(function(y)
if y.UserInputType==Enum.UserInputType.MouseButton1 then
v=false
end
end)

i=c.RenderStepped:Connect(function(y)
h=h+y
if h<f.fireRate then return end
if not f.enabled then return end

local z=b.Character
if not z then return end

local A=z:FindFirstChild"HumanoidRootPart"
if not A then return end

local B
local C=z:FindFirstChildWhichIsA"Model"
if C and d.BaseLibrary.Weapons:FindFirstChild(C.Name)then
B=C
end

if not B then return end

local D=B:FindFirstChild"Handle"
if not D or not D:FindFirstChild"BulletOrigin"then return end

h=0

local E=A.CFrame.Position
local F=0

for G,H in pairs(workspace.Entity:GetChildren())do
local I=H:FindFirstChild"Head"
local J=H:FindFirstChild"Zombie"

if I and J and J.Health>0 then
local K=(E-I.CFrame.Position).Magnitude
if K<=f.range then
F=F+1
local L=J.Health
local M=(I.CFrame.Position-E).Unit

local N={}
local O={}

if f.multiHit>1 then
for P=1,f.multiHit do
N[P]={Normal=
Vector3.new(0.20057007670402527,0.038305096328258514,-0.9789303541183472),Part=
I,Index=
P-1,Position=
I.CFrame.Position
}
O[P]={Humanoid=
J,Object=
I,Index=
P-1
}
end
else
N={
[1]={Normal=
Vector3.new(0.20057007670402527,0.038305096328258514,-0.9789303541183472),Part=
I,Index=
0,Position=
I.CFrame.Position
},
[2]={Normal=
Vector3.new(0.5810704827308655,0.7930880784988403,-0.18266992270946503),Part=
I,Index=
0,Position=
I.CFrame.Position
}
}
O={
[1]={Humanoid=J,Object=I,Index=0},
[2]={Humanoid=J,Object=I,Index=0}
}
end

d.Library.RemotesManager.PrimaryFire:FireServer(
C:GetAttribute"StorageItemId",
B,
{ShotPoint=
E,Direction=
M,AmmoData=
{MaxAmmo=100,Ammo=100},TracerColor=
Color3.new(1,1,1),ShotId=
3,HitInfoList=
N,ShotOrigin=
D.BulletOrigin,Victims=
O,TargetPoints=
{[1]=I.CFrame.Position}
}
)

if J.Health<=0 and L>0 then
g.kills=g.kills+1
t.Text=tostring(g.kills)
end
end
end
end

g.inRange=F
u.Text=tostring(F)
end)
