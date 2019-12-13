module UI.Merchants.Jio.View.JioScreen where

import Prelude
import PrestoDOM
import UI.Merchants.Jio.Controller.JioScreen

import Effect (Effect)
import UI.Components.Config.AmountView as AmountViewConfig
import UI.Components.Config.PaymentOptionsV2 as PaymentOptionsV2Config
import UI.Components.Config.PaymentOptions as PaymentOptionsConfig
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.BankListItem as BankListItem
import UI.Components.View.AmountView as AmountView
import UI.Components.View.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.View.PaymentOptions as PaymentOptions
import UI.Components.View.PrimaryButton as PrimaryButton
import UI.Components.View.ToolBar as ToolBar
import UI.Components.View.EditTextV2 as EditTextV2
import UI.Merchants.Jio.Config as JioConfig

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
    relativeLayout_ (Namespace "JioScreen")
        [ width MATCH_PARENT
        , height MATCH_PARENT
        ]
        [ linearLayout
            [ height MATCH_PARENT
            , width MATCH_PARENT
            , background "#ffffff"
            , orientation VERTICAL
            ]
            [ ToolBar.view (push <<< ToolBarAction) JioConfig.toolBarConfigJio
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
                    [ AmountView.view (push <<< AmountViewAction) JioConfig.amountConfigJio state.amountViewState
                    , linearLayout
                        [ width MATCH_PARENT
                        , height MATCH_PARENT
                        , margin (Margin 20 20 20 0)
                        , orientation VERTICAL
                        ]
                        [ linearLayout
                            [ width MATCH_PARENT
                            , height MATCH_PARENT
                            , orientation VERTICAL
                            , stroke "1,#e1e1e1"
                            , padding (Padding 0 4 0 4)
                            , cornerRadius 4.0
                            ]
                            [ PaymentOptionsV2.view (push <<< PaymentOptionsV2Action) JioConfig.jioUpiConfig
                            ]
                        , textView
                            [ height $ V 20
                            , width MATCH_PARENT
                            , text "Wallets"
                            , color "#a1a1a1"
                            , textSize 18
                            , margin (MarginVertical 20 10)
                            ]
                        , linearLayout
                            [ width MATCH_PARENT
                            , height MATCH_PARENT
                            , orientation VERTICAL
                            , stroke "1,#e1e1e1"
                            , padding (Padding 0 4 0 4)
                            , cornerRadius 4.0
                            ]
                            [ PaymentOptionsV2.view (push <<< PaymentOptionsV2Action) JioConfig.jioMoneyConfig
                            , PaymentOptionsV2.view (push <<< PaymentOptionsV2Action) JioConfig.jioPaytmConfig
                            , PaymentOptionsV2.view (push <<< PaymentOptionsV2Action) JioConfig.jioPhonepeConfig
                            ]
                        , textView
                            [ height $ V 20
                            , width MATCH_PARENT
                            , text "Other Payment options"
                            , color "#a1a1a1"
                            , textSize 18
                            , margin (MarginVertical 20 10)
                            ]
                        , linearLayout
                            [ width MATCH_PARENT
                            , height MATCH_PARENT
                            , orientation VERTICAL
                            , stroke "1,#e1e1e1"
                            , cornerRadius 4.0
                            , padding (Padding 0 4 0 4)
                            ]
                            [ PaymentOptions.view (push <<< PaymentOptionsAction) JioConfig.jioCredit
                            , PaymentOptions.view (push <<< PaymentOptionsAction) JioConfig.jioDebit
                            , PaymentOptions.view (push <<< PaymentOptionsAction) JioConfig.jioNet
                            ]
                        ]
                    ]
                ]
            ]
        , linearLayout 
            [ width MATCH_PARENT
            , height MATCH_PARENT
            , background  "#616161"
            , alpha 0.8
            , visibility if (state.sheetVisibility || state.walletSheetVisibility) then VISIBLE else GONE
            , clickable (state.sheetVisibility || state.walletSheetVisibility)
            , focusable (state.sheetVisibility || state.walletSheetVisibility)
            , onClick push $ const DismissAction
            ] []
        , linearLayout
            [ width MATCH_PARENT
            , height MATCH_PARENT
            , visibility if state.sheetVisibility then VISIBLE else GONE
            , margin (Margin 8 80 8 0)
            , background "#ffffff"
            , cornerRadius 5.0
            ]
            [ scrollView
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
                        , height $ V 60
                        , orientation HORIZONTAL
                        , gravity CENTER
                        ]
                        [ textView 
                            [ width $ V 0
                            , height MATCH_PARENT
                            , weight 1.0
                            , text "Choose a Bank"
                            , gravity CENTER_VERTICAL
                            , padding (PaddingLeft 32)
                            , textSize 20
                            ]
                        , linearLayout
                            [ height MATCH_PARENT
                            , width $ V 32
                            , orientation HORIZONTAL
                            , onClick push $ const CloseSheet
                            , gravity CENTER
                            ]
                            [ imageView
                                [ width $ V 14
                                , height $ V 14
                                , margin (MarginRight 8)
                                , imageUrl "ic_close_gray"
                                ]
                            ]
                        ]
                    , linearLayout [ width MATCH_PARENT, height $ V 1, background "#E0E0E0", margin (Margin 32 0 32 0)] []
                    , linearLayout
                        [ width MATCH_PARENT
                        , height MATCH_PARENT
                        , orientation VERTICAL
                        , padding (Padding 16 8 16 8)
                        ]
                        [ BankListItem.view (push <<< PopularBanksAction) JioConfig.jioBankListItem $ state.bankListItemState {name = "AXIS Bank (Retail)", index = 1}
                        , BankListItem.view (push <<< PopularBanksAction) JioConfig.jioBankListItem $ state.bankListItemState {name = "HDFC Bank (Retail)", index = 2}
                        , BankListItem.view (push <<< PopularBanksAction) JioConfig.jioBankListItem $ state.bankListItemState {name = "ICICI Bank (Retail)", index = 3}
                        , BankListItem.view (push <<< PopularBanksAction) JioConfig.jioBankListItem $ state.bankListItemState {name = "Kotak Bank", index = 4}
                        , BankListItem.view (push <<< PopularBanksAction) JioConfig.jioBankListItem $ state.bankListItemState {name = "State Bank of India", index = 5}
                        ]
                    , linearLayout [ width MATCH_PARENT, height $ V 1, background "#E0E0E0", margin (Margin 32 0 32 0)] []
                    , linearLayout
                        [ width MATCH_PARENT
                        , height MATCH_PARENT
                        , orientation VERTICAL
                        , padding (Padding 16 8 16 8)
                        ]
                        [ BankListItem.view (push <<< BankListItemAction) JioConfig.jioBankListItem $ state.bankListItemState {name = "Allahabad Bank(Retail)", index = 1}
                        , BankListItem.view (push <<< BankListItemAction) JioConfig.jioBankListItem $ state.bankListItemState {name = "Andhra Bank (Retail)", index = 2}
                        , BankListItem.view (push <<< BankListItemAction) JioConfig.jioBankListItem $ state.bankListItemState {name = "ICICI Bank (Retail)", index = 3}
                        , BankListItem.view (push <<< BankListItemAction) JioConfig.jioBankListItem $ state.bankListItemState {name = "Kotak Bank", index = 4}
                        , BankListItem.view (push <<< BankListItemAction) JioConfig.jioBankListItem $ state.bankListItemState {name = "State Bank of India", index = 5}
                        ]
                    ]
                ]
            ]
        , linearLayout
            [ width MATCH_PARENT
            , height MATCH_PARENT
            , gravity CENTER
            , visibility if state.walletSheetVisibility then VISIBLE else GONE
            ]
            [ linearLayout
                [ width MATCH_PARENT
                , height $ V 290
                , margin (Margin 12 0 12 0)
                , background "#ffffff"
                , cornerRadius 8.0
                , orientation HORIZONTAL
                ]
                [ linearLayout
                    [ height MATCH_PARENT
                    , width $ V 0
                    , weight 1.0
                    , padding (PaddingLeft 28)
                    , orientation VERTICAL
                    , gravity CENTER_HORIZONTAL
                    ]
                    [ imageView
                        [ width $ V 60
                        , height $ V 60
                        , margin (MarginTop 8)
                        , imageUrl state.walletIcon
                        ]
                    , textView 
                        [ width MATCH_PARENT
                        , height $ V 80
                        , gravity CENTER
                        , text "Please provide your registered mobile number to send you an OTP"
                        , textSize 20
                        ]
                    , EditTextV2.view (push <<< EditTextV2Action) JioConfig.jioWalletEditText
                    , PrimaryButton.view (push <<< SubmitButtonAction) JioConfig.jioSubmitButton 
                    ]
                , linearLayout
                    [ height $ V 20
                    , width $ V 20
                    , orientation HORIZONTAL
                    , onClick push $ const CloseWalletSheet
                    , padding (Padding 0 8 8 0)
                    ]
                    [ imageView
                        [ width MATCH_PARENT
                        , height $ V 14
                        , imageUrl "ic_close_gray"
                        ]
                    ]
                ]
            ]
        ]