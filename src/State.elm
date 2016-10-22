module State exposing (update, subscriptions)

import Types exposing (..)
import Time exposing (Time, second)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick _ ->
            ( model - 1, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every second Tick
