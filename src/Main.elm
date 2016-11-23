module Main exposing (..)

import Html
import Types exposing (..)
import Views exposing (..)
import State exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = ( 600, Cmd.none )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
