module VendorTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)

import Vendor exposing (..)


suite : Test
suite =
    describe "The Vendor module"
        [ describe "Vendor.getType" -- Nest as many descriptions as you like.
            [ test "getVendor : valid Visa card number" <|
                \_ -> Expect.equal VISA (Vendor.getVendor "4111111111111111")
            , test "getVendor : valid Visa card number2" <|
                \_ -> Expect.equal VISA (Vendor.getVendor "4012888888881881")
            , test "isValid : valid Mastercard number" <|
                \_ -> Expect.equal Mastercard (Vendor.getVendor "5105105105105100")
            , test "isValid : valid AMEX number" <|
                \_ -> Expect.equal AMEX (Vendor.getVendor "378282246310005")
            , test "isValid : valid Discover number" <|
                \_ -> Expect.equal Discover (Vendor.getVendor "6011111111111117")
            , test "isValid : fake number" <|
                \_ -> Expect.equal Unknown (Vendor.getVendor "99110055667722")
            ]
        ]