module Types exposing (..)

import Time exposing (Time)


type alias Model =
    Int


type Msg
    = Tick Time
