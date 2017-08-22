module FormatTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)

import Format exposing (..)
import Vendor exposing (..)

suite : Test
suite =
    describe "The Format module"
        [ describe "Format.vendor" -- Nest as many descriptions as you like.
            [ test "vendor : VISA" <|
                \_ -> Expect.equal "VISA" (Format.vendorName VISA)
            , test "vendor : Mastercard" <|
                \_ -> Expect.equal "Mastercard" (Format.vendorName Mastercard)
            , test "vendor : AMEX" <|
                \_ -> Expect.equal "AMEX" (Format.vendorName AMEX)
            , test "vendor : Discover" <|
                \_ -> Expect.equal "Discover" (Format.vendorName Discover)
            , test "vendor : Uknown" <|
                \_ -> Expect.equal "Unknown" (Format.vendorName Unknown)
            ]
        , describe "Format.formatLine" -- Nest as many descriptions as you like.
            [ test "formatLine" <|
                \_ -> Expect.equal "VISA: 449456450867506576 (valid)" (Format.formatLine {
                    vendor = VISA
                    , number = "449456450867506576"
                    , valid = True
                } 24)
            ]
        , describe "Format.getPadding" -- Nest as many descriptions as you like.
            [ test "getPadding" <|
                \_ -> Expect.equal "    " (Format.getPadding 4)
            ]
        ]