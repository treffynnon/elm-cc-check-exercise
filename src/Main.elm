import Html exposing (Html, Attribute, div, textarea, text, pre)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String
import Maybe

import Format exposing (Line, formatLine, vendorName, getPrePadPortion)
import Luhn exposing (isValid)
import Vendor exposing (getVendor)

main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model =
  { cardNumbers : String }

model : Model
model =
  { cardNumbers = "" }


-- UPDATE

type Msg
  = Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | cardNumbers = newContent }


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ textarea [ placeholder "Credit card numbers", onInput Change, cols 20, rows 10 ] []
    , pre [] [ text (prepareContent model.cardNumbers) ]
    ]

prepareContent : String -> String
prepareContent numbers =
    let numList = getNumList numbers
        longest = theLongestLine numList
    in numList
      |> List.map (\x -> formatLine x longest)
      |> String.join "\n"

theLongestLine : List Line -> Int
theLongestLine numList =
    numList
      |> List.map (\x -> String.length (getPrePadPortion x.vendor x.number))
      |> List.maximum
      |> Maybe.withDefault 0

getNumList : String -> List Line
getNumList numbers =
    numbers
      |> String.trim
      |> String.split "\n"
      |> List.map String.trim
      |> List.map (\x -> {
                    vendor = getVendor x
                    , number = x
                    , valid = isValid x
                  })