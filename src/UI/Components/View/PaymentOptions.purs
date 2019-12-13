module UI.Components.View.PaymentOptions where

import Data.String
import Prelude
import UI.Components.Config.PaymentOptions
import UI.Components.Controller.PaymentOptions

import Effect (Effect)
import PrestoDOM 
import Utils


view :: forall w. (Action -> Effect Unit) -> Config -> PrestoDOM (Effect Unit) w
view push (Config config) = 
    linearLayout
    [ width MATCH_PARENT
    , height config.cardHeight
    , background config.background
    , orientation VERTICAL
    , gravity CENTER
    , onClick push (const $ ToggleOption config.id)
    , visibility if config.isFormVisible then VISIBLE else GONE
    , clickable config.clickable
    ]
    [ linearLayout
        [ width MATCH_PARENT
        , height $ V 0 
        , weight 1.0 
        , gravity CENTER
        , margin (MarginLeft 16)
        ]
        [ linearLayout
            [ height $ V 24
            , width $ V 24
            , cornerRadius 12.0
            , stroke "1,#8b8b8b"
            , background "#ffffff"
            , gravity CENTER
            , margin (Margin 0 0 12 0)
            , visibility config.checkBoxVisibility
            ]
            [ imageView
                [ height $ V 14
                , width $ V 14
                , cornerRadius 7.0
                , visibility config.checkVisibility
                , background "#b93540"
                , stroke "1,#8b8b8b"
                ]
            ]
        , imageView 
            [ width config.iconSize
            , height config.iconSize
            , visibility if config.bankIconUrl == "" then GONE else VISIBLE
            , margin (MarginRight 12)
            , imageUrl config.bankIconUrl
            ]
        , linearLayout
            [ width $ V 0 
            , height MATCH_PARENT
            , orientation VERTICAL
            , weight 1.0
            ]
            [ linearLayout 
                [ width MATCH_PARENT
                , height $ V 0 
                , weight 1.0
                , orientation VERTICAL  
                ]
                [ linearLayout
                    [ width MATCH_PARENT
                    , height $ V 0 
                    , weight 1.0 
                    , visibility if config.offerText == "" then GONE else VISIBLE 
                    ][]
                , linearLayout
                    [ width MATCH_PARENT
                    , height $ V 0 
                    , weight 1.0
                    , orientation HORIZONTAL
                    , gravity if config.offerText == "" then CENTER_VERTICAL else BOTTOM
                    -- , padding (PaddingBottom 4)
                    ]
                    [ textView
                        [ width if os == "ANDROID" then WRAP_CONTENT else V $ getLabelWidth config.text "AvenirNext-Medium" 18 0 0 
                        , height $ V 24
                        , text config.text
                        , color config.textColor
                        , gravity LEFT
                        , textSize 18
                        , typeface config.typeface
                        , fontStyle "AvenirNext-Medium"
                        ]
                    ,textView
                        [ width if os == "ANDROID" then WRAP_CONTENT else V $ getLabelWidth config.paymentOptionOffer "AvenirNext-Medium" 14 0 0 
                        , height $ V 20 
                        , visibility if config.paymentOptionOffer == "" then GONE else VISIBLE
                        , text config.paymentOptionOffer
                        , background "#ca001a"
                        , cornerRadius 9.0
                        , gravity CENTER_VERTICAL
                        , padding (Padding 8 0 8 0)
                        , margin (Margin 8 2 0 8)
                        , color "#ffffff"
                        , fontStyle "AvenirNext-Medium"
                        , textSize 14
                        , singleLine false 
                        , multipleLine "true"
                        ]
                    ]
                ]
            ,textView
                [ width MATCH_PARENT
                , height $ V 0 
                , weight 1.0
                , visibility if config.offerText == "" then GONE else VISIBLE
                , gravity TOP_VERTICAL
                , textSize 15
                , margin (Margin 0 0 0 0)
                , typeface config.typeface
                , text config.offerText
                , color config.offerTextColor
                , fontStyle config.font
                -- , fontStyle "AvenirNext-Medium"
                , singleLine false 
                , multipleLine "true"
                ]
            ]
        , linearLayout
            [ width $ V 28
            , visibility if config.rightArrowUrl == "" then GONE else VISIBLE
            , height MATCH_PARENT
            , orientation VERTICAL
            , gravity CENTER_VERTICAL
            , margin (MarginRight 10)
            ]
            [ imageView
                [ width config.rightArrowWidth
                , height config.rightArrowHeight
                , imageUrl config.rightArrowUrl    
                ]
            ]
        ]
    , linearLayout
        [ width MATCH_PARENT
        , height $ V 1
        , visibility if config.lineSeparaterColor == "" then GONE else VISIBLE
        , background config.lineSeparaterColor
        ]
        []
    ]
