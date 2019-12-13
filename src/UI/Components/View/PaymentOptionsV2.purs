module UI.Components.View.PaymentOptionsV2 where

import Effect
import Prelude
import PrestoDOM
import Types
import UI.Components.Controller.PaymentOptionsV2
import UI.Components.Config.PaymentOptionsV2

view :: forall w . (Action  -> Effect Unit) -> Config  -> PrestoDOM (Effect Unit) w
view push (Config config) =
      linearLayout 
    [ width MATCH_PARENT
    , height config.height
    , background "#ffffff"
    , orientation VERTICAL
    , padding config.parentPadding
    , onClick push (const $ ToggleOption config.id)
    ]
    [ linearLayout
        [ width MATCH_PARENT
        , height $ V 0
        , weight 1.0
        , orientation HORIZONTAL
        , gravity CENTER
        ]
        [ imageView
            [ width config.imageWidth
            , height config.imageHeight
            , imageUrl config.imageUrl
            , padding (Padding 8 8 8 4)
            ]
          ,linearLayout
            [ width $ V 0
            , height MATCH_PARENT
            , weight 1.0
            , orientation VERTICAL
            , gravity CENTER
            ]
            [ linearLayout
                [ width MATCH_PARENT
                , height config.headingHeight
                , weight config.headingWeight
                , orientation HORIZONTAL
                , padding (Padding 0 0 8 0)
                , gravity CENTER_VERTICAL
                ]
                [ textView
                    [ width $ V 0
                    , height MATCH_PARENT
                    , weight 1.0
                    , text config.headingText
                    , gravity CENTER_VERTICAL
                    , color "#000000"
                    , textSize 18
                    , fontStyle config.font
                    ]
                , textView
                    [ width config.amountWidth
                    , height MATCH_PARENT
                    , text config.amount
                    , background config.amountBackground
                    , color config.amountColor
                    , gravity config.amountGravity
                    , stroke config.amountStroke
                    , cornerRadius config.amountCornerRadius
                    , fontStyle config.font
                    ]
                ]
            , linearLayout
                [ width MATCH_PARENT
                , height $ V 0
                , weight 1.0
                , orientation HORIZONTAL
                , padding config.boxPadding
                , visibility (if config.text == "" then GONE else VISIBLE)
                ]
                [ imageView
                    [ width $ V 14
                    , height $ V 14
                    , margin (Margin 0 4 0 0)
                    , visibility config.discountVisibility
                    , imageUrl "ic_discount"
                    ]
                , textView
                    [ width $ V 0
                    , height MATCH_PARENT
                    , weight 1.0
                    , text config.text
                    , color config.color
                    , gravity config.gravity
                    , padding config.padding
                    , fontStyle config.font
                    ]
                ]
            ]
        ]
      , linearLayout
        [ width MATCH_PARENT
        , height $ V 1
        , visibility config.lineSeparaterVisibility
        , margin config.lineSeparaterMargin
        , background config.lineSeparaterColor
        , orientation HORIZONTAL
        ][]
    ]