local PveRoomData = class("data.PveRoomData", Data.BaseData)

function PveRoomData:initialize()
  self:ResetData()
end

function PveRoomData:ResetData()
  self.pveRoomData = {}
  self.RefreshBeforeData = {}
end

function PveRoomData:SetData(data)
  if self.RefreshBeforeData.RoomId ~= self.pveRoomData.RoomId then
    self.RefreshBeforeData = {}
  end
  if next(self.pveRoomData) ~= nil and (next(self.RefreshBeforeData) == nil or self.RefreshBeforeData.RoomId == self.pveRoomData.RoomId) then
    self.RefreshBeforeData = self.pveRoomData
  end
  self.pveRoomData = data
end

function PveRoomData:GetPveRoomData()
  return self.pveRoomData
end

function PveRoomData:GetRefreshBeforeData()
  return self.RefreshBeforeData
end

function PveRoomData:GetUserRoomInfo()
  local uid = Data.userData:GetUserUid()
  if self.pveRoomData ~= nil and self.pveRoomData.RoomUsers ~= nil then
    for index = 1, #self.pveRoomData.RoomUsers do
      local userInfo = self.pveRoomData.RoomUsers[index]
      if userInfo and userInfo.Uid == uid then
        return userInfo
      end
    end
  end
  return nil
end

return PveRoomData
