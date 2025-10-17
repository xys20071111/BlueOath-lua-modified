local cjson = require("cjson")

local fleetInfo = {
    -- TSelfTactis 的字段
    MaxPower = 500,
    MinPower = 0,

    -- TSelfTactis 的 repeated TTactic 字段
    tactics = {
        -- 第一个 TTactic 对象
        -- {
        --     tacticName = "test", -- 舰队名称
        --     heroInfo = {1,2}, -- 舰娘，table里填HeroBag里的HeroId
        --     modeId = 1, -- 这个modeId貌似是指这是第几舰队
        --     strategyId = 101, -- 战术，在config_strategy里
        --     formationId = 1001, -- 不知道是干啥的
        --     type = 1
        -- },
        -- {
        --     tacticName = "test2",
        --     heroInfo = {1,2},
        --     modeId = 2,
        --     strategyId = 101,
        --     formationId = 1001,
        --     type = 1
        -- },
    }
}

local configFile = io.open("./OfflineData/FleetInfo.json")
if not configFile then
  GlobalLogFile:write("没有找到舰娘数据文件，请检查文件是否存在。目标文件: ./OfflineData/FleetInfo.json\n")
  return
end
local configData = cjson.decode(configFile:read("a"))
for _, v in ipairs(configData) do
  table.insert(fleetInfo.tactics, v)
end
configFile:close()

return fleetInfo