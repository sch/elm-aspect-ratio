module AspectRatio exposing (view, img)

{-| Small HTML helper to display content within a fixed aspect ratio frame


# Images

@docs img


# Regular Content

@docs view

-}

import Html exposing (Html, div)
import Html.Attributes exposing (class, style, src)
import Ratio


ratioAsPercent : Ratio.Rational -> String
ratioAsPercent ratio =
    toString ((Ratio.toFloat ratio) * 100) ++ "%"


outerStyles ratio =
    [ ( "position", "relative" )
    , ( "height", "0" )
    , ( "padding-bottom", ratioAsPercent ratio )
    , ( "overflow", "hidden" )
    ]


innerStyles =
    [ ( "height", "100%" )
    , ( "width", "100%" )
    , ( "position", "absolute" )
    , ( "left", "0" )
    , ( "top", "0" )
    ]


{-| Wrap some HTML in the DOM machinery necessary to preserve its aspect ratio

    AspectRatio.view (Ratio.over 1 1) (div [ class "red-background" ] [])

-}
view : Ratio.Rational -> Html a -> Html a
view ratio body =
    Html.div [ class "AspectRatio", style (outerStyles ratio) ]
        [ Html.div [ class "AspectRatio-subject", style innerStyles ] [ body ] ]


imageStyles =
    [ ( "object-fit", "cover" )
    , ( "width", "100%" )
    ]


{-| Display an image that maintains its aspect ratio

    AspectRatio.img (Ratio.over 9 16) "star-wars.png"

-}
img : Ratio.Rational -> String -> Html a
img ratio url =
    Html.div [ class "AspectRatio", style (outerStyles ratio) ]
        [ Html.img [ class "AspectRatio-img", style imageStyles, src url ] [] ]
