module UI.Components.Config.SecondaryButton where

import Prelude
import PrestoDOM (Gravity(..), Length(..), Margin(..), Orientation(..), Padding(..), Prop, Typeface(..), Visibility(..), cornerRadius, gravity, onChange, orientation, padding, textSize, typeface, visibility)

defConfig :: Config
defConfig = Config
  { background: "#aaaaaa"
  , height: V 50
  , width: V 100
  , text: "PAY"
  , color: "#ffffff"
  , cornerRadius: 0.0
  , textSize: 18
  , margin: (Margin 4 4 4 4)
  , typeface: NORMAL
  , stroke: "0,#ffffff"
  , font : "Roboto-Regular"
  }

data Config = Config 
  { background :: String
  , height :: Length
  , width :: Length
  , text :: String
  , color :: String
  , cornerRadius :: Number
  , textSize :: Int
  , margin :: Margin
  , typeface :: Typeface
  , stroke :: String
  , font :: String
  } 
