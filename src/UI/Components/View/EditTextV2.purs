module UI.Components.View.EditTextV2 where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Config.EditTextV2
import UI.Components.Controller.EditTextV2
import Utils

view :: forall w . (Action  -> Effect Unit) -> Config  -> PrestoDOM (Effect Unit) w
view push (Config config) =
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
                , gravity config.gravity
                , textSize config.textSize
                , text config.text
                ]
            ,imageView
                [ width config.iconWidth
                , height config.iconHeight
                , visibility if config.iconUrl == "" then GONE else VISIBLE 
                , imageUrl config.iconUrl
                , padding (PaddingLeft 11)
                ]
            ,textView
                [ width config.iconWidth
                , height config.iconHeight
                , visibility if config.iconText == "" then GONE else VISIBLE 
                , text config.iconText
                , color config.iconTextColor
                , textSize config.iconTextSize
                , case os of
                    "ANDROID" -> clickable config.iconClickable
                    _ -> userInteraction config.iconClickable
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
