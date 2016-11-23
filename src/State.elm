module State exposing (update, subscriptions)

import Types exposing (..)
import Time exposing (Time)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick time ->
            ( updateModel model time, Cmd.none )


updateModel : Model -> Time -> Model
updateModel model time =
    { model | currentTime = Just time, timer = updateTimer model.timer time }


updateTimer : Timer -> Time -> Timer
updateTimer timer time =
    case timer.startTime of
        Just _ ->
            timer

        Nothing ->
            { timer | startTime = Just time }


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every Time.second Tick
