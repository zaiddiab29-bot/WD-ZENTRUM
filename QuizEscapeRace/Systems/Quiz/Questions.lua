-- ============================================================================
-- QUESTIONS DATABASE - FRAGEN-DATENBANK
-- ============================================================================
-- Zentrale Sammlung aller Quiz-Fragen
-- ============================================================================

local Questions = {}

-- EASY LEVEL FRAGEN
Questions.EASY = {
    {
        id = 1,
        text = "Was ist die Hauptstadt von Frankreich?",
        answers = {"Paris", "Lyon", "Marseille", "Nizza"},
        correctAnswer = 1,
        difficulty = "EASY",
    },
    {
        id = 2,
        text = "Wie viele Kontinente gibt es?",
        answers = {"5", "6", "7", "8"},
        correctAnswer = 3,
        difficulty = "EASY",
    },
    {
        id = 3,
        text = "Welcher Planet ist der größte?",
        answers = {"Saturn", "Jupiter", "Neptune", "Uranus"},
        correctAnswer = 2,
        difficulty = "EASY",
    },
}

-- MEDIUM LEVEL FRAGEN
Questions.MEDIUM = {
    {
        id = 101,
        text = "In welchem Jahr fiel die Berliner Mauer?",
        answers = {"1987", "1988", "1989", "1990"},
        correctAnswer = 3,
        difficulty = "MEDIUM",
    },
    {
        id = 102,
        text = "Wer schrieb 'Don Quixote'?",
        answers = {"Shakespeare", "Cervantes", "Dante", "Petrarca"},
        correctAnswer = 2,
        difficulty = "MEDIUM",
    },
    {
        id = 103,
        text = "Was ist die Formelzeichen für Gold?",
        answers = {"Go", "Gd", "Au", "Ag"},
        correctAnswer = 3,
        difficulty = "MEDIUM",
    },
}

-- HARD LEVEL FRAGEN
Questions.HARD = {
    {
        id = 201,
        text = "Welcher Künstler hat 'Die Sternennacht' gemalt?",
        answers = {"Pablo Picasso", "Vincent van Gogh", "Claude Monet", "Henri Matisse"},
        correctAnswer = 2,
        difficulty = "HARD",
    },
    {
        id = 202,
        text = "Wie heißt das chemische Element mit der Ordnungszahl 92?",
        answers = {"Thorium", "Plutonium", "Uran", "Neptunium"},
        correctAnswer = 3,
        difficulty = "HARD",
    },
    {
        id = 203,
        text = "In welchem Land befindet sich die Taj Mahal?",
        answers = {"Pakistan", "Bangladesh", "Indien", "Nepal"},
        correctAnswer = 3,
        difficulty = "HARD",
    },
}

-- EXPERT LEVEL FRAGEN
Questions.EXPERT = {
    {
        id = 301,
        text = "Wer war der erste Präsident der Vereinigten Staaten?",
        answers = {"Thomas Jefferson", "George Washington", "John Adams", "James Madison"},
        correctAnswer = 2,
        difficulty = "EXPERT",
    },
    {
        id = 302,
        text = "Wie viele Symphonien schrieb Ludwig van Beethoven?",
        answers = {"8", "9", "10", "11"},
        correctAnswer = 2,
        difficulty = "EXPERT",
    },
}

-- MASTER LEVEL FRAGEN
Questions.MASTER = {
    {
        id = 401,
        text = "Was ist das Höchste Gebirge der Welt?",
        answers = {"K2", "Kangchenjunga", "Mount Everest", "Lhotse"},
        correctAnswer = 3,
        difficulty = "MASTER",
    },
    {
        id = 402,
        text = "Wie viele Tasten hat ein Standard-Klavier?",
        answers = {"76", "84", "88", "92"},
        correctAnswer = 3,
        difficulty = "MASTER",
    },
}

-- SECRET LEVEL FRAGEN
Questions.SECRET = {
    {
        id = 501,
        text = "Was ist das Elementare Teilchen mit der kleinsten bekannten Masse?",
        answers = {"Elektron", "Neutrino", "Photon", "Quark"},
        correctAnswer = 2,
        difficulty = "SECRET",
    },
    {
        id = 502,
        text = "Wie viele Millionen Kilometer ist die durchschnittliche Entfernung Erde-Sonne?",
        answers = {"146", "149", "152", "155"},
        correctAnswer = 2,
        difficulty = "SECRET",
    },
}

-- Gibt zufällige Frage für Schwierigkeit
function Questions:GetRandomQuestion(difficulty)
    local questions = self[difficulty.name]
    if not questions or #questions == 0 then
        return nil
    end
    return questions[math.random(1, #questions)]
end

return Questions
