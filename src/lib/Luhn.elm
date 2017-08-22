module Luhn exposing (isValid)

import String
import Char

isValid : String -> Bool
isValid number =
    number
      |> reverseNumberStringToList
      |> doubleEverySecond
      |> splitDoubleDigits
      |> List.sum
      |> \x -> x % 10 == 0 && x > 1

stringToInt : String -> Int
stringToInt x = Result.withDefault -1 (String.toInt x)

isEven : Int -> Bool
isEven x = x % 2 == 0

reverseNumberStringToList : String -> List Int
reverseNumberStringToList string =
    string
      |> String.filter Char.isDigit
      |> String.reverse
      |> String.split ""
      |> List.map stringToInt

doubleEverySecond : List Int -> List Int
doubleEverySecond = List.indexedMap (\i x -> if isEven i
                                             then x
                                             else x * 2)

splitDoubleDigits : List Int -> List Int
splitDoubleDigits = List.concatMap (\x -> if x > 9
                                          then [1, x - 10]
                                          else [x])

