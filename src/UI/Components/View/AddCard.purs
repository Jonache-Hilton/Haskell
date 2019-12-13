module UI.Components.View.AddCard where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Config.AddCard
import UI.Components.Controller.AddCard

view :: forall w . (Action  -> Effect Unit) -> Config  -> PrestoDOM (Effect Unit) w
view push (Config config) =
  linearLayout 
    [ width MATCH_PARENT
    , height config.height
    , background config.background
    , orientation VERTICAL
    , margin config.margin
    , padding config.padding
    , stroke config.stroke
    , cornerRadius config.cornerRadius
    , visibility if config.isFormVisible then VISIBLE else GONE
    ]
    [ if(config.version == 1) then (_addCardEditTextV1 config.editTextCardConfig) else (_addCardEditTextV2 config.editTextCardConfigV2)
    , if(config.version == 1) then (_addCardEditTextV1 config.editTextNameConfig) else (_addCardEditTextV2 config.editTextNameConfigV2)
    , linearLayout 
        [ width MATCH_PARENT
        , height MATCH_PARENT
        ]
        [ linearLayout
          [ height MATCH_PARENT
          , width config.widthDate
          , weight 1.0
          ]
          [ if(config.version == 1) then (_addCardEditTextV1 config.editTextDateConfig) else (_addCardEditTextV2 config.editTextDateConfigV2)
          ]
        , linearLayout
          [ height MATCH_PARENT
          , width config.widthCvv
          , weight 1.0
          ]
          [ if(config.version == 1) then (_addCardEditTextV1 config.editTextCvvConfig) else (_addCardEditTextV2 config.editTextCvvConfigV2)
          ]
        , imageView
            [ width $ V 40
            , height $ V 40
            , margin (Margin 0 30 8 0)
            , visibility if(config.imageUrl == "") then GONE else VISIBLE
            , imageUrl config.imageUrl
            ]
        ]
    ]

_addCardEditTextV1 :: forall w. EditTextConfig -> PrestoDOM (Effect Unit) w
_addCardEditTextV1 (EditTextConfig config) =
    linearLayout
        [ height $ config.parentHeight
        , width $ config.parentWidth
        , margin $ config.parentMargin
        , padding $ config.parentPadding
        , background $ config.parentBackground
        , orientation VERTICAL
        ] 
        [ textView
            [ height $ config.textHeight
            , width MATCH_PARENT
            , text $ config.text
            , textSize $ config.textSize
            , color $ config.textColor
            , typeface $ config.typeface
            , margin $ config.textMargin
            , gravity CENTER_VERTICAL
            , fontStyle config.font
            ]
        , linearLayout
            [ height $ config.rowHeight
            , width MATCH_PARENT
            , orientation HORIZONTAL
            , background "#f5f5f5"
            , stroke $ config.rowStroke
            , cornerRadius $ config.rowCornerRadius
            , padding $ config.rowPadding
            ]
            [ editText
                [ height MATCH_PARENT
                , width $ V 0
                , weight 1.0
                , gravity CENTER_VERTICAL
                , padding (Padding 10 0 0 0)
                , inputType $ config.inputType
                , background $ config.editTextBackground
                , hint $ config.hint
                , textSize $ config.editTextSize
                ]
            , linearLayout
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

_addCardEditTextV2 :: forall w. EditTextConfigV2 -> PrestoDOM (Effect Unit) w
_addCardEditTextV2 (EditTextConfigV2 config) = 
    linearLayout
        [ width config.cardWidth
        , height config.cardHeight
        , background config.background
        , orientation VERTICAL
        , margin config.margin
        , visibility config.visibility
        ]
        [ textView
            [ width MATCH_PARENT
            , height $ V 20
            , text config.hint
            , color "#aaaaaa"
            , visibility if config.hintOutOfEditText then VISIBLE else GONE
            , fontStyle config.font
            ]
        , linearLayout
            [ width MATCH_PARENT
            , height $ V 0
            , orientation HORIZONTAL
            , weight 1.0
            , padding config.editTextPadding 
            , gravity CENTER_VERTICAL
            ]
            [ editText
                [ width $ V 0
                , height MATCH_PARENT
                , hint if config.hintOutOfEditText then "" else config.hint
                , color config.textColor
                , weight 1.0
                , background config.background
                , hintColor config.hintColor
                , inputType config.inputType
                , visibility config.editTextVisibility
                ]
            ,imageView
                [ width config.iconWidth
                , height config.iconHeight
                , visibility if config.iconUrl == "" then GONE else VISIBLE 
                , imageUrl config.iconUrl
                , padding (PaddingLeft 10)
                ]
            ]
        , linearLayout
            [ width MATCH_PARENT
            , height $ V (config.lineSeparatorHeight + 4)
            , orientation HORIZONTAL
            , margin config.lineSeparatorMargin
            ]
            [ linearLayout
                [ width $ V (config.lineSeparatorHeight)
                , height $ V (config.lineSeparatorHeight + 4)
                , background config.lineSeparatorColor
                , visibility config.tickVisibility    
                ][]
            , linearLayout
                [ width $ V 0
                , height $ V (config.lineSeparatorHeight)
                , background config.lineSeparatorColor
                , margin (MarginTop case config.tickVisibility of 
                                VISIBLE  ->  4
                                _ -> 0)
                , weight 1.0    
                ][]
            , linearLayout
                [ width $ V (config.lineSeparatorHeight)
                , height $ V (config.lineSeparatorHeight + 4)
                , background (config.lineSeparatorColor)
                , visibility config.tickVisibility
                ][]
            ]
        ]
