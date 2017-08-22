module Vendor exposing (Vendor(..), getVendor)

import Regex exposing (contains, regex)

type Vendor = VISA | Mastercard | Discover | AMEX | Unknown

regexMatch : String -> String -> Bool
regexMatch x = contains (regex x)

isVisa : String -> Bool
isVisa = regexMatch "^4(\\d{12}|\\d{15})"

isMastercard : String -> Bool
isMastercard = regexMatch "^5[1-5]\\d{14}"

isDiscover : String -> Bool
isDiscover = regexMatch "^6011\\d{12}"

isAMEX : String -> Bool
isAMEX = regexMatch "^3(4|7)\\d{13}"

getVendor : String -> Vendor
getVendor x =
    if isVisa x then VISA
    else if isMastercard x then Mastercard
    else if isDiscover x then Discover
    else if isAMEX x then AMEX
    else Unknown