module UI.Components.Config.SavedCard where
  
import Prelude

import PrestoDOM (Gravity(..), Length(..), Margin(..), Orientation(..), Padding(..), Prop, Typeface(..), Visibility(..), background, cornerRadius, editText, gravity, margin, onChange, orientation, padding, textAllCaps, typeface, visibility)
import UI.Components.Config.SecondaryButton as SecondaryButton

data Config = Config 
    { cardHeight :: Length
    , cardBackground :: String
    , cardMargin :: Margin
    , cardPadding :: Padding
    , cornerRadius :: Number
    , radioVisibility :: Visibility
    , radioSize :: Length
    , radioStrokeWidth :: String
    , radioOuterColor :: String
    , radioInnerColor :: String
    , radioBackground :: String
    , radioPadding :: Padding
    , orientation :: Orientation
    , infoWidth :: Length
    , infoHeight :: Length
    , cardTypeImage :: String
    , imagePadding :: Padding
    , imageMargin :: Margin
    , cardText :: String
    , cardTextColor :: String
    , cardTextSize :: Int
    , cardNumber :: String
    , cardNumberColor :: String
    , cardNumberSize :: Int
    , cvvHeight :: Length
    , cvvWidth :: Length
    , cvvHint :: String
    , cvvColor :: String
    , cvvMargin :: Margin
    , popup :: String
    , buttonVisibility :: Visibility
    , secondaryButtonConfig :: SecondaryButton.Config
}

--General
defConfig = Config
    { cardHeight : V 60
    , cardBackground : "#ffffff"
    , cardMargin : Margin 0 0 0 0
    , cardPadding : Padding 10 10 10 10
    , cornerRadius : 0.0
    , radioVisibility : GONE
    , radioSize : V 24
    , radioStrokeWidth : "2"
    , radioOuterColor : "#8bc34a"
    , radioInnerColor : "#8bc34a"
    , radioBackground : "#ffffff"
    , radioPadding : Padding 3 3 3 3
    , orientation : HORIZONTAL
    , infoWidth : V 0
    , infoHeight : MATCH_PARENT
    , cardTypeImage : "add_new_card_jio_visa"
    , imagePadding : (Padding 0 0 0 0)
    , imageMargin : (Margin 0 0 20 0)
    , cardText : ""
    , cardTextColor : "#000000"
    , cardTextSize : 18
    , cardNumber : "XXXX 9192"
    , cardNumberColor : "#000000"
    , cardNumberSize : 18
    , cvvHeight : MATCH_PARENT
    , cvvWidth : V 90
    , cvvHint : ""
    , cvvColor : "#000000"
    , cvvMargin : MarginRight 20
    , popup : ""
    , buttonVisibility : GONE
    , secondaryButtonConfig : payNowConfig
    }

payNowConfig :: SecondaryButton.Config
payNowConfig = let
    SecondaryButton.Config config = SecondaryButton.defConfig
    secondaryButtonConfig = config
        { background = "#689f38"
        , height = MATCH_PARENT
        , margin = Margin 0 0 0 0
        , text = "PAY NOW"
        , typeface = BOLD
        , cornerRadius = 8.0
        , textSize = 18
        }
    in (SecondaryButton.Config secondaryButtonConfig)