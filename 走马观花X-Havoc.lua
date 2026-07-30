local act = game:GetService("ReplicatedFirst").act
act:Destroy()

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

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local workspace = game:GetService("Workspace")





--local CurrentlySavingOrLoading = game.Players.LocalPlayer:WaitForChild("CurrentlySavingOrLoading")
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
    
    
    
    
    
    
local function findNpcCountModel()
	for _, child in ipairs(workspace:GetChildren()) do
		if child:IsA("Model") and child:GetAttribute("npcCount") ~= nil then
			return child
		end
	end
	return nil
end

local function getAiModels(parent)
	local aiModels = {}
	for _, child in ipairs(parent:GetChildren()) do
		if child:IsA("Model") and child:GetAttribute("AI") == true then
			table.insert(aiModels, child)
		end
	end
	return aiModels
end

local function createNameTag(model)
	local hrp = model:FindFirstChild("HumanoidRootPart") or model.PrimaryPart
	if not hrp then return end
	if hrp:FindFirstChild("NPCNameTag") then return end  

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "NPCNameTag"
	billboard.Adornee = hrp
	billboard.Size = UDim2.new(0, 150, 0, 35)
	billboard.StudsOffset = Vector3.new(0, 10, 0)   
	billboard.MaxDistance = 1000
	billboard.AlwaysOnTop = true

	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 1, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)   
	textLabel.TextStrokeTransparency = 0
	textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
	--textLabel.Font = Enum.Font.SourceSansBold
	textLabel.TextScaled = true
	textLabel.Parent = billboard

	billboard.Parent = hrp
end


local function createHighlight(model)
	if model:FindFirstChild("NPCHighlight") then return end
	local highlight = Instance.new("Highlight")
	highlight.Name = "NPCHighlight"
	highlight.FillTransparency = 1             
	highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	highlight.OutlineTransparency = 0
	highlight.Parent = model
end


local function createHealthBar(model)
	local hrp = model:FindFirstChild("HumanoidRootPart") or model.PrimaryPart
	if not hrp then return end
	if hrp:FindFirstChild("NPCHealthBar") then return end

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "NPCHealthBar"
	billboard.Adornee = hrp
	billboard.Size = UDim2.new(0, 7, 0, 50)       
	billboard.StudsOffset = Vector3.new(-3, 0, 0)  --左
	billboard.MaxDistance = 1000
	billboard.AlwaysOnTop = true

	local barFrame = Instance.new("Frame")
	barFrame.Name = "HealthFill"
	barFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
	barFrame.BorderSizePixel = 0
	barFrame.AnchorPoint = Vector2.new(0, 1)      
	barFrame.Position = UDim2.new(0, 1, 1, -1)      
	barFrame.Size = UDim2.new(1, -2, 0, -2)         

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.new(0, 0, 0)
	stroke.Thickness = 1.5
	stroke.Parent = barFrame

	barFrame.Parent = billboard
	billboard.Parent = hrp
end

local function updateUi()
	local npcCountModel = findNpcCountModel()
	if not npcCountModel then return end
	local aiModels = getAiModels(npcCountModel)

	local char = localPlayer.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local playerPos = char.HumanoidRootPart.Position

	for _, model in ipairs(aiModels) do
		local hrp = model:FindFirstChild("HumanoidRootPart") or model.PrimaryPart
		if not hrp then continue end

	
		local nameTag = hrp:FindFirstChild("NPCNameTag")
		if nameTag and nameTag:IsA("BillboardGui") then
			local textLabel = nameTag:FindFirstChild("TextLabel")
			if textLabel then
				local dist = (hrp.Position - playerPos).Magnitude
				textLabel.Text = model.Name .. "\n距离: " .. string.format("%.1f", dist)
			end
		end

		
		local healthBar = hrp:FindFirstChild("NPCHealthBar")
		if healthBar and healthBar:IsA("BillboardGui") then
			local barFrame = healthBar:FindFirstChild("HealthFill")
			if barFrame and barFrame:IsA("Frame") then
				local humanoid = model:FindFirstChildOfClass("Humanoid")
				if humanoid and humanoid.MaxHealth > 0 then
					local healthPercent = math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1)
			
					barFrame.Size = UDim2.new(1, -2, healthPercent, -2)


					if healthPercent > 0.7 then
						barFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 0)   -- 绿
					elseif healthPercent > 0.3 then
						barFrame.BackgroundColor3 = Color3.fromRGB(255, 165, 0) -- 橙
					else
						barFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)   -- 红
					end
				else
					
					barFrame.Size = UDim2.new(1, -2, 0, -2)
					barFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
				end
			end
		end
	end
end


local function checkAndCreate()
	local npcCountModel = findNpcCountModel()
	if not npcCountModel then return end
	local aiModels = getAiModels(npcCountModel)
	for _, model in ipairs(aiModels) do
		createNameTag(model)
		createHighlight(model)
		createHealthBar(model)
	end
end





local gn = window:Tab("主要")
local gn = gn:section("主要",true)


