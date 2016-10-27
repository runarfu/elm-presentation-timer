module Types exposing (..)

import Time exposing (Time)


type alias Seconds =
    Int


type Model
    = NotStarted
    | Started Seconds
    | Finished


type Msg
    = Start Seconds
    | Tick Time
