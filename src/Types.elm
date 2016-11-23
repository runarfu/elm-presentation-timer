module Types exposing (..)

import Time exposing (Time)


type alias Model =
    { timer : Timer
    , currentTime : Maybe Time
    }


type alias Timer =
    { setTime : Time
    , startTime : Maybe Time
    }


type Msg
    = Tick Time
