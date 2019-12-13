module UI.Components.Config.PaymentOptionsV2 where

import Prelude
import PrestoDOM (Gravity(..), Length(..), Margin(..), Orientation(..), Padding(..), Prop, Typeface(..), Visibility(..), cornerRadius, gravity, onChange, orientation, padding, typeface, visibility)

defConfig :: Config
defConfig = Config
  { amount: "₹ 0.0"
  , amountGravity: CENTER
  , amountStroke: "0,#ffffff"
  , amountCornerRadius: 0.0
  , height: V 90
  , imageWidth: V 80
  , imageHeight: MATCH_PARENT
  , text: ""
  , gravity: LEFT
  , color: "#757575"
  , amountColor: "#00BFA5"
  , amountWidth: V 70
  , amountBackground: "#ffffff"
  , padding: (Padding 4 2 2 0)
  , imageUrl: "ic_airtel_money"
  , headingText: "Airtel Money"
  , discountVisibility: VISIBLE
  , headingHeight: V 20
  , headingWeight: 0.0
  , boxPadding: (Padding 0 8 8 0)
  , parentPadding: (Padding 0 12 0 12)
  , lineSeparaterVisibility: GONE
  , lineSeparaterMargin: (Margin 0 0 0 0)
  , lineSeparaterColor: "#aaaaaa"
  , id : "0"
  , font : "Roboto-Regular"
  }

data Config = Config 
  { amount :: String
  , amountGravity :: Gravity
  , amountStroke :: String
  , amountCornerRadius :: Number
  , height :: Length
  , imageWidth :: Length
  , imageHeight :: Length
  , text :: String
  , gravity :: Gravity
  , padding ::  Padding
  , color :: String
  , amountColor :: String
  , amountWidth :: Length
  , amountBackground :: String
  , imageUrl :: String
  , headingText :: String
  , discountVisibility :: Visibility
  , headingHeight :: Length
  , headingWeight :: Number
  , boxPadding :: Padding
  , parentPadding :: Padding
  , lineSeparaterVisibility :: Visibility
  , lineSeparaterMargin :: Margin
  , lineSeparaterColor :: String
  , id :: String
  , font :: String
  } 
