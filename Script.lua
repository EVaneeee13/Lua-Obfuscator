repeat wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

local OrionLib = loadstring(game:HttpGet(('https://gist.githubusercontent.com/EVaneeee13/ece75b216bb492eff5339805e5cb9f53/raw/ea390f72663e1026c76bae7e4e0777751f117463/John%2520Hub')))()

local Window = OrionLib:MakeWindow({Name = "John Hub", HidePremium = true, SaveConfig = false, ConfigFolder = "John"})

local Tab = Window:MakeTab({
	Name = "St Patricks Day Event",
	Icon = "rbxassetid://12743386899",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Farming",
	Icon = "rbxassetid://11911613779",
	PremiumOnly = false
})

local Tab3 = Window:MakeTab({
	Name = "Pets",
	Icon = "rbxassetid://9194077649",
	PremiumOnly = false
})

local Tab4 = Window:MakeTab({
	Name = "Miscs",
	Icon = "rbxassetid://9525535512",
	PremiumOnly = false
})

local Tab5 = Window:MakeTab({
	Name = "Information",
	Icon = "rbxassetid://5128872300",
	PremiumOnly = false
})


local Section = Tab:AddSection({
	Name = "St Patricks Day"
})

Tab:AddToggle({
	Name = "Auto Collect Clovers",
	Default = false,
	Callback = function(Value)
        getgenv().CollectClovers = Value
        while getgenv().CollectClovers do
        wait()
        for i,v in pairs(game:GetService("Workspace").Scripts.CollectClovers.Storage:GetDescendants()) do
          if (v.Name == "TouchInterest" and v.Parent) then
          firetouchinterest(game.Players.LocalPlayer.Character.Head, v.Parent, 0)
          wait()
          break;
         end
        end 
	end    
end
})

-------------------------------------------------------------------------------------------------------------------------------

local Farm = Tab2:AddSection({
	Name = "Main Farming!"
})

AutoClick = Tab2:AddToggle({
	Name = "Auto Click",
  Default = false,
  Save = true,
  Flag = "AutoClick",
	Callback = function(Value)
    getgenv().Toggle = Value
    while getgenv().Toggle do
    wait()
    game:GetService("ReplicatedStorage").Events.Click3:FireServer()
    end
end    
})

spawn(function()
  function rebirth(amount)
      local args = {
          [1] = amount
      }
      game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))
    end
end)

local ToggleHighest = Tab2:AddToggle({
Name = "Auto Rebirth Highest Unlocked",
Default = false,
Callback = function(Value)
    getgenv().autorebirth = Value 
    while getgenv().autorebirth == true do 
  wait()
rebirth(game:GetService("Players").LocalPlayer.Upgrades.RebirthButtons.Value)
    end
end
})

local RebirthStatus = Tab2:AddLabel(game:GetService("Players").LocalPlayer.Upgrades.RebirthButtons.Value)

spawn(function()
  while true do wait()
  RebirthStatus:Set("Rebirth Buttons Unlocked : " .. game:GetService("Players").LocalPlayer.Upgrades.RebirthButtons.Value)
    end
end)

------------------------------------------------------------------------------------------------------------------------------


local Pets = Tab3:AddSection({
	Name = "Earn Pets!"
})

function hatch(name, mode)
  local args = {
      [1] = name,
      [2] = mode
  }
  game:GetService("ReplicatedStorage").Functions.Unbox:InvokeServer(unpack(args))
    end
  
  local EggTable = {}
  local Eggs = game:GetService("Workspace").Scripts.Eggs
  
  for _,v in next, Eggs:GetChildren() do
      table.insert(EggTable, v.Name)
  end
  
  local eggchoice;
  local EggChoice = Tab3:AddDropdown({
    Name = "Select Eggs",
    Default = "Please Select The Eggs",
    Options = EggTable,
    Callback = function(PetChoice)
      eggchoice = PetChoice
    end    
  })
  
  local SelectedMode;
  local SelectMode = Tab3:AddDropdown({
    Name = "Select Egg Opening Mode",
    Default = "Please Egg Opening Mode",
    Options = {"Single", "Triple"},
    Callback = function(Option)
      SelectedMode = Option
    end    
  })
  
  local AutoHatch = Tab3:AddToggle({
    Name = "Auto Hatch Egg",
    Default = false,
    Callback = function(Value)
      getgenv().autohatch = Value 
      while getgenv().autohatch == true do 
      hatch(eggchoice, SelectedMode)
          end
    end    
  })

  local EggCombo = Tab3:AddLabel(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.EggCombo.Text)

  spawn(function()
      while true do wait()
      EggCombo:Set(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.EggCombo.Text)
      end
      end)
  

local Pets = Tab3:AddSection({
	Name = "Utilize Pets!"
})

AutoCraft = Tab3:AddToggle({
	Name = "Auto Craft",
	Default = false,
	Callback = function(Value)
    getgenv().Toggle = Value
    while getgenv().Toggle do
    wait()
    game:GetService("ReplicatedStorage").Functions.Request:InvokeServer(table.unpack({"CraftAll",{},}))
    end
   end    
})


---------------------------------------------------------------------------------------------------------------


local Section = Tab4:AddSection({
	Name = "Player Miscs"
})

