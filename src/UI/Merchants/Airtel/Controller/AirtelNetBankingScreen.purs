module UI.Merchants.Airtel.Controller.AirtelNetBankingScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Config.BankListItem as BankListItemConfig
import UI.Components.Controller.BankListItem as BankListItem
import UI.Components.Controller.SearchBox as SearchBox
import UI.Components.Controller.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.PrimaryButton as PrimaryButton
import UI.Merchants.Dream11.Controller.AddCardScreen (Action(..))

type ScreenInput  = Unit
type ScreenOutput = Unit

data Action = AirtelAction
    | ToolBarAction ToolBar.Action
    | SearchBoxAction SearchBox.Action 
    | BankListItemAction BankListItem.Action
    | PrimaryButtonAction PrimaryButton.Action
 
type State = {
    bankListItemState :: BankListItem.State
}

initialState :: ScreenInput -> State
initialState input = {
    bankListItemState : BankListItem.initialState
}

eval AirtelAction state = continue state
eval _ state = continue state

overrides "Airtel" push state = [onClick push $ const AirtelAction]
overrides _ push state = []