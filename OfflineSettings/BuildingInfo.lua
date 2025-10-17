local cjson = require("cjson")

local basicInfo = {
    Status = 6, -- Waiting
    HeroEffectTimeList = {},
    Level = 10,
    ProductCount = 100,
    RecipeId = 0
}

local function genBuildingInfo(id, buildingId, heroList)
  return setmetatable({
    Id = id,
    Tid = buildingId,     --ss_id，到config_fashion里找
    HeroList = heroList,
  }, { __index = basicInfo })
end

local BuildingInfo = {
    BuildingInfos = {},
    LandList = {},
    WorkerStrength = 1000,
    WorkerRecover = 1000,
    WorkerUpdateTime = 0,
    LastUpdateTime = os.time(),
    MaxWorkerStrength = 1000,
    SpecialPlotDatas = {},
    NormalPlotDatas = {}
}

local configFile = io.open("./OfflineData/BuildingInfo.json")
if not configFile then
  GlobalLogFile:write("没有找到数据文件，请检查文件是否存在。目标文件: ./OfflineData/BuildingInfo.json\n")
  return
end
local configData = cjson.decode(configFile:read("a"))
for i, v in ipairs(configData) do
  table.insert(BuildingInfo.BuildingInfos, genBuildingInfo(i, v['Tid'], v['HeroList']))
  table.insert(BuildingInfo.LandList, {
    Index = i,
    BuildingId = i
  })
end
configFile:close()

return BuildingInfo
