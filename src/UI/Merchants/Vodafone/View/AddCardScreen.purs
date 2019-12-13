module UI.Merchants.Vodafone.View.AddCardScreen where

import Prelude
import PrestoDOM

import UI.Merchants.Vodafone.Controller.AddCardScreen

import Effect (Effect)
import UI.Components.Config.AddCard as AddCardConfig
import UI.Components.Config.PrimaryButton as PrimaryButtonConfig
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.AddCard as AddCard
import UI.Components.View.PrimaryButton as PrimaryButton
import UI.Components.View.ToolBar as ToolBar
import UI.Components.View.ToolbarV2 as ToolbarV2
import UI.Merchants.Vodafone.Config as VodafoneConfig

screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view push state =
    linearLayout_ (Namespace "AddCardScreen")
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#ffffff"
        , orientation VERTICAL
        ] 
        [ ToolbarV2.view (push <<< ToolbarV2Action) (ToolBarConfig.Config finalConfig)
        , scrollView
            [ width MATCH_PARENT
            , height $ V 0
            , weight 1.0
            ]
            [ linearLayout
                [ width MATCH_PARENT
                , height $ V 60
                , orientation VERTICAL
                ]
                [ linearLayout
                    [ height MATCH_PARENT
                    , width MATCH_PARENT
                    , orientation HORIZONTAL
                    , padding (Padding 10 10 0 0)
                    ] 
                    [ linearLayout
                        [ height MATCH_PARENT
                        , width $ V 0
                        , weight 1.0
                        , orientation VERTICAL
                        ]
                        [ linearLayout
                            [ height $ V 0
                            , weight 1.0
                            , width MATCH_PARENT
                            , orientation HORIZONTAL
                            ] 
                            [ linearLayout
                                [ height $ V 12
                                , width $ V 12
                                , cornerRadius 6.0
                                , background "#00bfa5"
                                , margin (Margin 0 3 4 0)
                                ][]
                            , textView
                                [ text "Visa/Mastercard/Maestro/Diners/Rupay"
                                ]
                            ]
                        , textView
                            [ width MATCH_PARENT
                            , height $ V 0
                            , weight 1.0
                            , text "/JCB/Discover"
                            ]
                        ]
                    , linearLayout
                        [ height MATCH_PARENT
                        , width $ V 150
                        , orientation HORIZONTAL
                        ] 
                        [ linearLayout
                            [ height $ V 12
                            , width $ V 12
                            , cornerRadius 6.0
                            , stroke "1,#efefef"
                            , margin (Margin 0 3 4 0)
                            ][]
                        , textView
                            [ text "American Express"
                            ]
                        ]
                    ]
                , linearLayout
                    [ height $ V 1
                    , width MATCH_PARENT
                    , background "#efefef"
                    ] []
                , linearLayout
                    [ width MATCH_PARENT
                    , height $ V 260
                    ] 
                    [ AddCard.view (push <<< AddCardAction) VodafoneConfig.addCardConfigVodafone
                    ]
                , linearLayout
                    [ width MATCH_PARENT
                    , height $ V 40
                    , padding (Padding 10 0 10 0)
                    ] 
                    [ textView
                        [ height MATCH_PARENT
                        , width $ V 0
                        , weight 1.0
                        , text "Save this card for future transactions"
                        , color "#000000"
                        , textSize 16
                        , gravity CENTER_VERTICAL
                        ]
                    , switch
                        [ width $ V 45
                        , height MATCH_PARENT
                        , colorFilter "#000000"
                        ]
                    ]
                ]
            ]
        , linearLayout
                    [ width MATCH_PARENT
                    , height $ V 60
                    , margin (Margin 10 20 10 0)
                    ] 
                    [ PrimaryButton.view (push <<< PrimaryButtonAction) VodafoneConfig.primaryPayButtonConfigVodafone
                    ]
        ]
        where
            ToolBarConfig.Config toolBarConfig = VodafoneConfig.toolBarConfigVodafone
            finalConfig = toolBarConfig {text = "Card Details"}