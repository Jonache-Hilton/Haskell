module UI.Components.View.PrimaryButtonV2 where

import Effect
import Prelude
import PrestoDOM
import Types
import UI.Components.Controller.PrimaryButtonV2
import UI.Components.Config.PrimaryButtonV2

view :: forall w . (Action  -> Effect Unit) -> Config  -> PrestoDOM (Effect Unit) w
view push (Config config) =
  linearLayout 
    [ width MATCH_PARENT
    , height config.height
    , orientation HORIZONTAL
    , padding (Padding 32 8 8 8)
    , background config.background
    ]
    [
      linearLayout
        [ width $ V 0
        , height MATCH_PARENT
        , weight 1.0
        , orientation VERTICAL
        ]
        [
          textView
            [ text "Total Amount to be Paid"
            , height $ V 18
            , width MATCH_PARENT
            , color config.color
            , textSize 14
            , fontStyle config.font
            ]
          ,textView
            [ text config.amount
            , height $ V 0
            , weight 1.0
            , width MATCH_PARENT
            , color config.color
            , textSize 20
            , typeface BOLD
            , fontStyle config.font
            ]
        ]
      ,linearLayout
        [ width $ V 0
        , height MATCH_PARENT
        , weight 1.0
        , orientation VERTICAL
        ]
        [
          linearLayout
            [ width MATCH_PARENT
            , height $ V 0
            , weight 1.0
            , orientation HORIZONTAL
            ]
            [
              textView
                [ text "Next"
                , height MATCH_PARENT
                , width $ V 0
                , weight 1.0
                , gravity RIGHT
                , color config.color
                , textSize 24
                , typeface BOLD
                , padding (Padding 0 0 8 0)
                , fontStyle config.font
                ]
              ,imageView
                [ width $ V 24
                , height MATCH_PARENT
                , imageUrl config.imageUrl
                ] 
            ]
          ,textView
            [ text "Pay for Your Flight"
            , height $ V 18
            , width MATCH_PARENT
            , gravity RIGHT
            , color config.color
            , textSize 14
            , fontStyle config.font
            ]
        ]
    ]
