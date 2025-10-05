local ResidentGameLogic = class("logic.ResidentGameLogic")

function ResidentGameLogic:initialize()
  self:ResetData()
end

function ResidentGameLogic:ResetData()
end

function ResidentGameLogic:CheckOpenPlotRecorded(nowPlotId, keyStr)
  local uid = Data.userData:GetUserUid()
  local recordId = PlayerPrefs.GetInt(keyStr .. uid, 0)
  if recordId ~= 0 and nowPlotId == recordId then
    return true
  end
  return false
end

function ResidentGameLogic:RecordOpenPlot(plotId, keyStr)
  local uid = Data.userData:GetUserUid()
  PlayerPrefs.SetInt(keyStr .. uid, plotId)
end

return ResidentGameLogic
