module Main (..) where

import Html exposing (Html)
import Mouse


view : Int -> Html
view x =
  Html.text (toString x)

double x =
  x * 2

doubleSignal =
  Signal.map double Mouse.x

main : Signal.Signal Html
main =
  Signal.map view doubleSignal

