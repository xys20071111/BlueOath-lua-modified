isDebug = true
-- custom log file
GlobalLogFile = io.open("./log.txt", "w")
local uid = 10001
local heroBag = {
  HeroInfo = {
    {
      HeroId = 1,
      Fashioning = 1021051, --ss_id
      TemplateId = 10210511, --ss_id后面加点啥
      Level = 2,
      Exp = 5,
      Rank = 5,        -- 星级或阶级
      Skills = {       -- 技能列表
        { SkillId = 501, Level = 10 },
        { SkillId = 502, Level = 8 }
      },
      PSkill = {       -- 技能列表
        { PSkillId = 501, PSkillExp = 10, Level = 10 },
        { PSkillId = 502, PSkillExp = 10, Level = 10 }
      },
      Equips = {}
    },
  },
  -- 英雄背包容量
  HeroBagSize = 600,
  -- 英雄碎片数量列表
  HeroNum = {
    { TemplateId = 10210511, Num = 80 }
  }
}

GlobalSettings = {
  uid = uid,
  firstLogin = false,
  heroBag = heroBag,
  userInfo = {
    Uid = uid,
    Uname = "Test123",
    Level = 100,
    Exp = 100,
    -- --秘书舰
    SecretaryId = 1,
    -- 各种游戏币的信息
    Gold = 10,
    Diamond = 10,
    Gas = 10,
    Supply = 10,
    MainGun = 10,
    Torpedo = 10,
    Plane = 10,
    Other = 10,
    Retire = 10,
    Bath = 10,
    Strategy = 10,
    Medal = 10,
    CopyTrainPoint = 10,
    Tower = 10,
    FashionPoint = 10,
    Lucky = 10,
    GuildContri = 10,
    TeacherMedal = 10,
    TeacherPrestige = 10,
    BattlePassExp = 10,
    BattlePassGold = 10,
    PvePt = 1,
  }
}

function GlobalAddTrackerToTable(table, logPrefix)
  setmetatable(table, {
    __index = function(_, key)
      logError(string.format("[%s] try access %s but not exist", logPrefix, key))
    end
  })
end
