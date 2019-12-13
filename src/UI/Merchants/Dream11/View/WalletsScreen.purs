module UI.Merchants.Dream11.View.WalletsScreen where

import Prelude
import PrestoDOM
import UI.Merchants.Dream11.Controller.WalletsScreen

import Effect (Effect)
import UI.Components.Controller.PaymentOptions
import UI.Merchants.Dream11.Config as Dream11Config
import UI.Components.View.ToolBar as ToolBar
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.AmountView as AmountView
import UI.Components.View.PaymentOptionsV2 as PaymentOptionsV2

screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view push state =
  linearLayout_  (Namespace "NetBankingScreen")
    [ height MATCH_PARENT
    , width MATCH_PARENT
    , background "#efefef"
    , orientation VERTICAL
    ]
    [ ToolBar.view (push <<< ToolBarAction) (ToolBarConfig.Config finalConfig)
    , AmountView.view (push <<< AmountViewAction) Dream11Config.amountConfigDream11 state.dream11AmountViewState
    , scrollView
      [ width MATCH_PARENT
      , height MATCH_PARENT
      ]
      [ linearLayout 
          [ width MATCH_PARENT
          , height MATCH_PARENT
          , orientation VERTICAL
          , background "#ffffff"
          , margin (Margin 0 16 0 0)
          ]
          [ PaymentOptionsV2.view (push <<< WalletsAction) Dream11Config.paymentOptionsV2ConfigDream11
          ]
      ]
    ]
    where
      ToolBarConfig.Config toolBarConfig = Dream11Config.toolBarConfigDream11
      finalConfig = toolBarConfig {text = "WALLETS"}
