local a=game.Players.LocalPlayer
local b=a.Character or a.CharacterAdded:Wait()
local c=b:WaitForChild"HumanoidRootPart"
local d=game:GetService"UserInputService"

local e
local f=false

local g=Instance.new"ScreenGui"
g.Name="CollectorGui"
g.ResetOnSpawn=false
g.Parent=a.PlayerGui

local h=Instance.new"Frame"
h.Size=UDim2.new(0,220,0,175)
h.Position=UDim2.new(0.5,-110,0.02,0)
h.BackgroundColor3=Color3.fromRGB(20,20,20)
h.BorderSizePixel=0
h.Parent=g
Instance.new("UICorner",h).CornerRadius=UDim.new(0,10)

local i=Instance.new"Frame"
i.Size=UDim2.new(1,0,0,32)
i.BackgroundColor3=Color3.fromRGB(35,35,35)
i.BorderSizePixel=0
i.Parent=h
Instance.new("UICorner",i).CornerRadius=UDim.new(0,10)

local j=Instance.new"TextLabel"
j.Size=UDim2.new(1,-35,1,0)
j.Position=UDim2.new(0,10,0,0)
j.BackgroundTransparency=1
j.Text="🌿 Growable Collector v1.0"
j.TextColor3=Color3.fromRGB(255,255,255)
j.TextSize=13
j.Font=Enum.Font.GothamBold
j.TextXAlignment=Enum.TextXAlignment.Left
j.Parent=i

local k=Instance.new"TextButton"
k.Size=UDim2.new(0,24,0,24)
k.Position=UDim2.new(1,-28,0.5,-12)
k.BackgroundColor3=Color3.fromRGB(200,60,60)
k.BorderSizePixel=0
k.Text="x"
k.TextColor3=Color3.fromRGB(255,255,255)
k.TextSize=14
k.Font=Enum.Font.GothamBold
k.Parent=i
Instance.new("UICorner",k).CornerRadius=UDim.new(0,5)

local l=Instance.new"TextButton"
l.Size=UDim2.new(0,190,0,32)
l.Position=UDim2.new(0.5,-95,0,42)
l.BackgroundColor3=Color3.fromRGB(180,130,40)
l.BorderSizePixel=0
l.Text="📍 Set Return Point"
l.TextColor3=Color3.fromRGB(255,255,255)
l.TextSize=13
l.Font=Enum.Font.GothamBold
l.Parent=h
Instance.new("UICorner",l).CornerRadius=UDim.new(0,7)

local m=Instance.new"TextButton"
m.Size=UDim2.new(0,190,0,32)
m.Position=UDim2.new(0.5,-95,0,82)
m.BackgroundColor3=Color3.fromRGB(50,180,90)
m.BorderSizePixel=0
m.Text=">> Start Collection"
m.TextColor3=Color3.fromRGB(255,255,255)
m.TextSize=13
m.Font=Enum.Font.GothamBold
m.Parent=h
Instance.new("UICorner",m).CornerRadius=UDim.new(0,7)

local n=Instance.new"TextButton"
n.Size=UDim2.new(0,190,0,32)
n.Position=UDim2.new(0.5,-95,0,122)
n.BackgroundColor3=Color3.fromRGB(60,120,220)
n.BorderSizePixel=0
n.Text="<< Return to Point"
n.TextColor3=Color3.fromRGB(255,255,255)
n.TextSize=13
n.Font=Enum.Font.GothamBold
n.Parent=h
Instance.new("UICorner",n).CornerRadius=UDim.new(0,7)


local o,p,q=false
i.InputBegan:Connect(function(r)
if r.UserInputType==Enum.UserInputType.MouseButton1 then
o=true
p=r.Position
q=h.Position
end
end)
i.InputEnded:Connect(function(r)
if r.UserInputType==Enum.UserInputType.MouseButton1 then
o=false
end
end)
d.InputChanged:Connect(function(r)
if o and r.UserInputType==Enum.UserInputType.MouseMovement then
local s=r.Position-p
h.Position=UDim2.new(
q.X.Scale,q.X.Offset+s.X,
q.Y.Scale,q.Y.Offset+s.Y
)
end
end)


local function teleportAndCollect(r)
if r:IsA"BasePart"then
c.CFrame=r.CFrame+Vector3.new(0,3,0)
task.wait(0.1)
game:GetService"ReplicatedStorage":WaitForChild"RemoteEvents":WaitForChild"CollectGrowable":FireServer(r)
end
end

k.MouseButton1Click:Connect(function()
g:Destroy()
end)

l.MouseButton1Click:Connect(function()
e=c.CFrame
l.Text=">> Point Saved!"
l.BackgroundColor3=Color3.fromRGB(100,160,40)
task.wait(1.5)
l.Text="📍 Set Return Point"
l.BackgroundColor3=Color3.fromRGB(180,130,40)
end)

m.MouseButton1Click:Connect(function()
if f then return end
if not e then
m.Text="!! Set a point first!"
task.wait(1.5)
m.Text=">> Start Collection"
return
end
f=true
m.Text="... Collecting"
m.BackgroundColor3=Color3.fromRGB(100,100,100)
for r,s in pairs(game.Workspace.Growables:GetChildren())do
teleportAndCollect(s)
task.wait(0.1)
end
c.CFrame=e
m.Text="** Done!"
task.wait(1.5)
m.Text=">> Start Collection"
m.BackgroundColor3=Color3.fromRGB(50,180,90)
f=false
end)

n.MouseButton1Click:Connect(function()
if e then
c.CFrame=e
else
n.Text="!! No point set!"
task.wait(1.5)
n.Text="<< Return to Point"
end
end)
