module UI.Merchants.Grofers.View.GrofersScreen where

import Effect  (Effect)
import Prelude
import PrestoDOM
import UI.Merchants.Grofers.Controller.GrofersScreen
import UI.Merchants.Grofers.Config as GrofersConfig
import UI.Components.View.ToolBar as ToolBar
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.AmountView as AmountView
import UI.Components.Config.AmountView as AmountViewConfig
import UI.Components.View.PaymentOptions as PaymentOptions
import UI.Components.Config.PaymentOptions as PaymentOptionsConfig
import UI.Components.View.PopularBanks as PopularBanks

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "GrofersScreen")
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#efefef"
        , orientation VERTICAL
        ]
        [ ToolBar.view (push <<< ToolBarAction) GrofersConfig.toolBarConfigGrofers
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
                [ AmountView.view (push <<< AmountViewAction) GrofersConfig.amountConfigGrofers state.orderSummaryState
                , textView
                    [ height $ V 20
                    , width MATCH_PARENT
                    , text "Wallet"
                    , color "#000000"
                    , textSize 16
                    , margin (Margin 20 10 20 10)
                    ]
                , PaymentOptions.view (push <<< PaymentOptionsAction) GrofersConfig.grofersPaytmPO
                , PaymentOptions.view (push <<< PaymentOptionsAction) GrofersConfig.grofersPhonePePO
                , textView
                    [ height $ V 20
                    , width MATCH_PARENT
                    , text "Card"
                    , color "#000000"
                    , textSize 16
                    , margin (Margin 20 10 20 10)
                    ]
                , PaymentOptions.view (push <<< NewCardAction) GrofersConfig.grofersNewCard
                , textView
                    [ height $ V 20
                    , width MATCH_PARENT
                    , text "NetBanking"
                    , color "#000000"
                    , textSize 16
                    , margin (Margin 20 10 20 10)
                    ]
                , PopularBanks.view (push <<< PopularBanksAction) GrofersConfig.popularBanksConfig
                , textView
                    ([ height $ V 30
                    , width MATCH_PARENT
                    , text "View all banks >"
                    , color "#E96235"
                    , textSize 18
                    , background "#FFFFFF"
                    , padding (Padding 20 0 20 10)
                    , gravity CENTER
                    ] <> overrides "ViewBanks" push state)
                , textView
                    [ height $ V 20
                    , width MATCH_PARENT
                    , text "UPI"
                    , color "#000000"
                    , textSize 16
                    , margin (Margin 20 10 20 10)
                    ]
                , PaymentOptions.view (push <<< SelectUPIAction) GrofersConfig.grofersUPIPO
                ]
            ]
        ]
