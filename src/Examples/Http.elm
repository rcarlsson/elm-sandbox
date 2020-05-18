module Examples.Http exposing (main)

import Browser
import Html exposing (Html, button, text, pre)
import Html.Events exposing (onClick)
import Http


main : Program () Model Msg
main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }


type Model
  = Init
  | Failure
  | Loading
  | Success String


init : () -> (Model, Cmd Msg)
init _ =
  ( Init
  , Cmd.none
  )


type Msg
  = GotText (Result Http.Error String)
  | GetText


update : Msg -> Model -> (Model, Cmd Msg)
update msg _ =
  case msg of
    GetText ->
      ( Loading
      , Http.get
        { url = "https://elm-lang.org/assets/public-opinion.txt"
        , expect = Http.expectString GotText
        }
      )

    GotText result ->
      case result of
        Ok fullText ->
          (Success fullText, Cmd.none)

        Err _ ->
          (Failure, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none


view : Model -> Html Msg
view model =
  case model of
    Init ->
      button [ onClick GetText ] [ text "Fetch text" ]

    Failure ->
      text "I was unable to load your book."

    Loading ->
      text "Loading..."

    Success fullText ->
      pre [] [ text fullText ]