local de = false
gn:Toggle("透视人机", "", false, function(state)
    de = state  -- 同步阀门状态
    
    if state then
      while de do
            
	        checkAndCreate()
         	for _ = 1, 200 do          
		       updateUi()
		       task.wait(0.05)
	        end
	        wait(5)
            
      end
    else
        local workspace = game:GetService("Workspace")

-- 遍历 workspace 下所有对象
for _, child in ipairs(workspace:GetDescendants()) do
    -- 删除名字距离文字 (NPCNameTag)
    if child.Name == "NPCNameTag" and child:IsA("BillboardGui") then
        child:Destroy()
    end
    
    -- 删除血量条 (NPCHealthBar)
    if child.Name == "NPCHealthBar" and child:IsA("BillboardGui") then
        child:Destroy()
    end
    
    if child.Name == "NPCHighlight" and child:IsA("Highlight") then
        child:Destroy()
    end
end
    end
end)

local cloneref = cloneref or function(o) return o end

gn:Button("全图高光",function()

local cloneref = cloneref or function(o) return o end
Lighting = cloneref(game:GetService("Lighting"))
Lighting.Brightness = 2
	Lighting.ClockTime = 14
	Lighting.FogEnd = 100000
	Lighting.GlobalShadows = false
	Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
end)

gn:Button("除雾",function()
local cloneref = cloneref or function(o) return o end
Lighting = cloneref(game:GetService("Lighting"))
    Lighting.FogEnd = 100000
	for i,v in pairs(Lighting:GetDescendants()) do
		if v:IsA("Atmosphere") then
			v:Destroy()
		end
	end
end)



local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local wep = false
gn:Toggle("查看敌人所持武器", "", false, function(state)
    wep = state  -- 同步阀门状态
    
    if state then
        --spawn(function()  -- 使用独立协程
            while wep  do-- 检测阀门状态
                

	-- 1. 找到带 npcCount 属性的 Model
	local targetModel = nil
	for _, obj in ipairs(workspace:GetChildren()) do
		if obj:IsA("Model") and obj:GetAttribute("npcCount") ~= nil then
			targetModel = obj
			break
		end
	end

	if targetModel then
		-- 2. 遍历所有子对象
		for _, child in ipairs(targetModel:GetChildren()) do
			if child:IsA("Model") and child ~= localPlayer.Character then
				local humanoid = child:FindFirstChildOfClass("Humanoid")
				local rootPart = child:FindFirstChild("HumanoidRootPart")
				if humanoid and humanoid.Health > 0 and rootPart then
					-- 3. 查找 Tool 并获取名字
					local tool = child:FindFirstChildOfClass("Tool")
					local toolName = tool and tool.Name
					local displayText = toolName and ("所持武器: " .. toolName) or "所持武器: 无"

					-- 4. 查找已有的标签
					local existingGui = rootPart:FindFirstChild("WeaponDisplay")

					if existingGui then
						-- 已有标签，更新文字
						local textLabel = existingGui:FindFirstChildOfClass("TextLabel")
						if textLabel then
							textLabel.Text = displayText
						end
					else
						-- 没有标签，创建新的
						local billboardGui = Instance.new("BillboardGui")
						billboardGui.Name = "WeaponDisplay"
						billboardGui.Adornee = rootPart
						billboardGui.Size = UDim2.new(0, 130, 0, 20)
						billboardGui.StudsOffsetWorldSpace = Vector3.new(0, -3, 0)
						billboardGui.AlwaysOnTop = true
						billboardGui.MaxDistance = 1000

						local textLabel = Instance.new("TextLabel")
						textLabel.Size = UDim2.new(1, 0, 1, 0)
						textLabel.BackgroundTransparency = 1
						textLabel.TextScaled = true
						textLabel.TextColor3 = Color3.new(1, 1, 1)
						--textLabel.Font = Enum.Font.SourceSansBold
						textLabel.TextStrokeTransparency = 0.5
						textLabel.Text = displayText
						textLabel.Parent = billboardGui

						billboardGui.Parent = rootPart
					end
				end
			end
		end
	end
	        wait(3)
            end
    else
       -- camera.CameraSubject = player.Character.Humanoid
       local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

-- 找到带 npcCount 属性的 Model
local targetModel = nil
for _, obj in ipairs(workspace:GetChildren()) do
	if obj:IsA("Model") and obj:GetAttribute("npcCount") ~= nil then
		targetModel = obj
		break
	end
end

if targetModel then
	for _, child in ipairs(targetModel:GetChildren()) do
		if child:IsA("Model") and child ~= localPlayer.Character then
			local rootPart = child:FindFirstChild("HumanoidRootPart")
			if rootPart then
				local gui = rootPart:FindFirstChild("WeaponDisplay")
				if gui then
				   gui:Destroy()
	            end
--end
            end
        end
    end
end
end
end)


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

-- ===== 替换原有的 hookmetamethod 为以下过滤版本 =====
-- ===== 替换为以下过滤版本 =====
local oldHook
oldHook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if method == "Raycast" and not checkcaller() then
        -- 🔍【精确过滤】检测是否为相机的碰撞射线
        local params = args[3]  -- RaycastParams 通常是第三个参数
        if params and type(params) == "table" and params.FilterDescendantsInstances then
            local filterList = params.FilterDescendantsInstances
            -- 检查是否包含 workspace.Ignored（相机独有特征）
            if type(filterList) == "table" then
                for _, inst in ipairs(filterList) do
                    if inst == workspace.Ignored then
                        -- 这是相机射线，直接放行，不进行任何篡改
                        return oldHook(self, ...)
                    end
                end
            end
        end

        -- ===== 以下为原版子弹追踪逻辑（保持不变） =====
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

    return oldHook(self, ...)
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
