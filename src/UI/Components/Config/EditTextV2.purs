module UI.Components.Config.EditTextV2 where

import Prelude
import PrestoDOM

defConfig = Config
  { hint :""
  , margin: (Margin 0 0 0 0)
  , iconUrl :""
  , iconWidth :(V 40)
  , iconHeight :(V 40)
  , iconText : ""
  , iconTextColor : "#000000"
  , iconTextSize : 18
  , iconClickable : false
  , cardWidth :MATCH_PARENT
  , cardHeight :(V 50)
  , lineSeparatorColor : "#aaaaaa"
  , lineSeparatorHeight : 1
  , textColor : "#000000"
  , hintColor : "#aaaaaa"
  , tickVisibility : GONE
  , hintOutOfEditText : false
  , editTextPadding : (Padding 0 0 0 0)
  , inputType: Numeric
  , editTextVisibility: VISIBLE
  , visibility: VISIBLE
  , lineSeparatorMargin: (Margin 0 0 0 0)
  , background : "#FFFFFF"
  , gravity : START
  , textSize : 18
  , text : ""
  , font : "Roboto-Regular"
  }

data Config = Config 
  { hint :: String
  , margin :: Margin
  , iconUrl :: String
  , iconWidth :: Length
  , iconHeight :: Length  
  , iconText :: String
  , iconTextColor :: String
  , iconTextSize :: Int
  , iconClickable :: Boolean
  , cardWidth :: Length
  , cardHeight :: Length
  , lineSeparatorColor :: String 
  , lineSeparatorHeight :: Int 
  , textColor :: String 
  , hintColor :: String 
  , tickVisibility :: Visibility
  , hintOutOfEditText :: Boolean 
  , editTextPadding :: Padding 
  , inputType :: InputType
  , editTextVisibility :: Visibility
  , visibility :: Visibility
  , lineSeparatorMargin :: Margin
  , background :: String
  , gravity :: Gravity
  , textSize :: Int
  , text :: String
  , font :: String
  }