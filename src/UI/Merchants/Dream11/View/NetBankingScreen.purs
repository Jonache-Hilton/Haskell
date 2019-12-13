module UI.Merchants.Dream11.View.NetBankingScreen where

import Prelude
import PrestoDOM
import UI.Merchants.Dream11.Controller.NetBankingScreen

import Effect (Effect)
import UI.Components.Controller.PaymentOptions
import UI.Merchants.Dream11.Config as Dream11Config
import UI.Components.View.ToolBar as ToolBar
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.AmountView as AmountView
import UI.Components.View.BankListItem as BankListItem
import UI.Components.View.SearchBox as SearchBox


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
    , AmountView.view (push <<< AmountViewAction) Dream11Config.amountConfigDream11 state.dream11AmountViewState
    , linearLayout
        [ width MATCH_PARENT
        , height $ V 60
        , padding (Padding 10 10 10 10)
        , background "#E9E7E9"
        ]
        [ SearchBox.view (push <<< SearchBoxAction) Dream11Config.dream11SearchBox
        ]
    , textView
        [ width MATCH_PARENT
        , height $ V 24
        , text "POPULAR BANKS"
        , background "#F3F1F3"
        , color "#aaaaaa"
        , padding (Padding 8 2 8 2)
        ]
    , scrollView
      [ width MATCH_PARENT
      , height MATCH_PARENT
      ]
      [ linearLayout 
          [ width MATCH_PARENT
          , height MATCH_PARENT
          , orientation VERTICAL
          , background "#ffffff"
          ]
          [ BankListItem.view (push <<< NetBankingAction) Dream11Config.netBankingConfigDream11 $ state.dream11NetBankingState {name = "State bank of India", logo = "ic_sbi"}
          , BankListItem.view (push <<< NetBankingAction) Dream11Config.netBankingConfigDream11 $ state.dream11NetBankingState {name = "AXIS Bank"}
          , BankListItem.view (push <<< NetBankingAction) Dream11Config.netBankingConfigDream11 $ state.dream11NetBankingState {name = "HDFC Bank", logo = "ic_hdfc"}
          , BankListItem.view (push <<< NetBankingAction) Dream11Config.netBankingConfigDream11 $ state.dream11NetBankingState {name = "ICICI Bank", logo = "ic_icici"}
          , BankListItem.view (push <<< NetBankingAction) Dream11Config.netBankingConfigDream11 $ state.dream11NetBankingState {name = "IDBI Bank", logo = "ic_idbi"}
          , BankListItem.view (push <<< NetBankingAction) Dream11Config.netBankingConfigDream11 $ state.dream11NetBankingState {name = "Kotak Mahindra Bank", logo = "ic_kotak"}
          , BankListItem.view (push <<< NetBankingAction) Dream11Config.netBankingConfigDream11 $ state.dream11NetBankingState {name = "Punjab National Bank", logo = "ic_pnb"}
          , BankListItem.view (push <<< NetBankingAction) Dream11Config.netBankingConfigDream11 $ state.dream11NetBankingState {name = "Standard Chartered Bank", logo = "ic_scb"}
          ]
      ]
    ]
    where
      ToolBarConfig.Config toolBarConfig = Dream11Config.toolBarConfigDream11
      finalConfig = toolBarConfig {text = "NET BANKING"}
