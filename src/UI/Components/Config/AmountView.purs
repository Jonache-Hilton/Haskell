module UI.Components.Config.AmountView where

import Prelude
import PrestoDOM

defConfig :: Config
defConfig = Config
  { background: "#ffffff"
  , text: ""
  , color: "#aaaaaa"
  , textSize: 14
  , height: MATCH_PARENT
  , width: MATCH_PARENT
  , gravity: LEFT
  , typeface : NORMAL
  , orientation: HORIZONTAL
  , pipeVisibility : GONE
  , headingColor : "#000000"
  , headingText : "Amount Payable"
  , headingTextSize : 18
  , headingTypeface : NORMAL
  , headingWidth : MATCH_PARENT
  , headingHeight : MATCH_PARENT
  , headingWeight : 1.0
  , weight : 1.0
  , amountHeadingVisibility : GONE
  , amountHeadingText : "Pay Amount"
  , amountText: "₹0"
  , amountColor: "#000000"
  , amountTextSize: 18
  , amountHeight : MATCH_PARENT
  , amountTypeface : NORMAL
  , amountVisibility: VISIBLE
  , amountGravity: LEFT
  , imageHeight: V 24
  , imageVisibility: GONE
  , imageMargin: (Margin 8 8 0 8)
  , imageUrl: "amountview_goibibo_info_blue"
  , imageWidth: V 24
  , heightParent: V 50
  , widthParent: MATCH_PARENT
  , margin: (Margin 0 0 0 0)
  , padding: (Padding 10 10 10 10)
  , cornerRadius: 0.0
  , font : "Roboto-Regular"
  , parentGravity : CENTER
  }

data Config = Config 
  { heightParent:: Length
  , widthParent:: Length
  , background :: String
  , orientation:: Orientation
  , margin:: Margin
  , padding:: Padding
  , cornerRadius:: Number
  , headingColor:: String
  , headingText:: String
  , headingTypeface:: Typeface
  , headingWidth:: Length
  , headingHeight:: Length
  , headingTextSize:: Int
  , headingWeight:: Number
  , weight:: Number
  , pipeVisibility:: Visibility
  , text:: String
  , color:: String
  , textSize:: Int
  , height:: Length
  , width:: Length
  , gravity:: Gravity
  , typeface:: Typeface
  , amountHeadingVisibility:: Visibility
  , amountHeadingText:: String
  , amountText:: String
  , amountColor:: String
  , amountTextSize:: Int
  , amountHeight:: Length
  , amountGravity:: Gravity
  , amountVisibility:: Visibility
  , amountTypeface:: Typeface
  , imageVisibility:: Visibility
  , imageMargin:: Margin
  , imageUrl:: String
  , imageWidth:: Length
  , imageHeight :: Length
  , font :: String
  , parentGravity :: Gravity
  } 
