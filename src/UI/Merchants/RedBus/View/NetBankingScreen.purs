module UI.Merchants.RedBus.View.NetBankingScreen where

import Prelude
import PrestoDOM
import UI.Merchants.RedBus.Controller.NetBankingScreen

import Effect (Effect)
import UI.Components.Controller.PaymentOptions
import UI.Merchants.RedBus.Config as RedBusConfig
import UI.Components.View.ToolBar as ToolBar
import UI.Components.View.SearchBox as SearchBox
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.AmountView as AmountView
import UI.Components.View.BankListItem as BankListItem

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
    [ ToolBar.view (push <<< ToolBarAction) $ (ToolBarConfig.Config finalConfig)
    , scrollView
      [ width MATCH_PARENT
      , height MATCH_PARENT
      ]
      [ linearLayout 
          [ width MATCH_PARENT
          , height MATCH_PARENT
          , orientation VERTICAL
          , background "#ffffff"
          , margin (Margin 10 0 10 0)
          , padding (Padding 10 0 10 0)
          ]
          [ SearchBox.view (push <<< SearchBoxAction) RedBusConfig.redBusSearchBox
          , BankListItem.view (push <<< NetBankingAction) RedBusConfig.redbusBankListItem $ state.redBusNetBankingState {name = "AXIS Bank"}
          , BankListItem.view (push <<< NetBankingAction) RedBusConfig.redbusBankListItem $ state.redBusNetBankingState {name = "State bank of India", logo = "ic_sbi"}
          , BankListItem.view (push <<< NetBankingAction) RedBusConfig.redbusBankListItem $ state.redBusNetBankingState {name = "HDFC Bank", logo = "ic_hdfc"}
          , BankListItem.view (push <<< NetBankingAction) RedBusConfig.redbusBankListItem $ state.redBusNetBankingState {name = "ICICI Bank", logo = "ic_icici"}
          , BankListItem.view (push <<< NetBankingAction) RedBusConfig.redbusBankListItem $ state.redBusNetBankingState {name = "IDBI Bank", logo = "ic_idbi"}
          , BankListItem.view (push <<< NetBankingAction) RedBusConfig.redbusBankListItem $ state.redBusNetBankingState {name = "Kotak Mahindra Bank", logo = "ic_kotak"}
          , BankListItem.view (push <<< NetBankingAction) RedBusConfig.redbusBankListItem $ state.redBusNetBankingState {name = "Punjab National Bank", logo = "ic_pnb"}
          , BankListItem.view (push <<< NetBankingAction) RedBusConfig.redbusBankListItem $ state.redBusNetBankingState {name = "Standard Chartered Bank", logo = "ic_scb"}
          ]
      ]
    ]
    where
      ToolBarConfig.Config toolBarConfig = RedBusConfig.toolBarConfigRedBus
      finalConfig = toolBarConfig {text = "NET BANKING"}
