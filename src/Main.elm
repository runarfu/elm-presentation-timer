module Main exposing (..)

import Html.App as App
import Views exposing (..)
import State exposing (..)


main : Program Never
main =
    App.program
        { init = ( 600, Cmd.none )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
