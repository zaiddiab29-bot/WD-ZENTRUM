-- ============================================================================
-- QUIZ DISPLAY - QUIZ-ANZEIGE UND GUI
-- ============================================================================
-- Rendert Quiz-Fragen auf dem Bildschirm
-- ============================================================================

local QuizDisplay = {}
QuizDisplay.__index = QuizDisplay

local Constants = require(script.Parent.Parent.Parent.Core.Constants)

function QuizDisplay.new(playerGui)
    local self = setmetatable({}, QuizDisplay)
    
    self.playerGui = playerGui
    self.screenGui = nil
    self.questionLabel = nil
    self.answerButtons = {}
    self.timerLabel = nil
    
    return self
end

-- Erstellt Quiz-UI
function QuizDisplay:Create()
    self.screenGui = Instance.new("ScreenGui")
    self.screenGui.Name = "QuizGui"
    self.screenGui.ResetOnSpawn = false
    self.screenGui.Parent = self.playerGui
    
    -- Frage-Label
    self.questionLabel = Instance.new("TextLabel")
    self.questionLabel.Name = "QuestionLabel"
    self.questionLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
    self.questionLabel.Position = UDim2.new(0.1, 0, 0.2, 0)
    self.questionLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    self.questionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.questionLabel.TextScaled = true
    self.questionLabel.TextWrapped = true
    self.questionLabel.Font = Enum.Font.GothamBold
    self.questionLabel.Parent = self.screenGui
    
    -- Timer
    self.timerLabel = Instance.new("TextLabel")
    self.timerLabel.Name = "TimerLabel"
    self.timerLabel.Size = UDim2.new(0.1, 0, 0.1, 0)
    self.timerLabel.Position = UDim2.new(0.45, 0, 0.1, 0)
    self.timerLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    self.timerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.timerLabel.TextScaled = true
    self.timerLabel.Font = Enum.Font.GothamBold
    self.timerLabel.Parent = self.screenGui
    
    -- Antwort-Buttons
    for i = 1, 4 do
        local button = Instance.new("TextButton")
        button.Name = "AnswerButton_" .. i
        button.Size = UDim2.new(0.35, 0, 0.12, 0)
        button.Position = UDim2.new(
            0.1 + ((i - 1) % 2) * 0.4,
            0,
            0.45 + math.floor((i - 1) / 2) * 0.2,
            0
        )
        button.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextScaled = true
        button.Font = Enum.Font.Gotham
        button.Parent = self.screenGui
        
        table.insert(self.answerButtons, button)
    end
end

-- Zeigt Frage an
function QuizDisplay:ShowQuestion(question)
    if not self.screenGui then
        self:Create()
    end
    
    self.questionLabel.Text = question.text
    
    for i, answer in ipairs(question.answers) do
        self.answerButtons[i].Text = answer
        self.answerButtons[i].Visible = true
    end
end

-- Zeigt Timer
function QuizDisplay:UpdateTimer(seconds)
    self.timerLabel.Text = tostring(seconds)
    
    if seconds <= 3 then
        self.timerLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    elseif seconds <= 5 then
        self.timerLabel.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    else
        self.timerLabel.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    end
end

-- Verbirgt Quiz
function QuizDisplay:Hide()
    if self.screenGui then
        self.screenGui.Visible = false
    end
end

-- Zeigt Quiz
function QuizDisplay:Show()
    if self.screenGui then
        self.screenGui.Visible = true
    end
end

-- Gibt Button für Antwort zurück
function QuizDisplay:GetAnswerButton(index)
    return self.answerButtons[index]
end

return QuizDisplay
