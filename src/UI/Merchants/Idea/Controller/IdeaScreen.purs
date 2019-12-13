module UI.Merchants.Idea.Controller.IdeaScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Config.BankListItem as BankListItemConfig
import UI.Components.Controller.BankListItem as BankListItemig
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.AddCard as AddCard
import UI.Components.Controller.PopularBanks as PopularBanks
import UI.Components.Controller.PrimaryButton as PrimaryButton

type ScreenInput  = Unit
type ScreenOutput = Unit

data Action = ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action
    | AddCardAction AddCard.Action
    | PopularBanksAction PopularBanks.Action
    | PrimaryButtonAction PrimaryButton.Action
    | PaymentOptionsAction PaymentOptions.Action


type State = {
    amountViewState :: AmountView.State
}

initialState :: ScreenInput -> State
initialState input = {
    amountViewState : AmountView.initialState
}

eval _ state = continue state

overrides _ push state = []