module UI.Components.View.SavedCard where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.View.SecondaryButton as SecondaryButton
import UI.Components.Controller.SavedCard
import UI.Components.Config.SavedCard

view ::forall w. (Action -> Effect Unit) -> Config -> PrestoDOM (Effect Unit) w
view push (Config config) =
    linearLayout
        [ height config.cardHeight
        , width MATCH_PARENT
        , background config.cardBackground
        , margin config.cardMargin
        , orientation config.orientation
        , padding config.cardPadding
        , cornerRadius config.cornerRadius
        ]
        [ linearLayout
            [ height config.infoHeight
            , width config.infoWidth
            , weight 1.0
            , gravity CENTER_VERTICAL
            ]
            [ linearLayout
                [ height config.radioSize
                , width config.radioSize
                , background config.radioBackground
                , cornerRadius 100.0
                , stroke $ config.radioStrokeWidth <> "," <> config.radioOuterColor
                , padding config.radioPadding
                , visibility config.radioVisibility
                ]
                [ imageView
                    [ height MATCH_PARENT
                    , width MATCH_PARENT
                    , cornerRadius 100.0
                    , background config.radioInnerColor
                    ]
                ]
            , imageView
                [ height MATCH_PARENT
                , width $ V 50
                , imageUrl config.cardTypeImage
                , margin config.imageMargin
                , padding config.imagePadding
                ]
            , linearLayout
                [ height MATCH_PARENT
                , width $ V 0
                , weight 1.0
                , orientation VERTICAL
                ] 
                [ textView
                    [ height $ V 0
                    , width MATCH_PARENT
                    , weight 1.0
                    , text config.cardText
                    , color config.cardTextColor
                    , textSize config.cardTextSize
                    , gravity CENTER_VERTICAL
                    , visibility if config.cardText == "" then GONE else VISIBLE
                    ]
                , textView
                    [ height $ V 0
                    , width MATCH_PARENT
                    , weight 1.0
                    , gravity CENTER_VERTICAL
                    , text config.cardNumber
                    , color config.cardNumberColor
                    , textSize config.cardNumberSize
                    ]
                ]
            ]
            , editText
                [ height config.cvvHeight
                , width config.cvvWidth
                , visibility if config.cvvHint == "" then GONE else VISIBLE
                , hint config.cvvHint
                , margin config.cvvMargin
                , hintColor config.cvvColor
                , gravity BOTTOM
                , textSize 16
                , inputType NumericPassword
                ]
            , imageView
                [ height MATCH_PARENT
                , width $ V 20
                , margin (MarginRight 20)
                , visibility if config.popup == "" then GONE else VISIBLE
                , imageUrl config.popup
                ]
            , linearLayout
                [ height MATCH_PARENT
                , width $ V 100
                , visibility $ config.buttonVisibility
                ]
                [ SecondaryButton.view (push <<< SecondaryButtonAction) config.secondaryButtonConfig

                 ]
        ]