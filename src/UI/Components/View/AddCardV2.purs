module UI.Components.View.AddCardV2 where 

import Effect
import Prelude
import PrestoDOM
import Types

import Animations as A
import Presto.Core.Flow (Flow, initUI, runScreen, showScreen)
import Record as Record
import Simple.JSON (writeJSON)
import Type.Prelude (SProxy(..))

import UI.Components.Config.AddCardV2
import UI.Components.Controller.AddCardV2

view :: forall w . (Action  -> Effect Unit) -> Config  -> PrestoDOM (Effect Unit) w
view push (Config config) =
  linearLayout 
    [ width MATCH_PARENT
    , height config.height
    , background config.background
    , orientation VERTICAL
    , margin config.margin
    , padding config.padding
    , stroke "1,#aaaaaa"
    , cornerRadius config.cornerRadius
    ]
    [ linearLayout
        [ width MATCH_PARENT
        , height $ V 50
        ]
        [ imageView
            [ width $ V 0
            , height MATCH_PARENT
            , weight 1.0
            , imageUrl "add_new_card_jio_visa"
            ]
        , imageView
            [ width $ V 0
            , height MATCH_PARENT
            , weight 1.0
            , imageUrl "add_new_card_jio_mastercard"
            ]
        , imageView
            [ width $ V 0
            , height MATCH_PARENT
            , weight 1.0
            , imageUrl "add_new_card_jio_americanexp"
            ]
        , imageView
            [ width $ V 0
            , height MATCH_PARENT
            , weight 1.0
            , imageUrl "add_new_card_jio_dinersclub"
            ]
        , imageView
            [ width $ V 0
            , height MATCH_PARENT
            , weight 1.0
            , imageUrl "add_new_card_jio_rupay"
            ]
        ]
    ,textView
        [ width MATCH_PARENT
        , height $ V 20
        , text "Card Number"
        , textSize 16
        , typeface BOLD
        , color "#000000"
        , margin (Margin 10 10 10 10)
        , fontStyle config.font
        ]
    , _addCardEditTextV1 config.editTextCardConfig
    , linearLayout 
        [ width MATCH_PARENT
        , height $ V 30
        , margin (Margin 0 0 0 0)
        ]
        [ textView
            [ width $ V 0
            , height MATCH_PARENT
            , weight 1.0
            , text "Expiration Date"
            , textSize 16
            , typeface BOLD
            , color "#000000"
            , margin (Margin 10 0 10 10)
            , fontStyle config.font
            ]
        , textView
            [ width $ V 100
            , height MATCH_PARENT
            , text "CVV/CVC"
            , textSize 16
            , typeface BOLD
            , color "#000000"
            , margin (Margin 10 0 10 10)
            , fontStyle config.font
            ]
        ]
    , linearLayout 
        [ width MATCH_PARENT
        , height $ V 40
        ]
        [ linearLayout
          [ height MATCH_PARENT
          , width $ V 120
          ]
          [ _addCardEditTextV1 config.editTextMonthConfig
          ]
        , linearLayout
          [ height MATCH_PARENT
          , width $ V 100
          ]
          [ _addCardEditTextV1 config.editTextYearConfig
          ]
        , linearLayout
          [ height MATCH_PARENT
          , width $ V 0
          , weight 1.0
          ]
          [ _addCardEditTextV1 config.editTextCvvConfig  
          ]
        ]
    , textView
        [ width MATCH_PARENT
        , height $ V 20
        , text "Card Holder Name"
        , textSize 16
        , typeface BOLD
        , color "#000000"
        , margin (Margin 10 10 10 10)
        , fontStyle config.font
        ]
        , _addCardEditTextV1 config.editTextNameConfig
    ]

_addCardEditTextV1 ::forall w. EditTextConfig -> PrestoDOM (Effect Unit) w
_addCardEditTextV1 (EditTextConfig config) =
    linearLayout
        [ height $ config.parentHeight
        , width $ config.parentWidth
        , margin $ config.parentMargin
        , padding $ config.parentPadding
        , background $ config.parentBackground
        , orientation VERTICAL
        ] [
            linearLayout
                [ height $ config.rowHeight
                , width MATCH_PARENT
                , orientation HORIZONTAL
                , background "#f5f5f5"
                , stroke $ config.rowStroke
                , cornerRadius $ config.rowCornerRadius
                , padding $ config.rowPadding
                ] [
                    editText
                        [ height MATCH_PARENT
                        , width $ V 0
                        , weight 1.0
                        , gravity CENTER_VERTICAL
                        , padding (Padding 10 0 0 0)
                        , inputType $ config.inputType
                        , background $ config.editTextBackground
                        , hint $ config.hint
                        , textSize $ config.editTextSize
                        ],
                    linearLayout
                        [ height MATCH_PARENT
                        , width $ V 1
                        , background "#bdbdbd"
                        , visibility $ config.pipeVisibility
                        ][],
                    imageView
                        [ height MATCH_PARENT
                        , width $ config.imageWidth
                        , visibility $ config.imageVisibility
                        , imageUrl $ config.imageUrl
                        , background $ config.imageBackground
                        , padding $ config.imagePadding
                        ]
                ]
        ]
