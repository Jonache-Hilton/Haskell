module UI.Components.View.SavedCardFront where
  
-- import Config
import Prelude

import Effect (Effect)
import PrestoDOM 
import Types

import UI.Components.Controller.SavedCardFront
  
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
          , height $ V 0
          , weight 1.0
          , orientation VERTICAL
          , padding (Padding 16 16 16 0)
          ]
          [
            linearLayout
            [ width MATCH_PARENT
            , height $ V 35
            , orientation HORIZONTAL
            ]
            [
              linearLayout
              [ weight 1.0
              , width $ V 0 
              , height MATCH_PARENT
              , orientation HORIZONTAL
              , gravity LEFT
              ]
              [
                imageView 
                  [ width $ V 70
                  , height $ V 35
                  , imageUrl $ state.imageUrl
                  ]
              ]
              ,textView
                  [ width $ V 0 
                  , height MATCH_PARENT
                  , weight 1.0
                  , color "#ffffff"
                  , textSize 12
                  , padding (Padding 0 0 16 0)
                  , text (state.cardType <> " | " <> state.bankName)
                  -- , fontStyle config.font
                  ]
            ]
            , textView
              [ width MATCH_PARENT
              , height $ V 35
              , text state.cardNumber
              , textSize 20
              , color "#ffffff"
              , margin (Margin 0 4 0 0)
              -- , fontStyle config.font
              ]
            , linearLayout
              [ width MATCH_PARENT
              , height $ V 40
              , orientation HORIZONTAL
              , margin (Margin 0 6 0 0)
              ]
              [
                linearLayout
                [ height MATCH_PARENT
                , width $ V 0
                , weight 1.0
                , orientation VERTICAL
                ]
                [ 
                  textView
                  [ height $ V 20 
                  , width MATCH_PARENT
                  , text "Card Name"
                  , color "#bdbdbd"
                  -- , fontStyle config.font
                  ]
                , textView
                  [ height $ V 20
                  , width MATCH_PARENT
                  , text state.nameOnCard
                  , color "#ffffff"
                  -- , fontStyle config.font
                  ]
                ]
              , linearLayout
                [ height MATCH_PARENT 
                , width $ V 0
                , weight 1.0
                , orientation VERTICAL 
                ]
                [
                  textView
                  [ height $ V 20 
                  , width MATCH_PARENT
                  , text "Expiry Date"
                  , color "#bdbdbd"
                  -- , fontStyle config.font
                  ]
                , textView
                  [ height $ V 20
                  , width MATCH_PARENT
                  , text state.expiryDate
                  , color "#ffffff"
                  -- , fontStyle config.font
                  ]
                ]
              ]
          ]
        , linearLayout 
          [ width MATCH_PARENT
          , height $ V 35
          , background "#ff0000"
          , cornerRadius 12.0
          , padding (PaddingBottom 12)
          ][
            linearLayout 
            [ width MATCH_PARENT
            , height MATCH_PARENT
            , background "#ff0000"
            ][
              
            ]
          ]
    ]