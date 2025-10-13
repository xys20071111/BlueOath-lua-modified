local heroBag = {
  HeroInfo = {
    {
      HeroId = 1,
      CurHp = 100,
      Fashioning = 1021051,  --ss_id
      TemplateId = 10210511, --ss_id后面加点啥
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
      Affection = 0,
      UpdateTime = os.time()
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