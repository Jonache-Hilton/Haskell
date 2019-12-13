module UI.Components.Config.EditText where

import Prelude
import PrestoDOM

defConfig = Config 
  { background: "null"
  , isFormVisible: true
  , text: "null"
  , visibility: VISIBLE
  , textColor: "#616161"
  , textSize: 14
  , textHeight: V 24
  , typeface: NORMAL
  , textMargin: (Margin 0 0 0 0)
  , parentHeight: V 65
  , parentWidth: MATCH_PARENT
  , parentMargin: (Margin 10 0 10 10)
  , parentPadding: (Padding 0 0 0 0)
  , parentBackground : "#ffffff"
  , rowHeight: V 40
  , rowWidth: MATCH_PARENT
  , rowPadding: (Padding 0 0 0 0)
  , rowStroke: ""
  , rowCornerRadius: 0.0
  , editTextBackground: "#ffffff"
  , hint: ""
  , editTextSize: 16
  , inputType: Numeric
  , pipeVisibility: GONE
  , imageUrl: ""
  , imageBackground: "#f5f5f5"
  , imageHeight: V 40
  , imageWidth: V 60
  , imageMargin: (Margin 0 0 0 0)
  , imagePadding: (Padding 10 0 10 0)
  , imageVisibility: VISIBLE
  , font : "Roboto-Regular"
  , editTextColor : "#efefef"
}

data Config = Config 
  { background :: String
  , isFormVisible :: Boolean
  , text:: String
  , visibility :: Visibility
  , textColor:: String
  , textSize:: Int
  , textHeight:: Length
  , typeface:: Typeface
  , textMargin:: Margin
  , parentHeight:: Length
  , parentWidth:: Length
  , parentMargin:: Margin
  , parentPadding:: Padding
  , parentBackground :: String
  , rowHeight:: Length
  , rowWidth:: Length
  , rowPadding:: Padding
  , rowStroke:: String
  , rowCornerRadius:: Number
  , editTextBackground:: String
  , hint:: String
  , editTextSize:: Int
  , inputType:: InputType
  , pipeVisibility:: Visibility
  , imageUrl:: String
  , imageBackground:: String
  , imageHeight:: Length
  , imageWidth:: Length 
  , imageMargin::Margin
  , imagePadding:: Padding
  , imageVisibility:: Visibility
  , font :: String
  , editTextColor :: String
}