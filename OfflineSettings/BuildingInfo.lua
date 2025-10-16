local BuildingInfo = {
    BuildingInfos = {
        {
            Id = 1,
            Tid = 1, -- 在config_building中找
            Level = 30,
            Status = 6,  -- Waiting
            HeroEffectTimeList = {},
            HeroList = {1}
        },
        {
            Id = 2,
            Tid = 31,
            Level = 12,
            HeroEffectTimeList = {},
            HeroList = {2},
            Status = 6,
            ProductCount = 100,
        },
        {
            Id = 3,
            Tid = 41, -- 宿舍，这个用不到Statue参数
            Level = 13,
            HeroEffectTimeList = {},
            HeroList = {}
        },
        {
            Id = 4,
            Tid = 21,
            Level = 14,
            Status = 6,
            HeroEffectTimeList = {},
            HeroList = {},
            ProductCount = 100
        },
        {
            Id = 5,
            Tid = 51,
            Level = 15,
            Status = 6,
            HeroEffectTimeList = {},
            HeroList = {},
            ProductCount = 100
        },
        {
            Id = 6,
            Tid = 61,
            Level = 16,
            Status = 6,
            HeroEffectTimeList = {},
            HeroList = {},
            ProductCount = 100,
            RecipeId = 0
        },
        {
            Id = 7,
            Tid = 11,
            Level = 17,
            Status = 6,
            HeroEffectTimeList = {},
            HeroList = {},
            ProductCount = 100,
            RecipeId = 0
        }
    },
    LandList = {
        {
            Index = 1,
            BuildingId = 1
        },
        {
            Index = 2,
            BuildingId = 2
        },
        {
            Index = 3,
            BuildingId = 3
        },
        {
            Index = 4,
            BuildingId = 4
        },
        {
            Index = 5,
            BuildingId = 5
        },
        {
            Index = 6,
            BuildingId = 6
        },
        {
            Index = 7,
            BuildingId = 7
        }
    },
    WorkerStrength = 1000,
    WorkerRecover = 1000,
    WorkerUpdateTime = 0,
    LastUpdateTime = os.time(),
    MaxWorkerStrength = 1000,
    SpecialPlotDatas = {},
    NormalPlotDatas = {}
}

return BuildingInfo
