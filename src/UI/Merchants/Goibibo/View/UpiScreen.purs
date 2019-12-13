module UI.Merchants.Goibibo.View.UpiScreen where

import Prelude
import PrestoDOM
import Effect (Effect)
import UI.Merchants.Goibibo.Controller.UpiScreen

import UI.Merchants.Goibibo.Config as GoibiboConfig
import UI.Components.Config.AmountView as AmountViewConfig
import UI.Components.Config.PaymentOptions as PaymentOptionsConfig
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.Config.PrimaryButton as PrimaryButtonConfig
import UI.Components.Config.EditTextV2 as EditTextV2Config
import UI.Components.View.AmountView as AmountView
import UI.Components.View.PaymentOptions as PaymentOptions
import UI.Components.View.ToolBar as ToolBar
import UI.Components.View.EditTextV2 as EditTextV2
import UI.Components.View.PrimaryButton as PrimaryButton

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
    , background "#efefef"
    , orientation VERTICAL
    ]
    [ ToolBar.view (push <<< ToolBarAction) (ToolBarConfig.Config finalConfig)
    , scrollView 
        [ height $ V 0
        , weight 1.0
        , width MATCH_PARENT
        ]
        [ linearLayout
            [ height MATCH_PARENT
            , width MATCH_PARENT
            , orientation VERTICAL
            ]
            [ AmountView.view (push <<< AmountViewAction) GoibiboConfig.amountConfigGoibibo2 state.orderSummaryState
            , linearLayout
                [ width MATCH_PARENT
                , height MATCH_PARENT
                , orientation VERTICAL
                , background "#ffffff"
                , margin (MarginTop 16)
                , translationY (-10.0)
                , translationZ 10.0
                ]
                [ linearLayout
                    [ width MATCH_PARENT
                    , height $ V 0
                    , weight 1.0
                    , orientation VERTICAL
                    ]
                    [ linearLayout
                        [ width MATCH_PARENT
                        , height $ V 60
                        , padding (Padding 16 16 16 16)
                        , orientation HORIZONTAL
                        ]
                        [ textView
                            [ width $ V 0
                            , height MATCH_PARENT
                            , weight 1.0
                            , text "Select UPI Payment Provider"
                            , textSize 20
                            , color "#000000"
                            ]
                        , imageView
                            [ width $ V 24
                            , height $ V 24
                            , imageUrl "ic_info_blue"
                            ]
                        ]
                    , textView
                        [ width MATCH_PARENT
                        , height $ V 30
                        , text "we have detected the following apps on your device"
                        , padding (Padding 16 0 16 0)
                        ]
                    ]
                ]
            , linearLayout
                [ width MATCH_PARENT
                , height MATCH_PARENT
                , orientation VERTICAL
                , background "#ffffff"
                , margin (MarginTop 16)
                , translationY (-10.0)
                , translationZ 10.0
                ]
                [ linearLayout
                    [ width MATCH_PARENT
                    , height $ V 60
                    , padding (Padding 16 16 16 16)
                    , orientation HORIZONTAL
                    ]
                    [ textView
                        [ width $ V 0
                        , height MATCH_PARENT
                        , weight 1.0
                        , text "Or Manually Enter VPA"
                        , textSize 20
                        , color "#000000"
                        ]
                    , imageView
                        [ width $ V 24
                        , height $ V 24
                        , imageUrl "ic_info_blue"
                        ]
                    ]
                , EditTextV2.view (push <<< VpaAction) GoibiboConfig.goibiboVpaEditText
                , PrimaryButton.view (push <<< VerifyButtonAction) (PrimaryButtonConfig.Config verifyButtonConfig)
                ]
            ]
        ]
    ]
    where
      ToolBarConfig.Config toolBarConfig = GoibiboConfig.toolBarConfigGoibibo
      finalConfig = toolBarConfig {text = "UPI"}
      PrimaryButtonConfig.Config verifyButton = GoibiboConfig.goibiboPayButton
      verifyButtonConfig = verifyButton {text = "VERIFY", margin = (Margin 16 16 16 16)}
