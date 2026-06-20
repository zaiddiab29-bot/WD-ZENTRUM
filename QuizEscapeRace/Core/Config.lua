-- ============================================================================
-- QUIZ ESCAPE RACE - SPIELKONFIGURATION
-- ============================================================================
-- Anpassbare Einstellungen für Spielbalance und Verhalten
-- ============================================================================

local Config = {}

-- AKTIVIEREN/DEAKTIVIEREN VON SYSTEMEN
Config.SYSTEMS_ENABLED = {
    LOBBY = true,
    RACE = true,
    QUIZ = true,
    HAZARD = true,
    EVENTS = true,
    BOSS = true,
    RANKING = true,
    REWARDS = true,
}

-- DEBUG MODUS
Config.DEBUG = {
    ENABLED = false,
    PRINT_EVENTS = true,
    PRINT_QUIZ = true,
    PRINT_HAZARD = true,
    INSTANT_START = false,
    SKIP_TIMER = false,
}

-- SPIELER LIMITIERUNGEN
Config.PLAYER_LIMITS = {
    MIN_PLAYERS = 1,
    MAX_PLAYERS = 10,
    TIMEOUT = 30, -- Sekunden bis Auto-Start
}

-- QUIZ KONFIGURATION
Config.QUIZ = {
    QUESTIONS_PER_RACE = 8,
    TIME_PER_QUESTION = 10,
    CORRECT_ANSWER_RADIUS = 20, -- Studs
    INCORRECT_PENALTY = 0.8, -- 80% Geschwindigkeit
}

-- HAZARD KONFIGURATION
Config.HAZARD = {
    START_DELAY = 15, -- Sekunden bevor Gefahr startet
    ACCELERATION = 1.05, -- 5% pro Sekunde schneller
    DAMAGE_ON_HIT = true,
    ELIMINATION_ON_HIT = true,
}

-- EVENT KONFIGURATION
Config.EVENTS = {
    EVENT_PROBABILITY = 0.3, -- 30% pro Minute
    MIN_TIME_BETWEEN = 20, -- Mindestens 20 Sekunden
    DURATION_MULTIPLIER = 1.0,
}

-- RANKING KONFIGURATION
Config.RANKING = {
    SAVE_STATS = true,
    LEADERBOARD_SIZE = 100,
    RESET_DAILY = false,
}

-- BALANCE EINSTELLUNGEN
Config.BALANCE = {
    COIN_MULTIPLIER = 1.0,
    XP_MULTIPLIER = 1.0,
    HAZARD_DIFFICULTY = 1.0,
    QUIZ_DIFFICULTY = 1.0,
}

return Config
