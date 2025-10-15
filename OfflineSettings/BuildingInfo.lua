local BuildingInfo = {
    BuildingInfos = {
        {
            Id = 1,
            Tid = 1, -- 在config_building中找
            Level = 1,
            Status = 6,  -- Waiting
            HeroEffectTimeList = {},
            HeroList = {1}
        },
        {
            Id = 2,
            Tid = 31,
            Level = 2,
            HeroEffectTimeList = {},
            HeroList = {2},
            Status = 6,
            ProductCount = 100,
        },
        {
            Id = 3,
            Tid = 41, -- 宿舍，这个用不到Statue参数
            Level = 3,
            HeroEffectTimeList = {},
            HeroList = {}
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
