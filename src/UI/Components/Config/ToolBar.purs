module UI.Components.Config.ToolBar where

import Prelude
import PrestoDOM

data Direction = Right | Left | None

defConfig = Config 
  { background : "#ff5252"
  , textStyle : NORMAL
  , text : "null"
  , textColor : "#FFFFFF"
  , textSize : 22
  , imageUrl : "toolbar_arrow_back_white"
  , inputUrl : "closebutton" 
  , iconVisibility : GONE
  , secondaryTextVisible : GONE
  , textVisibility : VISIBLE
  , padding : (Padding 10 0 0 0)
  , secondaryText : ""
  , typeface : NORMAL
  , translationY : 0.0
  , translationZ : 0.0
  , height : V 200
  , hintText : ""
  , hintColor : "#99FFFFFF"
  , inputVisibility : false
  , actionIcon : ""
  , actionIconSize : V 28
  , parentPadding : Padding 5 5 5 5
  , font : "Roboto-Regular"
  , iconDirection : Left
}

data Config = Config 
  { background :: String
  , text :: String
  , textStyle :: Typeface
  , textColor :: String
  , textSize :: Int
  , imageUrl :: String
  , inputUrl :: String
  , iconVisibility :: Visibility 
  , secondaryTextVisible :: Visibility
  , textVisibility :: Visibility
  , padding :: Padding
  , secondaryText :: String
  , typeface :: Typeface
  , translationY :: Number
  , translationZ :: Number
  , height :: Length
  , hintText :: String
  , hintColor :: String
  , inputVisibility :: Boolean
  , actionIcon :: String
  , actionIconSize :: Length
  , parentPadding :: Padding
  , font :: String
  , iconDirection :: Direction
}