local Slider = Tab4:AddSlider({
	Name = "Walk Speed",
	Min = 16,
	Max = 400,
	Default = 48,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

local Gravity = Tab4:AddSlider({
	Name = "Gravity",
	Min = 1,
	Max = 1000,
	Default = 196,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Gravity",
	Callback = function(Value)
    game.Workspace.Gravity = Value
	end    
})

local FOV = Tab4:AddSlider({
	Name = "Field Of View (FOV)",
	Min = 10,
	Max = 120,
	Default = 70,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Gravity",
	Callback = function(Value)
    game:GetService'Workspace'.Camera.FieldOfView = Value
	end    
})

local Section = Tab4:AddSection({
	Name = "Game Miscs"
})

local Unlock = Tab4:AddButton({
	Name = "Unlock All Worlds",
	Callback = function()
    for i, v in pairs(game:GetDescendants()) do
      if v.Name =="Unlocked" then
         v.Value = "true"
      end
    end
    
      for i, v in pairs(game:GetDescendants(game:GetService("Workspace").Scripts.Portals)) do
      if v.Name =="LabelUI" then
         v:Destroy()
      end
    end
  	end    
})

local GetChests = Tab4:AddButton({
	Name = "Collect All Chests",
	Callback = function()
    game:GetService("Players").LocalPlayer.Passes.AutoChestCollect.Value = true
    wait(10)
    game:GetService("Players").LocalPlayer.Passes.AutoChestCollect.Value = false
  	end    
})


local GetPass = Tab4:AddButton({
  Name = "Get Some Gamepass",
  Callback = function()
    game:GetService("Players").LocalPlayer.Passes.AutoClicker.Value = true
    game:GetService("Players").LocalPlayer.Passes.AutoRebirth.Value = true
    game:GetService("Players").LocalPlayer.SpaceUpgrades.Teleport.Value = 1
    game:GetService("Players").LocalPlayer.Upgrades.FreeAutoClicker.Value = 1
    game:GetService("Players").LocalPlayer.Upgrades.FasterFreeAutoClicker.Value = 6
  end
})

local GetPassNote = Tab4:AddLabel("Gets Auto Clicker, Auto Rebirth, Teleport + Auto Upgrades Them To Max")


local ClaimDailySpin = Tab4:AddButton({
  Name = "Auto Daily Spin",
  Callback = function()
game:GetService("ReplicatedStorage").Functions.Spin:InvokeServer()
  end
})

local WhiteScreen = Tab4:AddToggle({
	Name = "White Screen [ CPU Saver ]",
	Default = false,
	Callback = function(Value)
    getgenv().Toggle = Value
    while getgenv().Toggle == true do wait()
            if getgenv().Toggle == true then
        game:GetService("RunService"):Set3dRenderingEnabled(false)
        setfpscap(10)
      else 
        game:GetService("RunService"):Set3dRenderingEnabled(true)
        setfpscap(360)
      end
    end
	end    
})

local ServerMisc = Tab4:AddSection({
  Name = "Server Miscs"
  })

local RejoinsServer = Tab4:AddButton({
  Name = "Rejoin",
  Callback = function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
  end
})

local LabelHop = Tab4:AddLabel("Lower Server Hop Taken From V3rm. Credits to owner")

local LowerServer = Tab4:AddButton({
  Name = "Hop To Lower Player",
  Callback = function()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    local File = pcall(function()
      AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
    end)
    if not File then
      table.insert(AllIDs, actualHour)
      writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
    end
    function TPReturner()
      local Site;
      if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
      else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
      end
      local ID = ""
      if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
      end
      local num = 0;
      for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
          for _,Existing in pairs(AllIDs) do
            if num ~= 0 then
              if ID == tostring(Existing) then
                Possible = false
              end
            else
              if tonumber(actualHour) ~= tonumber(Existing) then
                local delFile = pcall(function()
                  delfile("NotSameServers.json")
                  AllIDs = {}
                  table.insert(AllIDs, actualHour)
                end)
              end
            end
            num = num + 1
          end
          if Possible == true then
            table.insert(AllIDs, ID)
            wait()
            pcall(function()
              writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
              wait()
              game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
            end)
            wait(8)
          end
        end
      end
    end
    
    function Teleport()
      while wait() do
        pcall(function()
          TPReturner()
          if foundAnything ~= "" then
            TPReturner()
          end
        end)
      end
    end
    Teleport()
  end
})

for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
  end

-------------------------------------------------------------------------------------------------------------------


local Status = Tab5:AddSection({
	Name = "General Information!"
})



local BeGone = Tab5:AddParagraph("Be Gone!","Hit The - Button To Minimize And The X Button To Close The Script")
    
 local Discord = Tab5:AddButton({
	Name = "Join The Discord!",
	Callback = function()
    setclipboard("https://discord.gg/MnWuEwsB6C")
    OrionLib:MakeNotification({
      Name = "John Hub",
      Content = "Discord Link Copied To Clipboard",
      Image = "rbxassetid://12743016874",
      Time = 1
    })
  end
})

local LabelAFK = Tab5:AddLabel("Anti AFK Is Always Active")
  
OrionLib:MakeNotification({
	Name = "John Hub",
	Content = "Fully Loaded",
	Image = "rbxassetid://12743016874",
	Time = 3
})

OrionLib:Init()
