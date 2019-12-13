module UI.Merchants.SpiceJet.Controller.SpiceJetScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import Engineering.Helpers.Commons (log)
import UI.Components.Config.BankListItem as BankListItemConfig
import UI.Components.Controller.AddCard as AddCard
import UI.Components.Controller.BankListItem as BankListItemig
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.PopularBanks as PopularBanks
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.EditText as EditText

type ScreenInput  = Unit
type ScreenOutput = Unit

data Action = SpiceJetAction
    | ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action 
    | PaymentOptionsAction PaymentOptions.Action
    | AddCardAction AddCard.Action
    | EditTextAction EditText.Action
    | PopularBanksAction PopularBanks.Action

type State = {
    orderSummaryState :: AmountView.State
    ,showAddCard :: Boolean
    ,showNetBanking :: Boolean
    ,showUpi :: Boolean
}

initialState :: ScreenInput -> State
initialState input = {
    orderSummaryState : AmountView.initialState
    ,showAddCard : false 
    ,showNetBanking : false
    ,showUpi : false
}

eval SpiceJetAction state = continue state
eval (PaymentOptionsAction (PaymentOptions.ToggleOption id)) state = do
    _ <- pure $ log "Action123" id
    case id of 
        "1" -> continue $ state {showAddCard = (not state.showAddCard), showNetBanking = false, showUpi = false}
        "2" -> continue $ state {showNetBanking = (not state.showNetBanking), showAddCard = false, showUpi = false}
        "3" -> continue $ state {showUpi = (not state.showUpi), showAddCard = false, showNetBanking = false}
        _ -> continue $ state
eval action state = continue state

overrides "SpiceJet" push state = [onClick push $ const SpiceJetAction]
overrides _ push state = []