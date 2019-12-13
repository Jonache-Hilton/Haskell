module UI.Components.Config.AddCard where

import Prelude
import PrestoDOM

defEditTextConfig = EditTextConfig 
  { background: "null"
  , text: "null"
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
}

data EditTextConfig = EditTextConfig 
  { background :: String
  , text:: String
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
}

defEditTextConfigV2 = EditTextConfigV2
  { hint :""
  , margin: (Margin 0 0 0 0)
  , iconUrl :""
  , iconWidth :(V 36)
  , iconHeight :(V 36)
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
  , font : "Roboto-Regular"
  }

data EditTextConfigV2 = EditTextConfigV2 
  { hint :: String
  , margin :: Margin
  , iconUrl :: String
  , iconWidth :: Length
  , iconHeight :: Length
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
  , font :: String
  }

defConfig = Config 
  { height: MATCH_PARENT
  , margin: (Margin 0 0 0 0)
  , padding: (Padding 0 0 0 0)
  , background: "#ffffff"
  , cornerRadius: 0.0
  , stroke: "1,#aaaaaa"
  , imageUrl: "edittext_airtel_cvv"
  , widthCvv: V 100
  , widthDate: V 0
  , editTextCardConfig: defEditTextConfig
  , editTextNameConfig: defEditTextConfig
  , editTextDateConfig: defEditTextConfig
  , editTextCvvConfig: defEditTextConfig
  , editTextCardConfigV2: defEditTextConfigV2
  , editTextNameConfigV2: defEditTextConfigV2
  , editTextDateConfigV2: defEditTextConfigV2
  , editTextCvvConfigV2: defEditTextConfigV2
  , version: 1
  , isFormVisible : true
  , font : "Roboto-Regular"
  }

data Config = Config 
  { height :: Length
  , margin :: Margin
  , padding :: Padding
  , background :: String
  , cornerRadius :: Number
  , stroke :: String
  , imageUrl :: String
  , widthCvv :: Length
  , widthDate :: Length
  , editTextCardConfig :: EditTextConfig
  , editTextNameConfig :: EditTextConfig
  , editTextDateConfig :: EditTextConfig
  , editTextCvvConfig :: EditTextConfig
  , editTextCardConfigV2 :: EditTextConfigV2
  , editTextNameConfigV2 :: EditTextConfigV2
  , editTextDateConfigV2 :: EditTextConfigV2
  , editTextCvvConfigV2 :: EditTextConfigV2
  , version :: Int
  , isFormVisible :: Boolean
  , font :: String
  }
