local cjson = require('cjson')

local configFile = io.open("./OfflineData/UserSettings.json")
if not configFile then
  GlobalLogFile:write("没有找到用户设置文件，请检查文件是否存在。目标文件: ./OfflineData/UserSettings.json\n")
  return
end
local configData = cjson.decode(configFile:read("a"))
configFile:close()

return configData