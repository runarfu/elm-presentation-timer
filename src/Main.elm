module Main exposing (..)

import Html.App as App
import Views exposing (..)
import State exposing (..)
import Types exposing (..)


main : Program Never
main =
    App.program
        { init = ( NotStarted, Cmd.none )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
