local fleetInfo = {
    -- TSelfTactis 的字段
    MaxPower = 500,
    MinPower = 0,

    -- TSelfTactis 的 repeated TTactic 字段
    tactics = {
        -- 第一个 TTactic 对象
        {
            tacticName = "test",
            heroInfo = {1,2},
            modeId = 1,
            strategyId = 101,
            formationId = 1001,
            type = 1
        },
    }
}

return fleetInfo