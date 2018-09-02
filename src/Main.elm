module Main exposing (main)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


-- colors


makeGrey x =
    rgb x x x


lightGrey =
    makeGrey 0.7


grey =
    makeGrey 0.5


darkGrey =
    makeGrey 0.3


black =
    makeGrey 0



-- block


blockSize =
    70


halfBlockSize =
    blockSize // 2


roundedness =
    blockSize // 5


blockStyle =
    [ Background.color darkGrey
    , Border.color lightGrey
    , Border.widthEach
        { bottom = 0
        , left = 2
        , right = 0
        , top = 2
        }
    , Border.rounded roundedness
    , width <| px blockSize
    , height <| px blockSize
    ]


block =
    el blockStyle none



-- main


main =
    layout
        [ Font.color grey
        , Font.size halfBlockSize
        , Background.color black
        , padding roundedness
        ]
    <|
        column
            [ spacing roundedness
            , centerX
            ]
            [ el [ centerX ] <| text "The Beginning"
            , row [] <| List.repeat 7 block
            , row [ spacing halfBlockSize ] <| List.repeat 5 block
            ]
