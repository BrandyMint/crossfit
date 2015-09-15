# Crossfit

## Setup

    bundle
    cp .env.example .env
    cp .env.example .env.test

## Глоссарий

`Exercise` – тип упражнения (например, бег или отжимания).

`Move` – движение, конкретное упражнение в рамках тренировки (например, "10 отжиманий в грузом 10кг").
Переименовать в ExerciseMovement

`Workout` – тренировка, включающая в себя набор движений (Exercises), разминку, заминку и т.д.

`Wod` – тренировка дня. Представляет собой тренировку, назначенную на определенный день.
Такая система позволяет сохранять тренировки для повторного использования.

Переименовать в WodExercise.

Кросс-таблица между конкретным днем (датой) и тренировкой. В один день может 
быть только одна тренировка.

`Log` – запись результатов одной тренировки дня.
Включает в себя общую информацию по тренировке и результаты по каждому движению(

Переименовать в WodResult. Кросс таблица между датой, user и wod

`MoveLog` – запись результатов для конкретного движения в рамках конкретной тренировки
(например, "15 отжмиманий с весом 5кг на тренировки 31.08.2015").

Переименовать WodMovementResult
