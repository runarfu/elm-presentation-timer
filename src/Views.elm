module Views exposing (view)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import String
import Time
import List.Extra
import Types exposing (..)


view : Model -> Html Msg
view model =
    case timeLeft model of
        Just tl ->
            viewTime tl

        Nothing ->
            h1 [] [ text "Not loaded yet" ]


timeLeft : Model -> Maybe Time.Time
timeLeft model =
    case model.currentTime of
        Just ct ->
            case model.timer.startTime of
                Just st ->
                    Just <| model.timer.setTime - (ct - st)

                Nothing ->
                    Nothing

        Nothing ->
            Nothing


viewTime : Time.Time -> Html Msg
viewTime time =
    Time.inSeconds time
        |> round
        |> (\s -> div [ timeLeftStyle s ] [ text (formatSeconds s) ])


timeLeftStyle n =
    let
        bgColor =
            if n < 0 then
                "red"
            else
                "green"
    in
        style
            [ ( "font-size", "50vh" )
            , ( "text-align", "center" )
            , ( "background-color", bgColor )
            , ( "height", "100vh" )
            ]


formatSeconds : Int -> String
formatSeconds s =
    let
        sign =
            if s < 0 then
                "-"
            else
                ""

        minutes =
            (abs s) // 60

        seconds =
            (abs s) % 60

        zeroPad n =
            (String.padLeft 2 '0' (toString n))
    in
        sign ++ (zeroPad minutes) ++ ":" ++ (zeroPad seconds)
