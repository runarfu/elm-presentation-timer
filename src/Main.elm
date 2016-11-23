module Main exposing (..)

import Html
import Time
import Types exposing (..)
import Views exposing (..)
import State exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = ( initModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


initModel : Model
initModel =
    { timer =
        { setTime = (15 * Time.second)
        , startTime = Nothing
        }
    , currentTime = Nothing
    }
