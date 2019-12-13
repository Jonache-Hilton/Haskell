module UI.Components.View.BankListItem where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Controller.BankListItem
import UI.Components.Config.BankListItem

view :: forall w . (Action  -> Effect Unit) -> Config -> State -> PrestoDOM (Effect Unit) w
view push (Config config) state =
    linearLayout
        ([ height $ V config.cardHeight
        , width MATCH_PARENT
        , background config.background
        , gravity $ CENTER
        , orientation VERTICAL
        , padding config.cardPadding --(Padding 10 0 10 0)
        ] <> overrides "Clicked" push state)
        [ linearLayout
            [ height $ V 0
            , width MATCH_PARENT
            , weight 1.0
            , gravity $ CENTER
            , orientation config.orientation
            ]
            $ body push (Config config) state
        , linearLayout
                [ height $ V 1
                , width MATCH_PARENT
                , margin config.dividerMargin
                , visibility config.dividerVisibility
                , background config.dividerColor
                ]
                []
        ]

body push (Config config) state = 
        case config.radioDirection of
            Left -> radioButton push config state
            _ -> []
        <> 
            [ imageView
                [ height $ V config.bankImageSize
                , width $ V config.bankImageSize
                , margin case config.orientation of 
                            HORIZONTAL -> (MarginLeft 10)
                            VERTICAL -> (MarginLeft 0)
                , padding config.bankImagePadding
                , visibility config.bankImageVisible
                , imageUrl state.logo
                ]
            , textView
                [ height MATCH_PARENT
                , weight 1.0
                , color config.bankTextColor
                , margin case config.orientation of 
                            HORIZONTAL -> (MarginLeft 10)
                            VERTICAL -> (MarginTop 0)
                , padding config.bankTextPadding
                , textSize config.bankTextSize
                , gravity CENTER_VERTICAL
                , text state.name
                , typeface if state.active then BOLD else NORMAL
                , fontStyle config.font
                ]
            ]
        <>
            case config.radioDirection of
                Right -> radioButton push config state
                _ -> []
        <>
            [ imageView
                [ height $ V 24
                , width $ V 24
                , visibility config.arrowVisible
                , imageUrl config.arrowImage
                ]
            ]

radioButton push config state = [
    linearLayout
        [ height config.radioSize
        , width config.radioSize
        , cornerRadius 100.0
        , stroke $ "1," <> config.radioOuterColor 
        , background "#ffffff"
        , gravity CENTER
        , padding config.radioPadding
        , margin config.radioMargin
        ]
        [ imageView
            [ height MATCH_PARENT
            , width MATCH_PARENT
            , cornerRadius 100.0
            , visibility if state.active then VISIBLE else GONE
            , background if state.active then config.radioInnerColor else "#00FFFFFF"
            , imageUrl config.radioImage
            ]
        ]
]