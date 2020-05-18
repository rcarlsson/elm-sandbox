module Examples.Buttons exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main : Program () Int Msg
main =
  Browser.sandbox { init = 0, update = update, view = view }

type Msg = Increment | Decrement | Reset

update : Msg -> Int -> Int
update msg model =
  case msg of
    Increment ->
      model + 1
    Decrement ->
      model - 1
    Reset ->
      0

view : Int -> Html Msg
view model =
  div []
    [ div [] [ text (String.fromInt model) ]
    , button [ onClick Decrement ] [ text "-" ]
    , button [ onClick Increment ] [ text "+" ]
    , button [ onClick Reset ] [ text "C" ]
    ]