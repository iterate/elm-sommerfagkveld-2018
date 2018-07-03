module Main exposing (main)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)


type alias Model =
    { counters : List Int }


init : Model
init =
    { counters = [ 0, 0, 0, 0, 0, 0, 0, 0 ] }


type Msg
    = Increment Int
    | Decrement Int



-- | Double
-- | Decrement
-- | Half


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment indexToChange ->
            let
                updateElement index cnt =
                    if index == indexToChange then
                        cnt + 1
                    else
                        cnt
            in
                { model | counters = List.indexedMap updateElement model.counters }

        Decrement indexToChange ->
            let
                updateElement index cnt =
                    if index == indexToChange then
                        cnt - 1
                    else
                        cnt
            in
                { model | counters = List.indexedMap updateElement model.counters }



-- Double ->
--     { model | counter = model.counter * 2 }
-- Decrement ->
--     { model | counter = model.counter - 1 }
-- Half ->
--     { model | counter = model.counter // 2 }


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Min teller" ]
        , div [] (List.indexedMap viewCounter model.counters)
        ]


viewCounter : Int -> Int -> Html Msg
viewCounter index count =
    div [ class "counter" ]
        [ -- , button [ onClick Double ] [ text "*2" ]
          button [ onClick (Increment index) ] [ text "-1" ]
        , div [] [ text (toString count) ]
        , button [ onClick (Decrement index) ] [ text "+1" ]
          -- , button [ onClick Half ] [ text "/2" ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = init
        , view = view
        , update = update
        }
