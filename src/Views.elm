module Views exposing (view)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import String
import Types exposing (..)


view : Model -> Html Msg
view model =
    case model of
        NotStarted ->
            notStarted

        Started seconds ->
            viewTime seconds "green"

        Finished ->
            viewTime 0 "red"


notStarted : Html Msg
notStarted =
    let
        timeButton minutes =
            div [] [ button [ onClick (Start (minutes * 60)) ] [ text <| (toString minutes) ++ " minutes" ] ]
    in
        div []
            (List.map timeButton [ 10, 15, 20, 25, 30, 35, 40, 45 ])


viewTime : Seconds -> String -> Html Msg
viewTime seconds bgColor =
    div
        [ style
            [ ( "font-size", "50vh" )
            , ( "text-align", "center" )
            , ( "background-color", bgColor )
            , ( "height", "100vh" )
            ]
        ]
        [ text (formatSeconds seconds) ]


formatSeconds : Seconds -> String
formatSeconds s =
    let
        minutes =
            (abs s) // 60

        seconds =
            (abs s) % 60

        zeroPad n =
            (String.padLeft 2 '0' (toString n))
    in
        (zeroPad minutes) ++ ":" ++ (zeroPad seconds)
