module UI.Merchants.Goibibo.View.GoibiboScreen where

import Effect  (Effect)
import Prelude
import PrestoDOM
import UI.Merchants.Goibibo.Controller.GoibiboScreen
import UI.Merchants.Goibibo.Config as GoibiboConfig
import UI.Components.View.ToolBar as ToolBar
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.PaymentOptions as PaymentOptions
import UI.Components.Config.PaymentOptions as PaymentOptionsConfig
import UI.Components.View.AmountView as AmountView
import UI.Components.Config.AmountView as AmountViewConfig

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "GoibiboScreen")
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#efefef"
        , orientation VERTICAL
        ]
        [ ToolBar.view (push <<< ToolBarAction) GoibiboConfig.toolBarConfigGoibibo
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
                [ AmountView.view (push <<< AmountViewAction) GoibiboConfig.amountConfigGoibibo state.orderSummaryState
                , textView
                    [ height $ V 70
                    , width MATCH_PARENT
                    , text "By proceeding, you accept the booking terms and Goibibo general terms of use and services"
                    , gravity CENTER
                    , textSize 16
                    , background "#202662B8"
                    , padding (Padding 34 16 34 16)
                    , color "#2662B8"
                    ]
                , textView
                    [ height $ V 38
                    , width MATCH_PARENT
                    , text "Payment Option"
                    , color "#2662B8"
                    , background "#ffffff"
                    , textSize 18
                    , padding (Padding 16 10 0 0)
                    ]
                , PaymentOptions.view (push <<< PaymentOptionsAction) GoibiboConfig.goibiboUPI
                , PaymentOptions.view (push <<< PaymentOptionsAction) GoibiboConfig.goibiboCredit
                , PaymentOptions.view (push <<< PaymentOptionsAction) GoibiboConfig.goibiboDebit
                , PaymentOptions.view (push <<< PaymentOptionsAction) GoibiboConfig.goibiboNetBank
                ]
            ]
        ]
