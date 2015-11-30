module Helper
    ( property'
    , css
    , integrousCss
    , fontawesome
    , bootstrap
    , bootstrapJs
    , (=>)
    ) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Encode as Json


(=>) = (,)


{-| Convenience function to convert to strings into a DOM property.
elm-htmls builtin property function takes a Json Value as the second
argument.
-}
property' : String -> String -> Attribute
property' propertyName value =
    property propertyName (Json.string value)


{-| Creates a link to a css stylesheet.
-}
css : String -> Html
css path =
    node "link"
        [ rel "stylesheet"
        , href path
        ] []


{-| Creates a link to a css stylesheet with subresource integrity.
-}
integrousCss : String -> String -> String -> Html
integrousCss path integrity crossorigin =
    node "link"
        [ rel "stylesheet"
        , href path
        , property' "integrity" integrity
        , property' "crossOrigin" crossorigin
        ] []


{-| Creates a link the fontawesome 4.4.0 css stylesheet.
-}
fontawesome : Html
fontawesome =
    css
        "https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"


{-| Creates a link to the bootstrap 3.3.5 css stylesheet.
-}
bootstrap : Html
bootstrap =
    integrousCss
        "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
        "sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ=="
        "anonymous"


{-| Creates a link to the boostrapJS 3.3.6 css stylesheet.
-}
bootstrapJs : Html
bootstrapJs =
    integrousCss
        "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
        "sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
        "anonymous"
