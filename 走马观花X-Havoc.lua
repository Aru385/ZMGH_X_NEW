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
    bin:Button("销毁UI",function()
      for _, v in next, services.CoreGui:GetChildren() do
        if v.Name == "ZOUMAGUI" then
          v:Destroy()
        end
      end
    end)
local gn = window:Tab("主要")
local gn = gn:section("主要",true)
local abba = false
gn:Toggle("绘制方框", "", false, function(state)
    abba = state  -- 同步阀门状态
    
    if state then
         local Players=game:GetService("Players")
         local RunService=game:GetService("RunService")
         local Camera=workspace.CurrentCamera
         local lp=Players.LocalPlayer
         local sg=Instance.new("ScreenGui",lp:WaitForChild("PlayerGui"))
         sg.Name="ESP"
         sg.ResetOnSpawn = false
      while abba do
         local Players=game:GetService("Players")
         local RunService=game:GetService("RunService")
         local Camera=workspace.CurrentCamera
         local lp=Players.LocalPlayer

         for _,p in ipairs(Players:GetPlayers())do
         	if p~=lp and not sg:FindFirstChild(p.Name)then
         		local f=Instance.new("Frame")
         		f.Name=p.Name
         		f.BackgroundTransparency=1
         		f.BorderSizePixel=0
         		Instance.new("UIStroke",f).Color=Color3.new(1,0.2,0.2)
         		f.Parent=sg
         	end
         end

         --离
         Players.PlayerRemoving:Connect(function(p)
         	local f=sg:FindFirstChild(p.Name)
         	if f then f:Destroy()end
         end)

         --会适应的
         RunService.RenderStepped:Connect(function()
         	local vp=Camera.ViewportSize
         	for _,f in ipairs(sg:GetChildren())do
         		if f:IsA("Frame")then
         			local p=Players:FindFirstChild(f.Name)
         			local char=p and p.Character
         			if char then
         				local cf,sz=char:GetBoundingBox()
         				if cf and sz then
         					local h=sz/2
         					local corners={ -- 包围盒8个顶点
         						(cf*CFrame.new( h.x, h.y, h.z)).Position,
         						(cf*CFrame.new( h.x, h.y,-h.z)).Position,
         						(cf*CFrame.new( h.x,-h.y, h.z)).Position,
         						(cf*CFrame.new( h.x,-h.y,-h.z)).Position,
         						(cf*CFrame.new(-h.x, h.y, h.z)).Position,
         						(cf*CFrame.new(-h.x, h.y,-h.z)).Position,
         						(cf*CFrame.new(-h.x,-h.y, h.z)).Position,
         						(cf*CFrame.new(-h.x,-h.y,-h.z)).Position,
         					}
         					local minX,minY,maxX,maxY=math.huge,math.huge,-math.huge,-math.huge
         					local vis=false
         					for _,pos in ipairs(corners)do
         						local s,on=Camera:WorldToScreenPoint(pos)
         						if s.Z>0 then
         							vis=true
         							minX=math.min(minX,s.X)
         							minY=math.min(minY,s.Y)
         							maxX=math.max(maxX,s.X)
         							maxY=math.max(maxY,s.Y)
         						end
         					end
         					if vis then
         						f.Position=UDim2.fromOffset(minX,minY)
         						f.Size=UDim2.fromOffset(maxX-minX,maxY-minY)
         						f.Visible=true
         					else
         						f.Visible=false
         					end
         				else
         					f.Visible=false
         				end
         			else
         				f.Visible=false
         			end
         		end
         	end
         end)
         wait(10)
      end
    else
        game.Players.LocalPlayer.PlayerGui.ESP:Destroy()
    end
end)





