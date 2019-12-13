module UI.Merchants.Airtel.Controller.AirtelScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Config.BankListItem as BankListItemConfig
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.BankListItem as BankListItem
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Controller.PopularBanks as PopularBanks
import UI.Components.Controller.ToolBar as ToolBar

type ScreenInput  = Unit
type ScreenOutput = AirtelOutput 

data Action = AirtelAction
    | ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action
    | PopularBanksAction PopularBanks.Action 
    | PaymentOptionsAction PaymentOptions.Action
    | PaymentOptionsV2Action PaymentOptionsV2.Action

type State = {
    orderSummaryState :: AmountView.State
}

initialState :: ScreenInput -> State
initialState input = {
    orderSummaryState : AmountView.initialState
}

eval AirtelAction state = exit GoToAirtelNB
eval (PaymentOptionsV2Action (PaymentOptionsV2.ToggleOption id)) state = do
  case id of
    "1" -> exit AirtelCard
    _ -> continue state
eval _ state = continue state

overrides "Airtel" push state = [onClick push $ const AirtelAction]
overrides _ push state = []