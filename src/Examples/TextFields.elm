module Examples.TextFields exposing (main)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onInput)


main : Program () String Msg
main =
  Browser.sandbox { init = init, update = update, view = view }


init : String
init =
  ""


type Msg =
  Change String

update : Msg -> String -> String
update msg _ =
  case msg of
    Change newContent ->
      newContent


view : String -> Html Msg
view content =
  div []
    [ input [ placeholder "Text to reverse", value content, onInput Change ] []
    , div [] [ text (String.reverse content) ]
    , div [] [ text (String.fromInt (String.length content)) ]
    ]
