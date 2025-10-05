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
        Level = 10,
        --秘书舰
        SecretaryId = 1,
        -- 各种游戏币的信息
        Gold = 1000,
        Diamond = 1000,
        Gas = 1000,
        Supply = 1000,
        MainGun = 1000,
        Torpedo = 1000,
        Plane = 1000,
        Other = 1000,
        Retire = 1000,
        Bath = 1000,
        Strategy = 1000,
        Medal = 1000,
        CopyTrainPoint = 1000,
        Tower = 1000,
        FashionPoint = 1000,
        Lucky = 1000,
        GuildContri = 1000,
        TeacherMedal = 1000,
        TeacherPrestige = 1000,
        BattlePassExp = 1000,
        BattlePassGold = 1000,
        PvePt = 1000,
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
