module Main exposing (main)

import Html exposing (Html)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


-- colors


makeGrey : Float -> Color
makeGrey x =
    rgb x x x


lightGrey : Color
lightGrey =
    makeGrey 0.7


grey : Color
grey =
    makeGrey 0.5


darkGrey : Color
darkGrey =
    makeGrey 0.3


black : Color
black =
    makeGrey 0


red : Color
red =
    rgb 0.6 0.2 0.1



-- block


blockSize : Int
blockSize =
    70


halfBlockSize : Int
halfBlockSize =
    blockSize // 2


fifthBlockSize : Int
fifthBlockSize =
    blockSize // 5


blockStyle : List (Attribute msg)
blockStyle =
    [ Background.color darkGrey
    , Border.color lightGrey
    , Border.widthEach
        { bottom = 0
        , left = 2
        , right = 0
        , top = 2
        }
    , Border.rounded fifthBlockSize
    , width <| px blockSize
    , height <| px blockSize
    , Border.shadow
        { offset = ( 2.0, 2.0 )
        , size = 1
        , blur = toFloat halfBlockSize
        , color = black
        }
    , mouseOver
        [ rotate <| pi / 20
        , scale 1.1
        ]
    ]


block : Element msg
block =
    el blockStyle none


type Row
    = Dense
    | Spaced


makeRow : Row -> Int -> Element msg
makeRow rowType number =
    let
        rowHelper : Int -> Int -> Element msg
        rowHelper space many =
            row
                [ centerX
                , spacing space
                ]
            <|
                List.repeat many block
    in
        case rowType of
            Dense ->
                rowHelper -fifthBlockSize number

            Spaced ->
                rowHelper fifthBlockSize number


makeColumn : List Int -> List Int -> List (Element msg)
makeColumn sameList manyList =
    let
        denseOrSpaced : Int -> Row
        denseOrSpaced index =
            if modBy 2 index == 0 then
                Dense
            else
                Spaced

        listFragment : Int -> Int -> List Row
        listFragment index listElement =
            List.repeat listElement <| denseOrSpaced index

        rowTypes : List Row
        rowTypes =
            sameList
                |> List.indexedMap listFragment
                |> List.concat
    in
        List.map2 makeRow rowTypes manyList


sameInARow : List Int
sameInARow =
    [ 3, 1, 1, 1, 1, 3, 2, 2, 3 ]


numberOfBoxes : List Int
numberOfBoxes =
    [ 7, 8, 7, 6, 7, 5, 6, 5, 6, 5, 6, 5, 6, 5, 6, 5, 4 ]



-- main


main : Html msg
main =
    layout
        [ Font.color grey
        , Font.size halfBlockSize
        , Background.color black
        , padding halfBlockSize
        ]
    <|
        column
            [ spacing <| 2 * -fifthBlockSize
            , centerX
            ]
        <|
            makeColumn sameInARow numberOfBoxes
