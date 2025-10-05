local ActivityGalgameExtraPage = class("UI.Activity.Galgame.ActivityGalgameExtraPage", LuaUIPage)

function ActivityGalgameExtraPage:DoInit()
  self.actId = 0
  self.actConfig = nil
end

function ActivityGalgameExtraPage:DoOnOpen()
  self.actId = self.param and self.param.activityId
  self.actConfig = configManager.GetDataById("config_activity", self.actId)
  self:_ShowPlot()
end

function ActivityGalgameExtraPage:RegisterAllEvent()
  self:RegisterEvent(LuaEvent.GetCopyData, self._ShowPlot, self)
  UGUIEventListener.AddButtonOnClick(self.tab_Widgets.btn_close, self._ClickClose, self)
end

function ActivityGalgameExtraPage:_ShowPlot()
  local ownExpendItem = 0
  local plotCopyIdTab = Logic.activityGalgameLogic:GetGalgamePlotCopy_Extra(self.actConfig.p1[1])
  UIHelper.CreateSubPart(self.tab_Widgets.obj_item, self.tab_Widgets.trans_story, #plotCopyIdTab, function(nIndex, luaPart)
    local plotCopyInfo = Logic.copyLogic:GetCopyDesConfig(plotCopyIdTab[nIndex])
    ownExpendItem = Data.bagData:GetItemNum(plotCopyInfo.activity_item[1])
    luaPart.img_lock:SetActive(ownExpendItem < plotCopyInfo.activity_item[2])
    UIHelper.SetText(luaPart.txt_name, plotCopyInfo.name)
    UIHelper.SetText(luaPart.tx_num, plotCopyInfo.activity_item[2])
    local isClear = Logic.activityGalgameLogic:IsClearCopy(plotCopyInfo.id)
    luaPart.img_passed:SetActive(isClear)
    UGUIEventListener.AddButtonOnClick(luaPart.btn_play, self._OpenPlot, self, plotCopyInfo.id)
    UGUIEventListener.AddButtonOnClick(luaPart.btn_lock, function()
      noticeManager:OpenTipPage(self, UIHelper.GetString(6100019))
    end, self)
  end)
  self.tab_Widgets.tx_num.text = ownExpendItem
end

function ActivityGalgameExtraPage:_OpenPlot(go, plotId)
  local copyData = Data.copyData:GetCopyInfoById(plotId)
  if copyData == nil then
    logError("\230\156\141\229\138\161\229\153\168\230\178\161\230\156\137\229\137\175\230\156\172\230\149\176\230\141\174 plotId\239\188\154", plotId)
    return
  end
  plotManager:OpenPlotByType(PlotTriggerType.plot_copy_display_trigger, plotId)
end

function ActivityGalgameExtraPage:_ClickClose()
  UIHelper.ClosePage("ActivityGalgameExtraPage")
end

function ActivityGalgameExtraPage:DoOnHide()
end

function ActivityGalgameExtraPage:DoOnClose()
end

return ActivityGalgameExtraPage
