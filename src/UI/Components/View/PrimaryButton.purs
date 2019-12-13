module UI.Components.View.PrimaryButton where

import Effect
import Utils
import Prelude
import PrestoDOM
import Types
import UI.Components.Config.PrimaryButton
import UI.Components.Controller.PrimaryButton

view :: forall w . (Action  -> Effect Unit) -> Config  -> PrestoDOM (Effect Unit) w
view push (Config config) =
  linearLayout 
    [ width MATCH_PARENT
    , height config.height
    , orientation HORIZONTAL
    -- , padding (Padding 1 1 1 1)
    , margin config.margin
    , background config.background
    , cornerRadius config.cornerRadius
    , stroke config.stroke
    , gravity CENTER
    ]
    [
      textView
        [ height $ if os == "ANDROID" then WRAP_CONTENT else V (getLabelHeight config.text config.font config.textSize (screenWidth unit) 0)
        , text config.text
        , width MATCH_PARENT
        , gravity CENTER
        , color config.color
        , textSize config.textSize
        , typeface config.typeface
        , fontStyle config.font
        ]
    ]


      