module UI.Components.Config.PopularBanks where
  
import Prelude
import PrestoDOM (Gravity(..), Length(..), Margin(..), Orientation(..), Padding(..), Prop, Typeface(..), Visibility(..), cornerRadius, gravity, onChange, orientation, padding, textAllCaps, typeface, visibility)

defConfig = Config 
    { background: "null"
    , text: "null"
    , textColor: "#aaaaaa"
    , textSize: 12
    , textAllCaps: false
    , textHeight: V 24
    , textWidth: MATCH_PARENT
    , parentHeight: MATCH_PARENT
    , parentWidth: MATCH_PARENT
    , parentMargin: (Margin 0 0 0 0)
    , rowHeight: V 50
    , rowWidth: MATCH_PARENT
    , rowMargin: (Margin 0 0 0 0)
    , cellHeight: MATCH_PARENT
    , cellWidth: V 0
    , cellMargin: (Margin 0 0 0 0)
    , cellStroke: "0,#aaaaaa"
    , cellCornerRadius: 0.0
    , cellPadding: (Padding 0 0 0 0)
    , imageHeight: V 40
    , imageWidth: V 40
    , imageMargin: (Margin 0 0 0 0)
    , imagePadding: (Padding 0 0 0 0)
    , imageStroke: "0,#aaaaaa"
    , imageCornerRadius: 0.0
    , isFormVisible : false
    , bankNameVisibility : VISIBLE
    , font : "Roboto-Regular"
}

data Config = Config 
    { background ::  String
    , text:: String
    , textColor:: String
    , textSize:: Int
    , textAllCaps:: Boolean
    , textHeight:: Length
    , textWidth:: Length
    , parentHeight:: Length
    , parentWidth:: Length
    , parentMargin:: Margin
    , rowHeight:: Length
    , rowWidth:: Length
    , rowMargin:: Margin
    , cellHeight:: Length
    , cellWidth:: Length
    , cellMargin:: Margin
    , cellStroke:: String
    , cellCornerRadius:: Number
    , cellPadding:: Padding
    , imageHeight:: Length
    , imageWidth:: Length 
    , imageMargin::Margin
    , imagePadding:: Padding
    , imageStroke:: String
    , imageCornerRadius:: Number
    , isFormVisible :: Boolean
    , bankNameVisibility :: Visibility
    , font :: String
}