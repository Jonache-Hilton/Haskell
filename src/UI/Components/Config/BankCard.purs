module UI.Components.Config.BankCard where
  
import Prelude
import PrestoDOM (Gravity(..), Length(..), Margin(..), Orientation(..), Padding(..), Prop, Typeface(..), Visibility(..), cornerRadius, gravity, onChange, orientation, padding, textAllCaps, typeface, visibility)


data Config = Config 
    { background::  String
    , text:: String
    , textColor:: String
    , textSize:: Int
    , textHeight:: Length
    , textWidth:: Length
    , cellHeight:: Length
    , cellWidth:: Length
    , cellMargin:: Margin
    , cellStroke:: String
    , cellCornerRadius:: Number
    , cellPadding:: Padding
    , imageUrl:: String
    , imageSize:: Length 
    , imageMargin::Margin
    , imagePadding:: Padding
    , imageStroke:: String
    , imageCornerRadius:: Number
    , font :: String
}

defConfig = Config 
    { background: ""
    , text: ""
    , textColor: "#000000"
    , textSize: 12
    , textHeight: V 24
    , textWidth: MATCH_PARENT
    , cellHeight: MATCH_PARENT
    , cellWidth: V 50
    , cellMargin: (Margin 0 0 0 0)
    , cellStroke: "0,#aaaaaa"
    , cellCornerRadius: 0.0
    , cellPadding: (Padding 0 0 0 0)
    , imageUrl : ""
    , imageSize: V 40
    , imageMargin: (Margin 0 0 0 0)
    , imagePadding: (Padding 0 0 0 0)
    , imageStroke: "0,#aaaaaa"
    , imageCornerRadius: 0.0
    , font : "Roboto-Regular"
}