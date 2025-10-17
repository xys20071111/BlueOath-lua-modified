local cjson = require("cjson")

local MAX_HP = 10000000000
local OATH_AFFECTION = 2000000
local MOOD_MAX = 1500000

local basicInfo = {
  CurHp = MAX_HP,             -- 对应常量：HP_COEFFICIENT
  Affection = OATH_AFFECTION, -- 对着config_affection_favor中的affection_max来填，现在这个2000000是可以誓约的值
  Mood = MOOD_MAX,            -- 对着config_affection_mood中的max来填
  Exp = 5,                    -- 经验
  UpdateTime = os.time(),     -- 召唤日期
  PSkill = {                  -- 技能列表
    { PSkillId = 10631, PSkillExp = 10, Level = 10 },
    { PSkillId = 10633, PSkillExp = 10, Level = 10 }
  },
  -- 剩下的参数的作用我就不清楚了
  Rank = 5,  -- 星级或阶级
  Skills = { -- 技能列表
    { SkillId = 501, Level = 10 },
    { SkillId = 502, Level = 8 }
  },

  Intensify = {
    {
      AttrType = 1,
      IntensifyLvl = 1,
      CurExp = 10,
    }
  },
  CombinationInfo = {},
  Equips = {},
  ArrRemouldEffect = {}
}

local function genShipInfo(id, shipId, tempId, level, isMarried)
  local MarryTime = 0
  if isMarried then
    MarryTime = os.time()
  end
  return setmetatable({
    HeroId = id,
    Fashioning = shipId,     --ss_id，到config_fashion里找
    TemplateId = tempId or shipId * 10 + 1,     --ss_id后面加点啥，一般加个1就行
    MarryTime = MarryTime, -- 这个大于0就是已誓约
    Level = level,         -- 等级，下一个也是，不知道为什么有两个
    Lvl = level,
  }, { __index = basicInfo })
end

local heroBag = {
  HeroInfo = {},
  HeroBagSize = 600,
  HeroNum = {
    { TemplateId = 10210511, Num = 80 }
  }
}

local configFile = io.open("./OfflineData/HeroBag.json")
if not configFile then
  GlobalLogFile:write("没有找到舰娘数据文件，请检查文件是否存在。目标文件: ./OfflineData/HeroBag.json\n")
  return
end
local configData = cjson.decode(configFile:read("a"))
for i, v in ipairs(configData) do
  table.insert(heroBag.HeroInfo, genShipInfo(i, v['id'], v['TemplateId'], v['Level'], v['isMarried']))
end
configFile:close()

return heroBag
