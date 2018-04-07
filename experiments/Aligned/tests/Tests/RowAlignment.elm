module Tests.RowAlignment exposing (..)

import Color exposing (..)
import Html
import Testable
import Testable.Element as Element exposing (..)
import Testable.Element.Background as Background
import Testable.Element.Font as Font
import Testable.Runner


{-| -}
main : Html.Html msg
main =
    Testable.Runner.show view


box attrs =
    el
        ([ width (px 50)
         , height (px 50)
         , Background.color blue
         ]
            ++ attrs
        )
        empty


container =
    el [ width (px 100), height (px 100) ]


view =
    let
        rowContainer attrs children =
            row ([ spacing 20, height (px 100) ] ++ attrs) children
    in
    column [ width (px 500) ]
        [ el [] (text "Alignment Within a Row")
        , rowContainer [ label "single child" ]
            [ box [] ]
        , rowContainer []
            [ box []
            , box []
            , box []
            ]
        , rowContainer []
            [ box []
            , box []
            , box [ alignRight, label "Right Child in Row" ]
            ]
        , rowContainer
            []
            [ box []
            , box [ alignRight, label "Middle Child in Row" ]
            , box []
            ]
        , rowContainer []
            [ box [ alignRight, label "Left Child in Row" ]
            , box []
            , box []
            ]
        , text "center X"
        , rowContainer []
            [ box [ centerX, label "Left Child in Row" ]
            , box []
            , box []
            ]
        , rowContainer []
            [ box []
            , box [ centerX, label "Middle Child in Row" ]
            , box []
            ]
        , rowContainer []
            [ box []
            , box []
            , box [ centerX, label "Right Child in Row" ]
            ]
        , text "left x right"
        , rowContainer []
            [ box [ alignLeft, label "Left Child in Row" ]
            , box []
            , box [ alignRight, label "Right Child in Row" ]
            ]
        , text "left center right"
        , rowContainer []
            [ box [ alignLeft, label "Left Child in Row" ]
            , box [ centerX, label "Middle Child in Row" ]
            , box [ alignRight, label "Right Child in Row" ]
            ]
        , text "vertical alignment"
        , rowContainer []
            [ box [ alignTop, label "Left Child in Row" ]
            , box [ centerY, label "Middle Child in Row" ]
            , box [ alignBottom, label "Right Child in Row" ]
            ]
        , text "all alignments alignment"
        , rowContainer []
            [ box [ alignLeft, alignTop, label "Left Child" ]
            , box [ centerX, centerY, label "Middle Child" ]
            , box [ alignRight, alignBottom, label "Right Child" ]
            ]
        ]