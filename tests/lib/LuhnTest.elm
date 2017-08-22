module LuhnTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)

import Luhn exposing (..)


suite : Test
suite =
    describe "The Luhn module"
        [ describe "Luhn.isValid" -- Nest as many descriptions as you like.
            [ test "isValid : valid Visa card number" <|
                \_ -> Expect.equal True (Luhn.isValid "4111111111111111")
            , test "isValid : valid Visa card number2" <|
                \_ -> Expect.equal True (Luhn.isValid "4012888888881881")
            , test "isValid : valid Mastercard number" <|
                \_ -> Expect.equal True (Luhn.isValid "5105105105105100")
            , test "isValid : valid AMEX number" <|
                \_ -> Expect.equal True (Luhn.isValid "378282246310005")
            , test "isValid : valid Discover number" <|
                \_ -> Expect.equal True (Luhn.isValid "6011111111111117")
            , test "isValid : fake number" <|
                \_ -> Expect.equal False (Luhn.isValid "99110055667722")
            ]
        ]