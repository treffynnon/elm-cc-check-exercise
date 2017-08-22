module Format exposing (Line, vendorName, formatLine, getPadding, getPrePadPortion)

import Vendor exposing (..)

type alias Line = {
    vendor: Vendor,
    number: String,
    valid: Bool
}

formatLine : Line -> Int -> String
formatLine x longestLine =
    let prePadStr = getPrePadPortion x.vendor x.number
        p = (longestLine + 1) - (String.length prePadStr)
    in prePadStr ++ getPadding p ++ validity x.valid

getPadding : Int -> String
getPadding = flip(String.repeat) " "

getPrePadPortion : Vendor -> String -> String
getPrePadPortion vendor cardNumber =
    (vendorName vendor) ++ ": " ++ cardNumber

validity : Bool -> String
validity x =
    case x of
      True -> "(valid)"
      _ -> "(invalid)"

vendorName : Vendor -> String
vendorName x =
    case x of
      VISA -> "VISA"
      Mastercard -> "Mastercard"
      AMEX -> "AMEX"
      Discover -> "Discover"
      _ -> "Unknown"