local hea = false
gn:Toggle("绘制血量", "", false, function(state)
    hea = state  -- 同步阀门状态
    
    if state then
         local Players=game:GetService("Players")
         local RunService=game:GetService("RunService")
         local Camera=workspace.CurrentCamera
         local lp=Players.LocalPlayer
         local sgg=Instance.new("ScreenGui",lp:WaitForChild("PlayerGui"))
         sgg.Name="HealthBars"   -- 独立文件夹，不影响之前的 ESP 边框
         sgg.ResetOnSpawn = false
      while hea do
         local Players=game:GetService("Players")
         local RunService=game:GetService("RunService")
         local Camera=workspace.CurrentCamera
         local lp=Players.LocalPlayer

-- 为已存在的其他玩家创建血条（去重）
         for _,p in ipairs(Players:GetPlayers())do
         	if p~=lp and not sgg:FindFirstChild(p.Name)then
         		local bar=Instance.new("Frame")   -- 外框（黑色描边）
         		bar.Name=p.Name
         		bar.BackgroundTransparency=1
         		bar.BorderSizePixel=0
         		local stroke=Instance.new("UIStroke",bar)
         		stroke.Color=Color3.new(0,0,0)
         		stroke.Thickness=1.5
         		local fill=Instance.new("Frame",bar)   -- 血量填充
         		fill.Name="Fill"
         		fill.Size=UDim2.new(1,0,1,0)
         		fill.BorderSizePixel=0
         		bar.Parent=sgg
         	end
         end

-- 玩家离开
         Players.PlayerRemoving:Connect(function(p)
         	local bar=sgg:FindFirstChild(p.Name)
         	if bar then bar:Destroy()end
         end)

-- 每帧更新位置、大小、血量颜色
         RunService.RenderStepped:Connect(function()
         	local vp=Camera.ViewportSize
         	for _,bar in ipairs(sgg:GetChildren())do
         		if bar:IsA("Frame")then
         			local p=Players:FindFirstChild(bar.Name)
         			local char=p and p.Character
         			local hum=char and char:FindFirstChildOfClass("Humanoid")
         			if hum and char.PrimaryPart then
         				local cf,sz=char:GetBoundingBox()
         				if cf and sz then
					-- 使用包围盒中心点投影来定位血条，放在左侧
         					local centerWorld=(cf*CFrame.new(-sz.x/2 - 0.5, 0, 0)).Position  -- 向左偏0.5单位
         					local screenPos,onScreen=Camera:WorldToScreenPoint(centerWorld)
         					if screenPos.Z>0 then
         						local h=sz.y   -- 包围盒高度作为血条基准高度
         						local scale=500/(screenPos.Z)  -- 距离缩放因子，可根据需要调整
         						local barHeight=math.clamp(h*scale, 20, 80)  -- 限制最小/最大高度
         						local barWidth=4
         						bar.Size=UDim2.fromOffset(barWidth, barHeight)
         						bar.Position=UDim2.fromOffset(screenPos.X - barWidth/2, screenPos.Y - barHeight/2)
						-- 更新填充高度和颜色
         						local fill=bar:FindFirstChild("Fill")
         						if fill then
         							local ratio=hum.Health/hum.MaxHealth
         							fill.Size=UDim2.new(1,0, ratio,0)
         							fill.Position=UDim2.new(0,0, 1-ratio,0)  -- 底部对齐
         							local color
         							local pct=ratio*100
         							if pct>=70 then
         								color=Color3.new(0,1,0)       -- 绿色
         							elseif pct>=30 then
         								color=Color3.new(1,0.65,0)   -- 橙色
         							else
         								color=Color3.new(1,0,0)       -- 红色
         							end
         							fill.BackgroundColor3=color
         						end
         						bar.Visible=true
         					else
         						bar.Visible=false
         					end
         				else
         					bar.Visible=false
         				end
         			else
         				bar.Visible=false
         			end
         		end
         	end
         end)
         wait(10)
      end
    else
        game.Players.LocalPlayer.PlayerGui.HealthBars:Destroy()
    end
end)


