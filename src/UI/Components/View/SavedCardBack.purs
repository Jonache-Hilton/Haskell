module UI.Components.View.SavedCardBack where
  
-- import Config
import Prelude

import Effect (Effect)
import PrestoDOM 
import Types (ChildAction, SavedCardInput(..))
  
import UI.Components.Controller.SavedCardBack

eval = (\ _ state -> state)

view :: forall w. (Action  -> Effect Unit) -> SavedCardInput  -> PrestoDOM (Effect Unit) w
view push (SavedCardInput state) =
    linearLayout
    [ width $ V 300
    , height $ V 180
    , background "#0095e0"
    , cornerRadius 12.0
    , orientation VERTICAL
    , margin (Margin 30 20 0 20)
    , visibility if state.isCardVisible then VISIBLE else GONE
    ] [
        linearLayout 
          [ width MATCH_PARENT
          , height $ V 30
          , orientation VERTICAL
          , padding (Padding 16 16 16 0)
          ]
          [
            textView
              [ width MATCH_PARENT
              , height MATCH_PARENT
              , weight 1.0
              , color "#ffffff"
              , textSize 12
              , text (state.cardType <> " | " <> state.bankName)
              -- , fontStyle config.font
              ]
              
            ],
        linearLayout
          [ width MATCH_PARENT
          , height $ V 35
          , background "#1a237e"
          , margin (Margin 0 16 0 16)
          ][],
        linearLayout
          [ width MATCH_PARENT
          , height $ V 0
          , weight 1.0
          , orientation HORIZONTAL
          ] [
            linearLayout
              [ height MATCH_PARENT
              , width $ V 0
              , weight 1.0
              , gravity LEFT
              , orientation VERTICAL
              , padding (PaddingLeft 16)
              ][
                textView 
                  [ width MATCH_PARENT
                  , height $ V 16
                  , text "Enter CVV Number"
                  , color "#ffffff"
                  -- , fontStyle config.font
                  ],
                editText
                  [ height $ V 50
                  , width $ V 95
                  , hint "123"
                  , background "#ffffff"
                  , cornerRadius 5.0
                  , textSize 18
                  , letterSpacing 2.5
                  , gravity CENTER
                  , inputType NumericPassword
                  ]
              ],
              linearLayout
              [ height MATCH_PARENT
              , width $ V 0
              , weight 1.0
              , gravity LEFT
              , margin (Margin 30 20 0 0)
              ][
                textView
                  [ height $ V 44 
                  , width $ V 80
                  , text "Pay"
                  , background "#81d4fa"
                  , color "#0095e0"
                  , textSize 20
                  , typeface BOLD
                  , gravity CENTER
                  , cornerRadius 5.0
                  -- , fontStyle config.font
                  ]
              ]
          ]
            
    ]