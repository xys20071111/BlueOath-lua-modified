local cjson = require('cjson')

local basicInfo = {
  HeadShow = 1,
  Exp = 100,
  -- 各种游戏币的信息
  Gold = 5000,
  Diamond = 5000,
  Gas = 5000,
  Supply = 5000,
  MainGun = 5000,
  Torpedo = 5000,
  Plane = 5000,
  Other = 5000,
  Retire = 5000,
  Bath = 5000,
  Strategy = 101,
  Medal = 5000,
  CopyTrainPoint = 5000,
  Tower = 5000,
  FashionPoint = 5000,
  Lucky = 5000,
  GuildContri = 5000,
  TeacherMedal = 5000,
  TeacherPrestige = 5000,
  BattlePassExp = 5000,
  BattlePassGold = 5000,
  PvePt = 5
}
-- local userInfo = {
--   Uid = 10001,
--   Uname = "Test123", -- 昵称
--   OrderRecord = {},
--   Level = 100,
--   Exp = 100,
--   SecretaryId = 1, -- 秘书舰，填HeroBag里的HeroId
-- }

local configFile = io.open("./OfflineData/UserData.json")
if not configFile then
  GlobalLogFile:write("没有找到数据文件，请检查文件是否存在。目标文件: ./OfflineData/UserData.json\n")
  return
end
local userData = cjson.decode(configFile:read("a"))
local userInfo = setmetatable(userData, {__index = basicInfo})
configFile:close()

return userInfo