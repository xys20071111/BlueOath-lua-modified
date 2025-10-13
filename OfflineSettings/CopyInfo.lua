local CopyMetatable = {
    __index = {
        Rid = 2,
        StarLevel = 4,
        IsRunningFight = false,
        LBPoint = 5,
        FirstPassTime = 1,
        DropHeroIds = 1021051,
        SfLv = 1,
        SfPoint = 1,
        SfInfo = {
            {
                Type = 1,
                Info = {
                    {
                        Key = 1,
                        Value = 1
                    }
                }
            }
        },
        SfDot = 1,
        SfLvChoose = 1
    }
}

local plotInfo = {
    BaseInfo = {},
    StarInfo = {},
    MaxCopyId = 5014,
    CopyType = 1
}

local seaInfo = {
    BaseInfo = {
        {
            BaseId = 0,
            Rid = 2,
            StarLevel = 3,
            IsRunningFight = false,
            LBPoint = 5,
            FirstPassTime = 1,
            DropHeroIds = 1021051,
            SfLv = 1,
            SfPoint = 1,
            SfInfo = {
                {
                    Type = 1,
                    Info = {
                        {
                            Key = 1,
                            Value = 1
                        }
                    }
                }
            },
            SfDot = 1,
            SfLvChoose = 1,
        },
        {
            BaseId = 13,
            Rid = 2,
            StarLevel = 3,
            IsRunningFight = false,
            LBPoint = 5,
            FirstPassTime = 1,
            DropHeroIds = 1021051,
            SfLv = 1,
            SfPoint = 1,
            SfInfo = {
                {
                    Type = 1,
                    Info = {
                        {
                            Key = 1,
                            Value = 1
                        }
                    }
                }
            },
            SfDot = 1,
            SfLvChoose = 1,
        }
    },
    StarInfo = {},
    MaxCopyId = 13,
    CopyType = 2
}

for i = 0, 20806 do
    table.insert(plotInfo.BaseInfo, setmetatable({ BaseId = i }, CopyMetatable))
end

local copyInfo = {
    seaInfo,
    plotInfo
}

return copyInfo