local jl = false
gn:Toggle("绘制距离", "", false, function(state)
    jl = state  -- 同步阀门状态
    
    if state then
      
         local Players=game:GetService("Players")
         local RunService=game:GetService("RunService")
         local Camera=workspace.CurrentCamera
         local lp=Players.LocalPlayer
         local sggg=Instance.new("ScreenGui",lp:WaitForChild("PlayerGui"))
         sggg.Name="DistanceLabels"
         sggg.ResetOnSpawn = false
      while jl do
         local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local Camera=workspace.CurrentCamera
local lp=Players.LocalPlayer

-- 为已存在的其他玩家创建标签（去重）
for _,p in ipairs(Players:GetPlayers())do
	if p~=lp and not sggg:FindFirstChild(p.Name)then
		local label=Instance.new("TextLabel")
		label.Name=p.Name
		label.BackgroundTransparency=1
		label.TextColor3=Color3.new(1,1,1)
		label.TextStrokeTransparency=0
		label.TextStrokeColor3=Color3.new(0,0,0)
		label.Font=Enum.Font.SourceSansBold
		label.TextSize=14
		label.Text=""
		label.Parent=sggg
	end
end

-- 玩家离开
Players.PlayerRemoving:Connect(function(p)
	local label=sggg:FindFirstChild(p.Name)
	if label then label:Destroy()end
end)

-- 每帧更新距离和位置
RunService.RenderStepped:Connect(function()
	local myChar=lp.Character
	local myRoot=myChar and myChar:FindFirstChild("HumanoidRootPart")
	for _,label in ipairs(sggg:GetChildren())do
		if label:IsA("TextLabel")then
			local p=Players:FindFirstChild(label.Name)
			local char=p and p.Character
			local root=char and char:FindFirstChild("HumanoidRootPart")
			if myRoot and root then
				-- 计算距离（studs即视为米）
				local dist=math.floor((myRoot.Position-root.Position).Magnitude+0.5)
				label.Text=dist.."m"
				-- 用包围盒底部中心往下偏移一点作为显示位置
				local cf,sz=char:GetBoundingBox()
				if cf and sz then
					local posWorld=(cf*CFrame.new(0,-sz.y/2-0.5,0)).Position
					local screenPos,onScreen=Camera:WorldToScreenPoint(posWorld)
					if screenPos.Z>0 then
						label.Position=UDim2.fromOffset(screenPos.X-label.TextBounds.X/2, screenPos.Y)
						label.Visible=true
					else
						label.Visible=false
					end
				else
					label.Visible=false
				end
			else
				label.Visible=false
			end
		end
	end
end)
         wait(10)
      end
    else
        game.Players.LocalPlayer.PlayerGui.DistanceLabels:Destroy()
    end
end)
local na =false
gn:Toggle("绘制名字", "", false, function(state)
    na = state  -- 同步阀门状态
    
    if state then
      local Players=game:GetService("Players")
      local RunService=game:GetService("RunService")
      local Camera=workspace.CurrentCamera
      local lp=Players.LocalPlayer
      local sgm=Instance.new("ScreenGui",lp:WaitForChild("PlayerGui"))
      sgm.Name="NameTags"
      sgm.ResetOnSpawn = false
      while na do
         local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local Camera=workspace.CurrentCamera
local lp=Players.LocalPlayer

-- 为已存在的其他玩家创建标签（去重用 Name 作为唯一标识）
for _,p in ipairs(Players:GetPlayers())do
	if p~=lp and not sgm:FindFirstChild(p.Name)then
		local label=Instance.new("TextLabel")
		label.Name=p.Name
		label.BackgroundTransparency=1
		label.TextColor3=Color3.new(1,1,1)
		label.TextStrokeTransparency=0
		label.TextStrokeColor3=Color3.new(0,0,0)
		label.Font=Enum.Font.SourceSansBold
		label.TextSize=15
		label.Text=p.DisplayName~=""and p.DisplayName or p.Name
		label.Parent=sgm
	end
end

-- 新玩家加入
Players.PlayerAdded:Connect(function(p)
	if p~=lp and not sgm:FindFirstChild(p.Name)then
		local label=Instance.new("TextLabel")
		label.Name=p.Name
		label.BackgroundTransparency=1
		label.TextColor3=Color3.new(1,1,1)
		label.TextStrokeTransparency=0
		label.TextStrokeColor3=Color3.new(0,0,0)
		label.Font=Enum.Font.SourceSansBold
		label.TextSize=15
		label.Text=p.DisplayName~=""and p.DisplayName or p.Name
		label.Parent=sgm
	end
end)

-- 玩家离开
Players.PlayerRemoving:Connect(function(p)
	local label=sgm:FindFirstChild(p.Name)
	if label then label:Destroy()end
end)

-- 每帧更新位置和名字（可能改名）
RunService.RenderStepped:Connect(function()
	for _,label in ipairs(sgm:GetChildren())do
		if label:IsA("TextLabel")then
			local p=Players:FindFirstChild(label.Name)
			local char=p and p.Character
			if char and char:IsA("Model")then
				-- 更新名字（防止改名）
				if p then label.Text=p.DisplayName~=""and p.DisplayName or p.Name end
				local cf,sz=char:GetBoundingBox()
				if cf and sz then
					local posWorld=(cf*CFrame.new(0,sz.y/2+0.5,0)).Position  -- 头顶上方
					local screenPos,onScreen=Camera:WorldToScreenPoint(posWorld)
					if screenPos.Z>0 then
						-- 根据距离自适应字体大小（可选）
						local dist=(lp.Character and lp.Character.PrimaryPart and (lp.Character.PrimaryPart.Position-posWorld).Magnitude) or 50
						label.TextSize=math.clamp(250/dist,10,20)
						label.Position=UDim2.fromOffset(screenPos.X-label.TextBounds.X/2, screenPos.Y)
						label.Visible=true
					else
						label.Visible=false
					end
				else
					label.Visible=false
				end
			else
				label.Visible=false
			end
		end
	end
end)
         wait(10)
      end
    else
        game.Players.LocalPlayer.PlayerGui.NameTags:Destroy()
    end
end)


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
