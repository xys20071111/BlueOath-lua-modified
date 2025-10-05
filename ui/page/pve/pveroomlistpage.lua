local PveRoomListPage = class("UI.Pve.PveRoomListPage", LuaUIPage)

function PveRoomListPage:DoInit()
  self.roomList = {}
  self.refreshTimer = nil
  self.clickRefresh = false
  self.timerCount = 0
  self.copyId = 0
  self.pveRoomPlayerMax = 0
end

function PveRoomListPage:RegisterAllEvent()
  UGUIEventListener.AddButtonOnClick(self.tab_Widgets.btn_close, self._ClickClose, self)
  UGUIEventListener.AddButtonOnClick(self.tab_Widgets.btn_random, self._ClickRandom, self)
  UGUIEventListener.AddButtonOnClick(self.tab_Widgets.btn_refresh, self._ClickRefresh, self)
  UGUIEventListener.AddButtonOnClick(self.tab_Widgets.btn_ok, self._ClickTrue, self)
  UGUIEventListener.AddButtonOnClick(self.tab_Widgets.btn_cancel, self._ClickCancel, self)
  UGUIEventListener.AddButtonOnClick(self.tab_Widgets.btn_noticeClose, self._ClickCloseNotice, self)
  self:RegisterEvent(LuaEvent.RefreshRoomInfo, self._PveRoomOpen, self)
  self:RegisterEvent(LuaEvent.CreatePveRoom, self._PveRoomOpen, self)
  self:RegisterEvent(LuaEvent.GetRoomList, self._RefreshRoomList, self)
  self:RegisterEvent(LuaEvent.PveRoomEnterRoom, self._SendGetList, self)
end

function PveRoomListPage:DoOnOpen()
  self.copyId = self:GetParam()
  self.pveRoomPlayerMax = Logic.pveRoomLogic:GetRoomPlayerMax(self.copyId)
  self.refreshInterval = configManager.GetDataById("config_parameter", 455).value
  Service.pveRoomService:SendGetRoomList(self.copyId, "refresh")
end

function PveRoomListPage:_RefreshRoomList(ret)
  self.roomList = ret.roomList.roomInfo
  self.state = ret.state
  if self.state == "randm" then
    UIHelper.SetUILock(false)
    self:_ClickRandom()
  else
    self:_CreateRoomList()
  end
end

function PveRoomListPage:_CreateRoomList()
  if #self.roomList == 0 then
    self.tab_Widgets.trans_content.gameObject:SetActive(false)
    return
  end
  self.tab_Widgets.trans_content.gameObject:SetActive(true)
  UIHelper.SetInfiniteItemParam(self.tab_Widgets.trans_content, self.tab_Widgets.item_roominfo, #self.roomList, function(tabParts)
    local tabTemp = {}
    for k, v in pairs(tabParts) do
      tabTemp[tonumber(k)] = v
    end
    for index, luaPart in pairs(tabTemp) do
      local ownerName = Logic.pveRoomLogic:GetOwnerName(self.roomList[index])
      local roomInfo = self.roomList[index]
      UIHelper.SetText(luaPart.txt_name, ownerName)
      local inRoomPlayer = roomInfo.RoomUsers
      UIHelper.CreateSubPart(luaPart.item, luaPart.trans_team, self.pveRoomPlayerMax, function(nIndex, tabPart)
        local playerInfo = inRoomPlayer[nIndex]
        tabPart.im_quality.gameObject:SetActive(playerInfo ~= nil)
        tabPart.obj_empty:SetActive(playerInfo == nil)
        if playerInfo ~= nil then
          local headIcon, qualityIcon = Logic.chatLogic:GetUserHead(playerInfo)
          UIHelper.SetImage(tabPart.im_headIcon, headIcon)
          UIHelper.SetImage(tabPart.im_quality, qualityIcon)
        end
      end)
      UGUIEventListener.AddButtonOnClick(luaPart.btn_battle, self._ClickBattle, self, self.roomList[index].RoomId)
    end
  end)
end

function PveRoomListPage:_ClickBattle(go, roomId)
  if not Logic.pveRoomLogic:CheckCanJoinRoom() then
    return
  end
  Service.pveRoomService:SendEnterRoom(roomId)
end

function PveRoomListPage:_PveRoomOpen()
  self:_ClickCloseNotice()
  self:_ClickClose()
end

function PveRoomListPage:_ClickRandom()
  local roomId = Logic.pveRoomLogic:GetRandeRoomId(self.roomList, self.copyId)
  if roomId == 0 then
    self.tab_Widgets.obj_notice:SetActive(true)
  else
    self:_ClickBattle(nil, roomId)
  end
end

function PveRoomListPage:_ClickTrue()
  if not Logic.pveRoomLogic:CheckCanJoinRoom() then
    return
  end
  Service.pveRoomService:SendCreateRoom(self.copyId)
end

function PveRoomListPage:_ClickCancel()
  UIHelper.SetUILock(true)
  self:_ClickCloseNotice()
  Service.pveRoomService:SendGetRoomList(self.copyId, "randm")
end

function PveRoomListPage:_ClickCloseNotice()
  self.tab_Widgets.obj_notice:SetActive(false)
end

function PveRoomListPage:_ClickRefresh()
  if self.clickRefresh == true then
    noticeManager:OpenTipPage(self, UIHelper.GetString(6100043))
    return
  end
  self.timerCount = 0
  self.refreshTimer = self:CreateTimer(function()
    if self.refreshInterval <= self.timerCount then
      self:StopTimer(self.refreshTimer)
      self.clickRefresh = false
      self.refreshTimer = nil
      self.timerCount = 0
    else
      self.timerCount = self.timerCount + 1
    end
  end, 1, -1, false)
  self:StartTimer(self.refreshTimer)
  self.clickRefresh = true
  Service.pveRoomService:SendGetRoomList(self.copyId, "refresh")
end

function PveRoomListPage:_SendGetList(err)
  if err ~= 0 then
    Service.pveRoomService:SendGetRoomList(self.copyId, "refresh")
  end
end

function PveRoomListPage:_ClickClose()
  UIHelper.ClosePage("PveRoomListPage")
end

function PveRoomListPage:DoOnClose()
  if self.refreshTimer ~= nil then
    self:StopTimer(self.refreshTimer)
    self.refreshTimer = nil
  end
end

return PveRoomListPage
