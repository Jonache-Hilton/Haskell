module UI.Merchants.Dream11.View.Dream11Screen where

import Effect  (Effect)
import Prelude
import PrestoDOM
import UI.Merchants.Dream11.Controller.Dream11Screen
import UI.Merchants.Dream11.Config as Dream11Config
import UI.Components.View.BankListItem as BankListItem
import UI.Components.View.ToolBar as ToolBar
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.AmountView as AmountView
import UI.Components.Config.AmountView as AmountViewConfig
import UI.Components.View.PaymentOptions as PaymentOptions
import UI.Components.Config.PaymentOptions as PaymentOptionsConfig

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
  linearLayout_  (Namespace "Dream11Screen")
    [ height MATCH_PARENT
    , width MATCH_PARENT
    , background "#efefef"
    , orientation VERTICAL
    ]
    [ ToolBar.view (push <<< ToolBarAction) Dream11Config.toolBarConfigDream11
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
            [ AmountView.view (push <<< AmountViewAction) Dream11Config.amountConfigDream11 state.amountViewState
            , linearLayout 
                [ width MATCH_PARENT
                , height MATCH_PARENT
                , orientation VERTICAL
                ]
                [ PaymentOptions.view (push <<< PaymentOptionsAction) Dream11Config.dream11DebitPO
                , PaymentOptions.view (push <<< PaymentOptionsAction) Dream11Config.dream11NetPO
                , PaymentOptions.view (push <<< PaymentOptionsAction) Dream11Config.dream11WalletPO
                ]
            ]
        ]
    ]
