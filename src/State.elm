module State exposing (..)

import Types exposing (..)
import Time exposing (Time, second)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Start seconds ->
            ( Started seconds, Cmd.none )

        Tick _ ->
            case model of
                Started seconds ->
                    ( updateSeconds seconds, Cmd.none )

                _ ->
                    ( model, Cmd.none )


updateSeconds : Seconds -> Model
updateSeconds seconds =
    if seconds > 0 then
        Started (seconds - 1)
    else
        Finished


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every second Tick
