module AspectRatio exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class, style)
import Ratio


ratioAsPercent : Ratio.Rational -> String
ratioAsPercent ratio =
    toString ((Ratio.toFloat ratio) * 100) ++ "%"


outerStyles ratio =
    [ ( "position", "relative" )
    , ( "height", "0px" )
    , ( "padding-bottom", ratioAsPercent ratio )
    ]


innerStyles =
    [ ( "height", "100%" )
    , ( "width", "100%" )
    , ( "position", "absolute" )
    , ( "left", "0px" )
    , ( "top", "0px" )
    ]


view : Ratio.Rational -> Html a -> Html a
view ratio body =
    div [ class "AspectRatio", style (outerStyles ratio) ]
        [ div [ class "AspectRatio-subject", style innerStyles ] [ body ] ]
