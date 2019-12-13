module UI.Components.Config.SearchBox where

import Prelude
import PrestoDOM

defConfig = Config 
    { hint : ""
    , stroke : "0,#ff00ff"
    , fieldErrorMessage : ""
    , imageUrl : "ic_search_black"
    , id : "null"
    , height : V 52
    , padding: (Padding 0 0 0 0)
    , textSize: 24
    , cornerRadius: 0.0
    , searchIconAlpha : 1.0
    , searchIconVisibility : GONE
    , searchIconPadding : (Padding 0 0 0 0)
    , searchIconMargin : (Margin 0 0 0 0)
    , editTextPadding : (Padding 0 0 0 0)
    , editTextMargin : (Margin 0 0 0 0)
    , tickVisibility : GONE
    , lineVisibility : GONE
    , searchIconSize : V 24
    , font : "Roboto-Regular"
    }

data Config = Config 
    { hint :: String
    , stroke :: String
    , fieldErrorMessage :: String
    , imageUrl :: String
    , id :: String
    , height :: Length
    , padding :: Padding
    , textSize :: Int
    , cornerRadius :: Number
    , searchIconAlpha :: Number
    , searchIconPadding :: Padding
    , searchIconMargin :: Margin
    , editTextPadding :: Padding
    , editTextMargin :: Margin
    , searchIconVisibility :: Visibility
    , tickVisibility :: Visibility
    , lineVisibility :: Visibility
    , searchIconSize :: Length
    , font :: String
    }