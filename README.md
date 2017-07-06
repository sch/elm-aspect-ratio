#### elm-aspect-ratio

A container for HTML that maintains its aspect ratio

```elm
import Ratio
import AspectRatio
import Html exposing (Html, img)
import Html.Attributes exposing (src)

cinematic : Ratio
cinematic = Ratio.over 16 9

cinematicImage : String -> Html a
cinematicImage src =
    AspectRatio.view (img [ src preview ] [])
```

