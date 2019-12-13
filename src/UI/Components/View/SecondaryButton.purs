module UI.Components.View.SecondaryButton where

import Effect
import Prelude
import PrestoDOM
import Types
import UI.Components.Controller.SecondaryButton
import UI.Components.Config.SecondaryButton

view :: forall w . (Action  -> Effect Unit) -> Config  -> PrestoDOM (Effect Unit) w
view push (Config config) =
  linearLayout 
    [ width config.width
    , height config.height
    , orientation HORIZONTAL
    , margin config.margin
    , background config.background
    , cornerRadius config.cornerRadius
    , stroke config.stroke
    ]
    [ textView
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , text config.text
        , gravity CENTER
        , color config.color
        , textSize config.textSize
        , typeface config.typeface
        , fontStyle config.font
        ]
    ]
