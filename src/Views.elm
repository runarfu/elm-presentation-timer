module Views exposing (view)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import String
import Types exposing (..)


view : Model -> Html Msg
view model =
    let
        bgColor =
            if model > 0 then
                "green"
            else
                "red"
    in
        div
            [ style
                [ ( "font-size", "50vh" )
                , ( "text-align", "center" )
                , ( "background-color", bgColor )
                , ( "height", "100vh" )
                ]
            ]
            [ text (formatSeconds model) ]


formatSeconds : Int -> String
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
