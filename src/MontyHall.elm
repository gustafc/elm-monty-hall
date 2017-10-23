import Html exposing (..)
import Html.Attributes exposing (..)


type Room = RoomA | RoomB | RoomC

allRooms = [RoomA, RoomB, RoomC]

type alias MhScenario = { roomWithPrize: Room
                        , initialRoom: Room
                        }


winsWhenRemaining : MhScenario -> Bool
winsWhenRemaining {roomWithPrize, initialRoom} = initialRoom == roomWithPrize

winsWhenSwapping : MhScenario -> Bool
winsWhenSwapping s = not (winsWhenRemaining s)

allScenarios : List MhScenario
allScenarios =
    allRooms
    |> List.concatMap (\roomWithPrize ->
        allRooms
            |> List.map (\initialRoom -> { roomWithPrize = roomWithPrize, initialRoom = initialRoom })
    )


main = table [attribute "border" ""]
        [ caption [] [text "Monty Hall outcomes"]
        , thead [] [
            tr [] [ th [] [text "Room A"]
                  , th [] [text "Room B"]
                  , th [] [text "Room C"]
                  , th [] [text "Chosen room"]
                  , th [] [text "Outcome when remaining"]
                  , th [] [text "Outcome when swapping"]
                  ]
            ]
        , tbody [] (List.map renderOutcome allScenarios)
        ]

renderOutcome : MhScenario -> Html msg
renderOutcome scenario =
    let
        renderContent = (\win -> if win then "🚗" else "🐐")
        rooms = List.map (\room -> renderContent (room == scenario.roomWithPrize)) allRooms
        initiallyChosen = case scenario.initialRoom of
            RoomA -> "A"
            RoomB -> "B"
            RoomC -> "C"
        outcomes = List.map renderContent [ winsWhenRemaining scenario, winsWhenSwapping scenario]
        cells = rooms ++ [initiallyChosen] ++ outcomes
    in
        tr [] (List.map (\content -> td [] [text content]) cells)
