local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Aru385/ZMGH_X_NEW/refs/heads/main/ZMGH-UI.lua"))()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local replicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
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
        local origin = args[2] or Camera.CFrame.Position
        
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