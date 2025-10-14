local heroBag = {
  HeroInfo = {
    {
      HeroId = 1,
      CurHp = 10000000000, -- 对应常量：HP_COEFFICIENT
      Fashioning = 1021051,  --ss_id，到config_fashion里找
      TemplateId = 10210511, --ss_id后面加点啥，一般加个1就行
      MarryTime = 0, -- 这个大于0应该就是已誓约
      Affection = 2000000, -- 对着config_affection_favor中的affection_min来填，现在这个2000000是可以誓约的值
      Level = 10,
      Lvl = 10,
      Exp = 5,
      Rank = 5,  -- 星级或阶级
      Skills = { -- 技能列表
        { SkillId = 501, Level = 10 },
        { SkillId = 502, Level = 8 }
      },
      PSkill = { -- 技能列表
        { PSkillId = 10631, PSkillExp = 10, Level = 10 },
        { PSkillId = 10633, PSkillExp = 10, Level = 10 }
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
      Mood = 100,
      ArrRemouldEffect = {}
    },
    {
      HeroId = 2,
      CurHp = 10000000000,
      Fashioning = 3013011,  --ss_id
      TemplateId = 30130111, --ss_id后面加点啥
      Level = 2,
      Lvl = 2,
      Exp = 5,
      Rank = 5,  -- 星级或阶级
      Skills = { -- 技能列表
        { SkillId = 501, Level = 10 },
        { SkillId = 502, Level = 8 }
      },
      PSkill = { -- 技能列表
        { PSkillId = 10631, PSkillExp = 10, Level = 10 },
        { PSkillId = 10633, PSkillExp = 10, Level = 10 }
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
      MarryTime = 0,
      Affection = 2000000,
      UpdateTime = os.time(),
      Mood = 100,
      ArrRemouldEffect = {},
      RemouldLV = 1
    },
  },
  -- 英雄背包容量
  HeroBagSize = 600,
  -- 英雄碎片数量列表
  HeroNum = {
    { TemplateId = 10210511, Num = 80 }
  }
}

return heroBag