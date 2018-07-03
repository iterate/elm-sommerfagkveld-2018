module Main exposing (main)

import Html exposing (..)
import Html.Events exposing (..)


type alias Model =
    { counter : Int }


init : Model
init =
    { counter = 0 }


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | counter = model.counter + 1 }

        Decrement ->
            { model | counter = model.counter - 1 }


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Min teller" ]
        , button [ onClick Increment ] [ text "+1" ]
        , div [] [ text (toString model.counter) ]
        , button [ onClick Decrement ] [ text "-1" ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = init
        , view = view
        , update = update
        }
