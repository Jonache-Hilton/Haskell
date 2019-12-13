module UI.Components.Config.PopularBanksV2 where
  
import Prelude
import PrestoDOM (Gravity(..), Length(..), Margin(..), Orientation(..), Padding(..), Prop, Typeface(..), Visibility(..), cornerRadius, gravity, onChange, orientation, padding, textAllCaps, typeface, visibility)

defConfig = Config 
  { background : "null"
  , text: "null"

  , textColor: "#aaaaaa"
  , textSize: 18
  , textAllCaps: false
  , textHeight:  V 24
  , textWidth:  MATCH_PARENT

  , parentHeight:  V 80
  , parentWidth:  MATCH_PARENT

  , rowHeight:  V 50
  , rowWidth:  MATCH_PARENT
  , rowMargin: (Margin 0 0 0 0)
  , rowPadding: (Padding 0 0 0 0)

  , imageWidth:  V 50
  , imageMargin: (Margin 0 0 0 0)
  , imagePadding: (Padding 0 0 0 0)

  , arrowVisibility: GONE
  , font : "Roboto-Regular"
}

data Config = Config 
  { background :: String
  , text :: String

  , textColor :: String
  , textSize :: Int
  , textAllCaps :: Boolean
  , textHeight :: Length
  , textWidth :: Length

  , parentHeight :: Length
  , parentWidth :: Length

  , rowHeight :: Length
  , rowWidth :: Length
  , rowMargin :: Margin
  , rowPadding :: Padding

  , imageWidth :: Length 
  , imageMargin :: Margin
  , imagePadding :: Padding

  , arrowVisibility:: Visibility
  , font :: String
  }