-- custom log file
GlobalLogFile = io.open("./log.txt", "w")

function GlobalAddTrackerToTable(table, logPrefix)
  setmetatable(table, {
    __index = function(_, key)
      logError(string.format("[%s] try access %s but not exist", logPrefix, key))
    end
  })
end

local heroBag = require("OfflineSettings.HeroBag")
local userInfo = require("OfflineSettings.UserInfo")
local activity = require("OfflineSettings.ActivityInfo")
local copyInfo = require("OfflineSettings.CopyInfo")
local fleetInfo = require("OfflineSettings.FleetInfo")
local buildingInfo = require("OfflineSettings.BuildingInfo")
local equipInfo = require("OfflineSettings.EquipInfo")
local illustrateInfo = require("OfflineSettings.IllustrateInfo")
local gachaInfo = require("OfflineSettings.GachaInfo")
local userSettings = require('OfflineSettings.UserSettings')

GlobalSettings = {
  uid = userInfo.Uid,
  firstLogin = false,
  heroBag = heroBag,
  activity = activity,
  userInfo = userInfo,
  copyInfo = copyInfo,
  fleetInfo = fleetInfo,
  buildingInfo = buildingInfo,
  equipInfo = equipInfo,
  illustrateInfo = illustrateInfo,
  gachaInfo = gachaInfo,
  userSettings = userSettings
}
