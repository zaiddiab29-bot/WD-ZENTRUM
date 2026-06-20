-- ============================================================================
-- QUIZ ESCAPE RACE - GLOBALE KONSTANTEN
-- ============================================================================
-- Zentrale Konfiguration für alle Spielsysteme
-- ============================================================================

local Constants = {}

-- SCHWIERIGKEITSGRADE
Constants.DIFFICULTIES = {
    EASY = {
        id = 1,
        name = "Easy",
        displayName = "Green Valley",
        color = Color3.fromRGB(0, 255, 0),
        baseCoins = 100,
        baseXP = 50,
        hazardSpeed = 10,
        quizFrequency = 15, -- Frage alle 15 Sekunden
    },
    MEDIUM = {
        id = 2,
        name = "Medium",
        displayName = "Crystal Ocean",
        color = Color3.fromRGB(0, 100, 255),
        baseCoins = 200,
        baseXP = 100,
        hazardSpeed = 15,
        quizFrequency = 12,
    },
    HARD = {
        id = 3,
        name = "Hard",
        displayName = "Desert Kingdom",
        color = Color3.fromRGB(255, 165, 0),
        baseCoins = 350,
        baseXP = 175,
        hazardSpeed = 20,
        quizFrequency = 10,
    },
    EXPERT = {
        id = 4,
        name = "Expert",
        displayName = "Volcano World",
        color = Color3.fromRGB(255, 0, 0),
        baseCoins = 500,
        baseXP = 250,
        hazardSpeed = 25,
        quizFrequency = 8,
    },
    MASTER = {
        id = 5,
        name = "Master",
        displayName = "Galaxy Realm",
        color = Color3.fromRGB(128, 0, 255),
        baseCoins = 750,
        baseXP = 375,
        hazardSpeed = 30,
        quizFrequency = 6,
    },
    SECRET = {
        id = 6,
        name = "Secret",
        displayName = "Divine Dimension",
        color = Color3.fromRGB(255, 255, 0),
        baseCoins = 1000,
        baseXP = 500,
        hazardSpeed = 35,
        quizFrequency = 5,
    },
}

-- GEFAHRENTYPEN
Constants.HAZARD_TYPES = {
    LAVA_WAVE = "LavaWave",
    POISON_CLOUD = "PoisonCloud",
    SANDSTORM = "Sandstorm",
    BLACK_HOLE = "BlackHole",
    ENERGY_STORM = "EnergyStorm",
}

-- EVENT TYPEN
Constants.EVENT_TYPES = {
    COIN_RAIN = "CoinRain",
    SPEED_STORM = "SpeedStorm",
    TREASURE_DROP = "TreasureDrop",
    GOLDEN_QUESTION = "GoldenQuestion",
    LUCKY_ROUND = "LuckyRound",
}

-- STREAK MULTIPLIKATOREN
Constants.STREAK_MULTIPLIERS = {
    [3] = 1.10,   -- +10%
    [5] = 1.25,   -- +25%
    [10] = 1.50,  -- +50%
    [20] = 2.00,  -- +100%
}

-- RANKING MULTIPLIKATOREN
Constants.RANKING_MULTIPLIERS = {
    [1] = 3.0,    -- Platz 1: 3x
    [2] = 2.0,    -- Platz 2: 2x
    [3] = 1.5,    -- Platz 3: 1.5x
}

-- DROP RARITY
Constants.DROP_RARITY = {
    COMMON = {
        id = 1,
        name = "Common",
        color = Color3.fromRGB(200, 200, 200),
        weight = 50,
    },
    RARE = {
        id = 2,
        name = "Rare",
        color = Color3.fromRGB(0, 200, 255),
        weight = 30,
    },
    EPIC = {
        id = 3,
        name = "Epic",
        color = Color3.fromRGB(128, 0, 255),
        weight = 15,
    },
    LEGENDARY = {
        id = 4,
        name = "Legendary",
        color = Color3.fromRGB(255, 165, 0),
        weight = 4,
    },
    MYTHIC = {
        id = 5,
        name = "Mythic",
        color = Color3.fromRGB(255, 0, 0),
        weight = 0.8,
    },
    EXCLUSIVE = {
        id = 6,
        name = "Exclusive",
        color = Color3.fromRGB(255, 255, 0),
        weight = 0.2,
    },
}

-- TIMER
Constants.TIMERS = {
    COUNTDOWN_DURATION = 3,
    RACE_DURATION = 120, -- 2 Minuten
    QUIZ_DISPLAY_TIME = 10,
    BOSS_QUESTION_TIME = 15,
    EVENT_DURATION = 8,
    HAZARD_CHECK_INTERVAL = 0.5,
}

-- BEWEGUNG
Constants.MOVEMENT = {
    BASE_SPEED = 50,
    SPRINT_SPEED = 75,
    BOOSTED_SPEED = 100,
    SLOW_SPEED = 25,
}

-- BELOHNUNGEN
Constants.REWARDS = {
    CORRECT_ANSWER = {
        coins = 10,
        xp = 5,
    },
    WRONG_ANSWER = {
        coins = 2,
        xp = 1,
    },
    BOSS_REWARD = {
        coins = 100,
        xp = 50,
    },
}

return Constants
