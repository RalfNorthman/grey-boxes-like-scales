module Main exposing (main)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


-- colors


makeGrey x =
    rgb x x x


lightGrey =
    makeGrey 0.9


grey =
    makeGrey 0.8


darkGrey =
    makeGrey 0.7


black =
    makeGrey 0



-- main


main =
    layout
        [ Font.color grey
        , Background.color black
        ]
    <|
        text "The Beginning"
