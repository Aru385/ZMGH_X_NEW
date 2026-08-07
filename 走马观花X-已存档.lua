local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Aru385/ZMGH_X_NEW/refs/heads/main/ZMGH-UI.lua"))()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local replicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local pplayer = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local lp = game.Players.LocalPlayer
local Mouse = lp:GetMouse()
--local lp = gs("Players").LocalPlayer
local pos = lp.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
local ME = game.Players.LocalPlayer.Character.HumanoidRootPart
local Mouse = game:GetService('Players').LocalPlayer:GetMouse()

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local workspace = game:GetService("Workspace")


local mouse = game.Players.LocalPlayer:GetMouse()
local tp = function(p)
    lp.Character:PivotTo(p)
end
local window = library:new("走马观花X-Havoc")
local creds = window:Tab("基本信息")
--local creds = window:Tab("基本信息",'3460915131')

local bin = creds:section("信息",true)
    bin:Label("你的注入器:"..identifyexecutor())
    bin:Label("作者:小爱")
    bin:Label("走马观花X交流群:758776178")


local gn = window:Tab("主要功能")
local maingn = gn:section("主要功能",true)

maingn:Button("位置仪",function()
-- Made by TheXploiter
 
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local title = Instance.new("TextLabel")
local copy = Instance.new("TextButton")
local pos = Instance.new("TextBox")
local find = Instance.new("TextButton")
 
--Properties:
 
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.639646292, 0, 0.399008662, 0)
Frame.Size = UDim2.new(0, 387, 0, 206)
Frame.Active = true
 
title.Name = "title"
title.Parent = Frame
title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
title.BorderSizePixel = 0
title.Size = UDim2.new(0, 387, 0, 50)
title.Font = Enum.Font.GothamBold
title.Text = "位置仪"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 30.000
title.TextWrapped = true
 
copy.Name = "copy"
copy.Parent = Frame
copy.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
copy.BorderSizePixel = 0
copy.Position = UDim2.new(0.527131796, 0, 0.635922313, 0)
copy.Size = UDim2.new(0, 148, 0, 50)
copy.Font = Enum.Font.GothamSemibold
copy.Text = "复制"
copy.TextColor3 = Color3.fromRGB(255, 255, 255)
copy.TextSize = 20.000
 
pos.Name = "pos"
pos.Parent = Frame
pos.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
pos.BorderSizePixel = 0
pos.Position = UDim2.new(0.0904392749, 0, 0.305825233, 0)
pos.Size = UDim2.new(0, 317, 0, 50)
pos.Font = Enum.Font.GothamSemibold
pos.Text = ""
pos.TextColor3 = Color3.fromRGB(255, 255, 255)
pos.TextSize = 14.000
pos.TextWrapped = true
 
find.Name = "find"
find.Parent = Frame
find.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
find.BorderSizePixel = 0
find.Position = UDim2.new(0.0904392898, 0, 0.635922313, 0)
find.Size = UDim2.new(0, 148, 0, 50)
find.Font = Enum.Font.GothamSemibold
find.Text = "寻找"
find.TextColor3 = Color3.fromRGB(255, 255, 255)
find.TextSize = 20.000
 
-- Scripts:
 
local function UMTQ_fake_script() -- copy.LocalScript 
    local script = Instance.new('LocalScript', copy)
 
    script.Parent.MouseButton1Click:Connect(function()
        setclipboard(script.Parent.Parent.pos.Text)
    end)
end
coroutine.wrap(UMTQ_fake_script)()
local function KJAYG_fake_script() -- Frame.Dragify 
    local script = Instance.new('LocalScript', Frame)
 
    local UIS = game:GetService("UserInputService")
    function dragify(Frame)
        dragToggle = nil
        local dragSpeed = 0
        dragInput = nil
        dragStart = nil
        local dragPos = nil
        function updateInput(input)
            local Delta = input.Position - dragStart
            local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
            game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
        end
        Frame.InputBegan:Connect(function(input)
            if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
                dragToggle = true
                dragStart = input.Position
                startPos = Frame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragToggle = false
                    end
                end)
            end
        end)
        Frame.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)
        game:GetService("UserInputService").InputChanged:Connect(function(input)
            if input == dragInput and dragToggle then
                updateInput(input)
            end
        end)
    end
 
    dragify(script.Parent)
end
coroutine.wrap(KJAYG_fake_script)()
local function EKBNYI_fake_script() -- find.LocalScript 
    local script = Instance.new('LocalScript', find)
 
    script.Parent.MouseButton1Down:Connect(function()
        script.Parent.Parent.pos.Text = tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
    end)
end
coroutine.wrap(EKBNYI_fake_script)()
end)





local function TeleportPlayer(position)
	local player = game.Players.LocalPlayer
	if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
	end
end

local function TeleportToVector3(x, y, z)
	TeleportPlayer(Vector3.new(x, y, z))
end
