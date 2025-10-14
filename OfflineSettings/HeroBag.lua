local MAX_HP = 10000000000
local OATH_AFFECTION = 2000000
local MOOD_MAX = 1500000

local heroBag = {
  HeroInfo = {
    -- 奥克兰
    {
      HeroId = 1,
      CurHp = MAX_HP,             -- 对应常量：HP_COEFFICIENT
      Fashioning = 1021051,       --ss_id，到config_fashion里找
      TemplateId = 10210511,      --ss_id后面加点啥，一般加个1就行
      MarryTime = 0,              -- 这个大于0就是已誓约
      Affection = OATH_AFFECTION, -- 对着config_affection_favor中的affection_max来填，现在这个2000000是可以誓约的值
      Mood = MOOD_MAX,            -- 对着config_affection_mood中的max来填
      Level = 10,                 -- 等级，下一个也是，不知道为什么有两个
      Lvl = 10,
      Exp = 5,                    -- 经验
      PSkill = {                  -- 技能列表
        { PSkillId = 10631, PSkillExp = 10, Level = 10 },
        { PSkillId = 10633, PSkillExp = 10, Level = 10 }
      },
      -- 剩下的参数的作用我就不清楚了
      Rank = 5,  -- 星级或阶级
      Skills = { -- 技能列表
        { SkillId = 501, Level = 10 },
        { SkillId = 502, Level = 8 }
      },

      Intensify = {
        {
          AttrType = 1,
          IntensifyLvl = 1,
          CurExp = 10,
        }
      },
      CombinationInfo = {},
      Equips = {},
      UpdateTime = os.time(),
      ArrRemouldEffect = {}
    },
    -- 萤火虫
    {
      HeroId = 2,
      CurHp = MAX_HP,             -- 对应常量：HP_COEFFICIENT
      Fashioning = 3013011,       --ss_id，到config_fashion里找
      TemplateId = 30130111,      --ss_id后面加点啥，一般加个1就行
      MarryTime = 0,              -- 这个大于0就是已誓约
      Affection = OATH_AFFECTION, -- 对着config_affection_favor中的affection_max来填，现在这个2000000是可以誓约的值
      Mood = MOOD_MAX,            -- 对着config_affection_mood中的max来填
      Level = 10,                 -- 等级，下一个也是，不知道为什么有两个
      Lvl = 10,
      Exp = 5,                    -- 经验
      PSkill = {                  -- 技能列表
        { PSkillId = 10631, PSkillExp = 10, Level = 10 },
        { PSkillId = 10633, PSkillExp = 10, Level = 10 }
      },
      -- 剩下的参数的作用我就不清楚了
      Rank = 5,  -- 星级或阶级
      Skills = { -- 技能列表
        { SkillId = 501, Level = 10 },
        { SkillId = 502, Level = 8 }
      },

      Intensify = {
        {
          AttrType = 1,
          IntensifyLvl = 1,
          CurExp = 10,
        }
      },
      CombinationInfo = {},
      Equips = {},
      UpdateTime = os.time(),
      ArrRemouldEffect = {}
    },
  },
  HeroBagSize = 600,
  HeroNum = {
    { TemplateId = 10210511, Num = 80 }
  }
}

return heroBag
