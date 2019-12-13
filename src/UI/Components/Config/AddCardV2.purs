module UI.Components.Config.AddCardV2 where 

import Prelude
import PrestoDOM (Gravity(..), InputType(..), Length(..), Margin(..), Orientation(..), Padding(..), Prop, Typeface(..), Visibility(..), background, cornerRadius, editText, gravity, inputType, onChange, orientation, padding, textAllCaps, typeface, visibility)

defEditTextConfig = EditTextConfig 
  { background: "null"
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
  , imageVisibility: GONE
  , font : "Roboto-Regular"
}

data EditTextConfig = EditTextConfig 
  { background :: String
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

defConfig = Config 
	{ height: MATCH_PARENT
	, margin: (Margin 8 8 8 8)
	, padding: (Padding 0 0 0 0)
	, background: "#ffffff"
	, cornerRadius: 0.0
	, editTextCardConfig: jioCardNumberEditText
	, editTextNameConfig: jioCardNameEditText
	, editTextMonthConfig: jioCardMonthEditText
	, editTextYearConfig: jioCardYearEditText
	, editTextCvvConfig: jioCardCvvEditText
    , font : "Roboto-Regular"
	}

data Config = Config 
	{ height :: Length
	, margin :: Margin
	, padding :: Padding
	, background :: String
	, cornerRadius :: Number
	, editTextCardConfig :: EditTextConfig
	, editTextNameConfig :: EditTextConfig
	, editTextMonthConfig :: EditTextConfig
	, editTextYearConfig :: EditTextConfig
	, editTextCvvConfig :: EditTextConfig
    , font :: String
	}

jioCardNumberEditText:: EditTextConfig 
jioCardNumberEditText = let
    EditTextConfig config = defEditTextConfig
    editTextConfig = config
		{ parentHeight = V 40
		, hint = "Enter card number"
		, rowStroke = "1,#bdbdbd"
		, rowCornerRadius = 4.0
		, rowPadding = (Padding 4 0 4 0)
		, imageUrl = "ic_card"
		, pipeVisibility = VISIBLE
		, imageVisibility = VISIBLE
		}
    in (EditTextConfig editTextConfig)

jioCardNameEditText:: EditTextConfig 
jioCardNameEditText = let
    EditTextConfig config = defEditTextConfig
    editTextConfig = config
		{ parentHeight = V 40
        , hint = "Enter card number"
        , rowStroke = "1,#bdbdbd"
        , rowCornerRadius = 4.0
        , rowPadding = (Padding 4 0 4 0)
        , inputType = TypeText
      	}
    in (EditTextConfig editTextConfig)

jioCardMonthEditText:: EditTextConfig 
jioCardMonthEditText = let
    EditTextConfig config = defEditTextConfig
    editTextConfig = config
		{ parentHeight = V 40
        , hint = "Month"
        , rowStroke = "1,#bdbdbd"
        , rowCornerRadius = 4.0
        , rowPadding = (Padding 4 0 4 0)
        , imageUrl = "card_type_visa"
        , pipeVisibility = GONE
      	}
    in (EditTextConfig editTextConfig)

jioCardYearEditText:: EditTextConfig 
jioCardYearEditText = let
    EditTextConfig config = defEditTextConfig
    editTextConfig = config
		{ parentHeight = V 40
        , hint = "Year"
        , rowStroke = "1,#bdbdbd"
        , rowCornerRadius = 4.0
        , rowPadding = (Padding 4 0 4 0)
        , imageUrl = "card_type_visa"
        , pipeVisibility = GONE
        , parentMargin = (Margin 0 0 0 0)
    	}
    in (EditTextConfig editTextConfig)

jioCardCvvEditText:: EditTextConfig 
jioCardCvvEditText = let
    EditTextConfig config = defEditTextConfig
    editTextConfig = config
		{ parentHeight = V 40
        , hint = ""
        , rowStroke = "1,#bdbdbd"
        , rowCornerRadius = 4.0
        , rowPadding = (Padding 4 0 4 0)
        , imageUrl = "card_type_visa"
        , pipeVisibility = GONE
      	}
    in (EditTextConfig editTextConfig)
