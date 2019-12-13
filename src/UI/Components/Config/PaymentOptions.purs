module UI.Components.Config.PaymentOptions where

import Prelude
import PrestoDOM (Gravity(..), Length(..), Margin(..), Padding(..), Typeface(..), Visibility(..))

newtype Config = Config 
    { text :: String
    , bankIconUrl :: String
    , rightArrowUrl :: String
    , textColor :: String
    , lineSeparaterColor :: String
    , background ::  String
    , typeface :: Typeface
    , checkBoxVisibility :: Visibility
    , offerText :: String
    , paymentOptionOffer :: String  
    , cardHeight :: Length
    , offerTextColor :: String
    , rightArrowWidth :: Length
    , rightArrowHeight :: Length
    , id :: String
    , checkVisibility :: Visibility
    , isFormVisible :: Boolean
    , iconSize :: Length
    , font :: String
    , clickable :: Boolean
}

defConfig = Config { text : "Payment Option"
    , bankIconUrl : ""
    , rightArrowUrl : ""
    , textColor : "#000000"        
    , lineSeparaterColor : "#e1e1e1"
    , background : "#ffffff"
    , typeface : NORMAL
    , checkBoxVisibility : GONE
    , offerText : ""
    , paymentOptionOffer : ""
    , offerTextColor : "#aaaaaa"
    , cardHeight : (V 64)
    , rightArrowWidth : (V 24)
    , rightArrowHeight : (V 24)
    , id : "0"
    , checkVisibility : GONE
    , isFormVisible : true
    , iconSize : V 32
    , font : "Roboto-Regular"
    , clickable : true 
}