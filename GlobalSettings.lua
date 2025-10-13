local heroBag = require("OfflineSettings.HeroBag")
local userInfo = require("OfflineSettings.UserInfo")
local activity = require("OfflineSettings.ActivityInfo")
local copyInfo = require("OfflineSettings.CopyInfo")

-- custom log file
GlobalLogFile = io.open("./log.txt", "w")

GlobalSettings = {
  uid = userInfo.Uid,
  firstLogin = false,
  heroBag = heroBag,
  activity = activity,
  userInfo = userInfo,
  copyInfo = copyInfo
}

function GlobalAddTrackerToTable(table, logPrefix)
  setmetatable(table, {
    __index = function(_, key)
      logError(string.format("[%s] try access %s but not exist", logPrefix, key))
    end
  })
end
