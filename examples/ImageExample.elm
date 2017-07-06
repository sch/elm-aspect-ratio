module ImageExample exposing (..)

import Ratio
import AspectRatio
import Html
import Html.Attributes


url =
    "https://user-images.githubusercontent.com/109822/27936586-5a7d1d18-627f-11e7-907f-c77f97bfa575.png"


main =
    Html.div
        [ Html.Attributes.style [ ( "max-width", "500px" ), ( "margin", "50px auto" ) ] ]
        [ AspectRatio.img (Ratio.over 1 1) url ]
