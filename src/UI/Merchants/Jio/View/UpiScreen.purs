module UI.Merchants.Jio.View.UpiScreen where

import Prelude
import PrestoDOM
import UI.Merchants.Jio.Controller.UpiScreen

import Effect (Effect)
import UI.Components.View.PrimaryButton as PrimaryButton
import UI.Components.View.ToolBar as ToolBar
import UI.Components.View.EditText as EditText
import UI.Merchants.Jio.Config as JioConfig

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
  linearLayout_  (Namespace "UpiScreen")
    [ height MATCH_PARENT
    , width MATCH_PARENT
    , background "#ffffff"
    , orientation VERTICAL
    ]
    [ ToolBar.view (push <<< ToolBarAction) JioConfig.toolBarConfigJio
    , scrollView
        [ width MATCH_PARENT
        , height MATCH_PARENT
        ]
        [ linearLayout
            [ width MATCH_PARENT
            , height MATCH_PARENT
            , orientation VERTICAL
            ]
            [ linearLayout
                [ width MATCH_PARENT
                , height $ V 500
                , orientation VERTICAL
                , stroke "1,#aaaaaa"
                , cornerRadius 3.0
                ]
                [ linearLayout
                    [ width MATCH_PARENT
                    , height $ V 100
                    , padding (Padding 16 16 16 16)
                    ]
                    [ linearLayout
                        [ height MATCH_PARENT
                        , width $ V 0
                        , weight 1.0
                        ]
                        [ imageView
                            [ width $ V 150
                            , height $ V 80
                            , imageUrl "upi_logo"
                            ]
                        ]
                    , linearLayout
                        [ height MATCH_PARENT
                        , width $ V 100
                        ]
                        [ imageView
                            [ width MATCH_PARENT
                            , height $ V 80
                            , imageUrl "jio_billdesk"
                            ]
                        ]
                    ]
                , linearLayout [width MATCH_PARENT, height $ V 1, background "#aaaaaa"][]
                , linearLayout
                    [ width MATCH_PARENT
                    , height $ V 150
                    , orientation VERTICAL
                    , padding (Padding 16 16 16 16)
                    ]
                    [ linearLayout
                        [ width MATCH_PARENT
                        , height $ V 0
                        , weight 1.0
                        , orientation HORIZONTAL
                        ]
                        [ textView
                            [ width $ V 0
                            , height MATCH_PARENT
                            , weight 1.0
                            , text "Merchant Name"
                            , color "#000000"
                            ]
                        , textView
                            [ width $ V 0
                            , height MATCH_PARENT
                            , weight 1.0
                            , text "RELIANCEJIO"
                            , color "#000000"
                            ]
                        ]
                    , linearLayout
                        [ width MATCH_PARENT
                        , height $ V 0
                        , weight 1.0
                        , orientation HORIZONTAL
                        ]
                        [ textView
                            [ width $ V 0
                            , height MATCH_PARENT
                            , weight 1.0
                            , text "Payment Amount"
                            , color "#000000"
                            ]
                        , textView
                            [ width $ V 0
                            , height MATCH_PARENT
                            , weight 1.0
                            , text "₹ 19.00"
                            , color "#000000"
                            ]
                        ]
                    , linearLayout
                        [ width MATCH_PARENT
                        , height $ V 0
                        , weight 1.0
                        , orientation HORIZONTAL
                        ]
                        [ textView
                            [ width $ V 0
                            , height MATCH_PARENT
                            , weight 1.0
                            , text "Transaction Refrence No"
                            , color "#000000"
                            ]
                        , textView
                            [ width $ V 0
                            , height MATCH_PARENT
                            , weight 1.0
                            , text "PIC4681434682374"
                            , color "#000000"
                            ]
                        ]
                    ]
                , linearLayout [width MATCH_PARENT, height $ V 1, background "#aaaaaa"][]
                , linearLayout
                    [ width MATCH_PARENT
                    , height MATCH_PARENT
                    , padding (Padding 16 16 16 16)
                    , orientation VERTICAL
                    ]
                    [ textView
                        [ width MATCH_PARENT
                        , height $ V 40
                        , text "Enter your VPA"
                        , color "#000000"
                        , textSize 18
                        ]
                    , EditText.view (push <<< EditTextAction) JioConfig.jioVpaEditText
                    , PrimaryButton.view (push <<< PayButtonAction) JioConfig.jioPayButton
                    , linearLayout
                        [ width MATCH_PARENT
                        , height $ V 20
                        , orientation HORIZONTAL
                        , margin (MarginTop 24)
                        ]
                        [ linearLayout
                            [ width $ V 125
                            , height MATCH_PARENT
                            , orientation VERTICAL
                            ]
                            [ textView
                                [ width MATCH_PARENT
                                , height $ V 0
                                , weight 1.0
                                , color "#000000"
                                , text "Cancel and Go back"
                                ]
                            , textView
                                [ width MATCH_PARENT
                                , height $ V 1
                                , background "#000000"
                                ]
                            ]
                        , textView
                            [ width $ V 0
                            , height MATCH_PARENT
                            , weight 1.0
                            , text "to merchant"
                            , color "#000000"
                            , padding (PaddingLeft 4)
                            ]
                        ]
                    ]
                ]
            , linearLayout
                [ width MATCH_PARENT
                , height $ V 40
                , orientation HORIZONTAL
                , gravity CENTER
                ]
                [ imageView
                    [ width $ V 20
                    , height $ V 20
                    , imageUrl "jio_lock_black"
                    ]
                , textView
                    [ width $ V 120 
                    , height MATCH_PARENT
                    , text "PCI SDD Certified"
                    , color "#000000"
                    , gravity CENTER_VERTICAL
                    , margin (MarginLeft 5)
                    ]
                ]
            , linearLayout [width MATCH_PARENT, height $ V 1, background "#aaaaaa"][]
            ]
        ]
    ]
