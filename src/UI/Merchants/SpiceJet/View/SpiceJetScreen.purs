module UI.Merchants.SpiceJet.View.SpiceJetScreen where

import Prelude
import PrestoDOM
import UI.Merchants.SpiceJet.Controller.SpiceJetScreen
import UI.Merchants.SpiceJet.Config as SpiceJetConfig

import Effect (Effect)
import UI.Components.Config.AddCard as AddCardConfig
import UI.Components.Config.AmountView as AmountViewConfig
import UI.Components.Config.PaymentOptions as PaymentOptionsConfig
import UI.Components.Config.PopularBanks as PopularBanksConfig
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.Config.EditText as EditText
import UI.Components.View.AddCard as AddCard
import UI.Components.View.EditText as EditText
import UI.Components.View.BankListItem as BankListItem
import UI.Components.View.AmountView as AmountView
import UI.Components.View.PaymentOptions as PaymentOptions
import UI.Components.View.PopularBanks as PopularBanks
import UI.Components.View.ToolBar as ToolBar


screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "SpiceJetScreen")
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#ffffff"
        , orientation VERTICAL
        ]
        [ ToolBar.view (push <<< ToolBarAction) SpiceJetConfig.toolBarConfigSpiceJet
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
                [ AmountView.view (push <<< AmountViewAction) SpiceJetConfig.amountConfigSpiceJet state.orderSummaryState
                , linearLayout
                    [ height $ V 1
                    , width MATCH_PARENT
                    , background "#dcdbdc"
                    ][]
                , PaymentOptions.view (push <<< PaymentOptionsAction) SpiceJetConfig.spiceJetDebitPO
                , AddCard.view (push <<< AddCardAction) (getAddCardConfig state.showAddCard)
                , PaymentOptions.view (push <<< PaymentOptionsAction) SpiceJetConfig.spiceJetNetPO
                , PopularBanks.view (push <<< PopularBanksAction) (getPopularBanksConfig state.showNetBanking)
                , PaymentOptions.view (push <<< PaymentOptionsAction) SpiceJetConfig.spiceJetUPIPO
                , EditText.view (push <<< EditTextAction) (getVpaEditTextConfig state.showUpi)
                , PaymentOptions.view (push <<< PaymentOptionsAction) SpiceJetConfig.spiceJetPaytmPO
                , PaymentOptions.view (push <<< PaymentOptionsAction) SpiceJetConfig.spiceJetWalletPO
                ]
            ]
        ]

getAddCardConfig :: Boolean -> AddCardConfig.Config
getAddCardConfig  showAddCard = 
    if showAddCard then
        let (AddCardConfig.Config config) = SpiceJetConfig.spiceJetAddCardConfig
            newCon  = config {isFormVisible = true}
        in (AddCardConfig.Config newCon)
     else 
        let (AddCardConfig.Config config) = (SpiceJetConfig.spiceJetAddCardConfig)
            newConf = config  {isFormVisible = false}
        in  (AddCardConfig.Config newConf)

getPopularBanksConfig :: Boolean -> PopularBanksConfig.Config
getPopularBanksConfig  showNetBanking = 
    if showNetBanking then
        let (PopularBanksConfig.Config config) = SpiceJetConfig.spiceJetPopularBanksConfig
            newCon  = config {isFormVisible = true}
        in (PopularBanksConfig.Config newCon)
     else 
        let (PopularBanksConfig.Config config) = (SpiceJetConfig.spiceJetPopularBanksConfig)
            newConf = config  {isFormVisible = false}
        in  (PopularBanksConfig.Config newConf)

getVpaEditTextConfig :: Boolean -> EditText.Config
getVpaEditTextConfig  showUpi = 
    if showUpi then
        let (EditText.Config config) = SpiceJetConfig.spiceJetVpaEditText
            newCon  = config {isFormVisible = true}
        in (EditText.Config newCon)
     else 
        let (EditText.Config config) = (SpiceJetConfig.spiceJetVpaEditText)
            newConf = config  {isFormVisible = false}
        in  (EditText.Config newConf)