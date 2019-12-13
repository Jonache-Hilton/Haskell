module UI.Components.Config.PrimaryButtonV2 where

import Prelude
import PrestoDOM (Gravity(..), Length(..), Margin(..), Orientation(..), Padding(..), Prop, Typeface(..), Visibility(..), background, cornerRadius, gravity, imageUrl, onChange, orientation, padding, textSize, typeface, visibility)

defConfig :: Config
defConfig = Config
  { height: V 60
  , amount: "₹0.0"
  , background: "#FF9800"
  , color: "#ffffff"
  , imageUrl: "ic_arrow_right"
  , font : "Roboto-Regular"
  }

data Config = Config 
  { height :: Length
  , amount :: String
  , background :: String
  , color :: String
  , imageUrl :: String
  , font :: String
  } 
