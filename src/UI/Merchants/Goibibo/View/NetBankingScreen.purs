module UI.Merchants.Goibibo.View.NetBankingScreen where

import Effect  (Effect)
import Prelude
import PrestoDOM
import UI.Merchants.Goibibo.Controller.NetBankingScreen
import UI.Merchants.Goibibo.Config as GoibiboConfig
import UI.Components.View.ToolBar as ToolBar
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.PaymentOptions as PaymentOptions
import UI.Components.Config.PaymentOptions as PaymentOptionsConfig
import UI.Components.View.AmountView as AmountView
import UI.Components.View.PopularBanksV2 as PopularBanksV2
import UI.Components.View.BankListItem as BankListItem
import UI.Components.Config.AmountView as AmountViewConfig

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
  linearLayout_  (Namespace "NetBankingScreen")
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
        , margin (Margin 8 8 8 8)
        ]
        [ linearLayout
            [ height MATCH_PARENT
            , width MATCH_PARENT
            , orientation VERTICAL
            ]
            [ AmountView.view (push <<< AmountViewAction) GoibiboConfig.amountConfigGoibibo2 state.amountViewState
            , linearLayout
                [ width MATCH_PARENT
                , height MATCH_PARENT
                , translationY (-10.0)
                , translationZ 10.0
                , margin (Margin 0 16 0 16)
                , orientation VERTICAL
                ]
                [ textView
                    [ width MATCH_PARENT
                    , height $ V 40
                    , text "Popular Banks"
                    , padding (Padding 8 8 8 8)
                    , color "#2361B2"
                    , background "#ffffff"
                    ]
                , linearLayout [ width MATCH_PARENT, height $ V 1, background "#e0e0e0"][]
                , PopularBanksV2.view (push <<< PopularBanksAction) GoibiboConfig.goibiboPopularBank $ state.popularBankState {name = "State Bank of India", logo = "bank_sbi", index = 1}
                , PopularBanksV2.view (push <<< PopularBanksAction) GoibiboConfig.goibiboPopularBank $ state.popularBankState {name = "HDFC Bank", logo = "bank_hdfc", index = 2}
                , PopularBanksV2.view (push <<< PopularBanksAction) GoibiboConfig.goibiboPopularBank $ state.popularBankState {name = "ICICI NetBanking", logo = "bank_icici", index = 3}
                , PopularBanksV2.view (push <<< PopularBanksAction) GoibiboConfig.goibiboPopularBank $ state.popularBankState {name = "Kotak Mahindra Bank", logo = "bank_kotak", index = 4}
                , PopularBanksV2.view (push <<< PopularBanksAction) GoibiboConfig.goibiboPopularBank $ state.popularBankState {name = "AXIS Bank NetBanking", logo = "bank_axis", index = 5}
                , linearLayout
                    [ width MATCH_PARENT
                    , height MATCH_PARENT
                    , orientation VERTICAL
                    , margin (Margin 0 8 0 0)
                    ]
                    [ textView
                        [ width MATCH_PARENT
                        , height $ V 60
                        , text "Select your Bank"
                        , padding (Padding 16 8 8 8)
                        , color "#2361B2"
                        , background "#ffffff"
                        , gravity CENTER_VERTICAL
                        ]
                    , BankListItem.view (push <<< BankListItemAction) GoibiboConfig.goibiboBankListItem $ state.bankListItemState {name = "AXIS Bank NetBanking", index = 1}
                    , BankListItem.view (push <<< BankListItemAction) GoibiboConfig.goibiboBankListItem $ state.bankListItemState {name = "Airtel Payments Bank", index = 2}
                    , BankListItem.view (push <<< BankListItemAction) GoibiboConfig.goibiboBankListItem $ state.bankListItemState {name = "Bank of Inida", index = 3}
                    , BankListItem.view (push <<< BankListItemAction) GoibiboConfig.goibiboBankListItem $ state.bankListItemState {name = "Canara Bank", index = 4}
                    , BankListItem.view (push <<< BankListItemAction) GoibiboConfig.goibiboBankListItem $ state.bankListItemState {name = "HDFC Bank", index = 5}
                    , BankListItem.view (push <<< BankListItemAction) GoibiboConfig.goibiboBankListItem $ state.bankListItemState {name = "ICICI Netbanking", index = 6}
                    , BankListItem.view (push <<< BankListItemAction) GoibiboConfig.goibiboBankListItem $ state.bankListItemState {name = "State Bank of Inida", index = 7}
                    , BankListItem.view (push <<< BankListItemAction) GoibiboConfig.goibiboBankListItem $ state.bankListItemState {name = "Yes Bank", index = 8}
                    ]
                ]
            ]
        ]
    ]
    where
        ToolBarConfig.Config toolBarConfig = GoibiboConfig.toolBarConfigGoibibo
        finalConfig = toolBarConfig {text = "Net Banking", inputVisibility = state.searchBoxActive, hintText = "Enter Bank Name", actionIcon = if state.searchBoxActive then "toolbar_closebutton_ibibo" else "ic_search_white", iconVisibility = VISIBLE}
