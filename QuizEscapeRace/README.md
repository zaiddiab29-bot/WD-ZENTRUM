# Quiz Escape Race - Roblox Multiplayer Game System

## 🎮 Überblick
Quiz Escape Race ist ein vollständiges Multiplayer-Rennspiel mit Quiz-Mechanik, Verfolgern und dynamischen Events.

## 📁 Projektstruktur

```
QuizEscapeRace/
├── Core/
│   ├── GameManager.lua          # Hauptspiel-Koordinator
│   ├── Constants.lua             # Globale Konstanten
│   └── Config.lua               # Spielkonfiguration
├── Systems/
│   ├── Lobby/
│   │   ├── LobbyManager.lua     # Lobby-Steuerung
│   │   └── PortalSystem.lua     # Portal-Verwaltung
│   ├── Race/
│   │   ├── RaceManager.lua      # Rennen-Koordinator
│   │   ├── RaceTrack.lua        # Strecken-Definition
│   │   └── PlayerMovement.lua   # Spieler-Bewegung
│   ├── Quiz/
│   │   ├── QuizSystem.lua       # Quiz-Logik
│   │   ├── QuestionGenerator.lua # Fragen-Generator
│   │   └── AnswerValidator.lua  # Antwort-Validierung
│   ├── Hazard/
│   │   ├── HazardSystem.lua     # Verfolgersystem
│   │   └── HazardTypes.lua      # Gefahrentypen
│   ├── Events/
│   │   ├── EventSystem.lua      # Event-Manager
│   │   └── EventTypes.lua       # Event-Definitionen
│   ├── Boss/
│   │   ├── BossQuestionSystem.lua # Boss-Fragen
│   │   └── BossRewards.lua      # Boss-Belohnungen
│   ├── Rewards/
│   │   ├── RewardSystem.lua     # Belohnungs-System
│   │   ├── StreakSystem.lua     # Streak-Multiplier
│   │   └── DropSystem.lua       # Loot-Drop-System
│   └── Ranking/
│       ├── RankingSystem.lua    # Platzierung
│       └── LeaderboardSystem.lua # Bestenliste
├── UI/
│   ├── LobbyUI.lua              # Lobby-UI
│   ├── RaceUI.lua               # Race-UI
│   ├── QuizUI.lua               # Quiz-UI
│   └── RewardUI.lua             # Reward-UI
├── Utilities/
│   ├── DataManager.lua          # Daten-Verwaltung
│   ├── SignalSystem.lua         # Event-System
│   └── Helpers.lua              # Hilfsfunktionen
└── Main.lua                     # Entry Point
```

## 🚀 Features

### Phase 1: Core Systems
- ✅ Lobby mit Portalen (6 Schwierigkeitsgrade)
- ✅ Rennen-Mechanik mit Countdown
- ✅ Quiz während des Rennens
- ✅ Verfolgersystem mit 5 Gefahrentypen

### Phase 2: Events & Bosses
- ✅ 5 dynamische Events
- ✅ Boss-Fragen vor dem Ziel
- ✅ Streaks & Multiplikatoren
- ✅ Erweiterte Belohnungen

### Phase 3: Ranking & Drops
- ✅ Ranking-System mit Multiplikatoren
- ✅ Drop-System (Common bis Exclusive)
- ✅ Persistente Statistiken
- ✅ Bestenlisten

## 📖 Verwendung

Siehe die einzelnen System-Dateien für detaillierte Dokumentation.

## 🔧 Erweiterbarkeit

Jedes System ist vollständig modular und kann unabhängig erweitert werden:
- Neue Fragen → `QuestionGenerator.lua`
- Neue Gefahren → `HazardTypes.lua`
- Neue Events → `EventTypes.lua`
- Neue Maps → `RaceTrack.lua`
