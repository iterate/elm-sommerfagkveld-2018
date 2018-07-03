module Main exposing (main)

import Html exposing (..)


hello : String -> String
hello name =
    "Hello: " ++ name


main : Html msg
main =
    div []
        [ h1 [] [ text "Overskrift" ]
        , p [] [ text "Hello, World!" ]
        , p [] [ text (hello "Sindre") ]
        , footer [] [ text "Sindre Johansen" ]
        ]
