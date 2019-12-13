module UI.Components.Config.Offers where 

import PrestoDOM


defConfig = Config
  { background: "value"
  , text: "value"
  , cardTypeIcon : "card_type_mastercard"
  , margin : (Margin 16 16 16 16)
  , cornerRadius : 4.0
  , font : "Roboto-Regular"
  , actionText : "ALL VOUCHERS"
  , actionTextColor : "#E56167"
  , cardHeight : (V 120)
  , iconWidth : (V 48)
  , iconHeight : (V 48)
}

data Config = Config
  { background :: String
  , text:: String
  , cardTypeIcon :: String
  , margin :: Margin
  , cornerRadius :: Number
  , font :: String
  , actionText :: String 
  , actionTextColor :: String 
  , cardHeight :: Length
  , iconWidth :: Length 
  , iconHeight :: Length 
  }


data ConfigData = ConfigData {selectedComponent:: String, config:: Config}
