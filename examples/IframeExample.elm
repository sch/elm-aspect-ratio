module ImageExample exposing (..)

import Ratio
import AspectRatio
import Html
import Html.Attributes


url =
    "https://www.youtube-nocookie.com/embed/MxN8ZlIAwsI?rel=0"


video =
    Html.iframe
        [ Html.Attributes.src url
        , Html.Attributes.style [ ( "width", "100%" ), ( "height", "100%" ) ]
        ]
        []


main =
    Html.div
        [ Html.Attributes.style [ ( "max-width", "500px" ), ( "margin", "50px auto" ) ] ]
        [ AspectRatio.view (Ratio.over 3 4) video ]
