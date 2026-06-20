-- ============================================================================
-- QUIZ MANAGER - QUIZ-VERWALTUNG UND KOORDINATION
-- ============================================================================
-- Verwaltet Quiz-Fragen, Antworten und Bewertung
-- ============================================================================

local QuizManager = {}
QuizManager.__index = QuizManager

local Constants = require(script.Parent.Parent.Parent.Core.Constants)
local Signal = require(script.Parent.Parent.Parent.Utilities.SignalSystem)

function QuizManager.new(raceManager)
    local self = setmetatable({}, QuizManager)
    
    self.raceManager = raceManager
    self.currentQuestion = nil
    self.questionIndex = 0
    self.answeredBy = {}
    
    -- Signale
    self.QuestionAsked = Signal.new()
    self.AnswerSubmitted = Signal.new()
    self.CorrectAnswer = Signal.new()
    self.WrongAnswer = Signal.new()
    self.QuizEnded = Signal.new()
    
    return self
end

-- Fragt neue Frage
function QuizManager:AskQuestion(question)
    self.currentQuestion = question
    self.questionIndex = self.questionIndex + 1
    self.answeredBy = {}
    
    self.QuestionAsked:Fire(question)
end

-- Spieler antwortet
function QuizManager:SubmitAnswer(player, answerIndex)
    if self.answeredBy[player.UserId] then
        return -- Spieler hat bereits geantwortet
    end
    
    self.answeredBy[player.UserId] = true
    self.AnswerSubmitted:Fire(player, answerIndex)
    
    if answerIndex == self.currentQuestion.correctAnswer then
        self.CorrectAnswer:Fire(player, self.currentQuestion)
        self.raceManager:AddCorrectAnswer(player)
    else
        self.WrongAnswer:Fire(player, self.currentQuestion)
        self.raceManager:AddWrongAnswer(player)
    end
end

-- Gibt aktuelle Frage zurück
function QuizManager:GetCurrentQuestion()
    return self.currentQuestion
end

-- Gibt Spieler zurück die geantwortet haben
function QuizManager:GetAnsweredPlayers()
    local answered = {}
    for userId, _ in pairs(self.answeredBy) do
        table.insert(answered, userId)
    end
    return answered
end

-- Prüft ob alle Spieler geantwortet haben
function QuizManager:AllPlayersAnswered()
    local activePlayers = self.raceManager:GetActivePlayers()
    return #self:GetAnsweredPlayers() >= #activePlayers
end

return QuizManager
