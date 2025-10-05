isDebug = true
-- custom log file
GlobalLogFile = io.open("./log.txt", "w")
local uid = 1
local heroBag = {
      HeroBagSize = 500,
      HeroNum = 1,
      HeroInfo = {
        {
          HeroId = 1,
          Lock = true,
        }
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
        --秘书舰
        SecretaryId = -1,
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
        PvePt = 10,
        -- 恢复速度
        RecoverData = {
            { RecoverId = 1, RecoverTime = 10 },
            { RecoverId = 2, RecoverTime = 10 },
            { RecoverId = 3, RecoverTime = 10 },
            { RecoverId = 4, RecoverTime = 10 },
            { RecoverId = 5, RecoverTime = 10 },
            { RecoverId = 6, RecoverTime = 10 },
            { RecoverId = 7, RecoverTime = 10 },
            { RecoverId = 8, RecoverTime = 10 },
            { RecoverId = 9, RecoverTime = 10 },
            { RecoverId = 10, RecoverTime = 10 },
            { RecoverId = 11, RecoverTime = 10 },
            { RecoverId = 12, RecoverTime = 10 },
            { RecoverId = 13, RecoverTime = 10 },
            { RecoverId = 14, RecoverTime = 10 },
            { RecoverId = 15, RecoverTime = 10 },
            { RecoverId = 16, RecoverTime = 10 },
            { RecoverId = 17, RecoverTime = 10 },
            { RecoverId = 18, RecoverTime = 10 },
            { RecoverId = 19, RecoverTime = 10 },
            { RecoverId = 20, RecoverTime = 10 },
            { RecoverId = 21, RecoverTime = 10 },
            { RecoverId = 22, RecoverTime = 10 },
            { RecoverId = 23, RecoverTime = 10 },
            { RecoverId = 24, RecoverTime = 10 },
            { RecoverId = 25, RecoverTime = 10 },
            { RecoverId = 26, RecoverTime = 10 },
            { RecoverId = 27, RecoverTime = 10 },
            { RecoverId = 28, RecoverTime = 10 },
            { RecoverId = 29, RecoverTime = 10 },
            { RecoverId = 3, RecoverTime = 10 }
        }
    }
}
