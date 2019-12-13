module UI.Merchants.Vodafone.Controller.VodafoneScreen where

import Effect
import Prelude
import PrestoDOM
import Types
import UI.Types

import UI.Components.Controller.PopularBanks as PopularBanks
import UI.Components.Controller.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.ToolbarV2 as ToolbarV2
import UI.Components.Controller.SavedCardBack as SavedCardBack
import UI.Components.Controller.SavedCardFront as SavedCardFront

type ScreenInput  = Unit
type ScreenOutput = VodafoneScreenOutput

data Action = VodafoneAction
    | ToolbarV2Action ToolbarV2.Action
    | PaymentOptionsAction PaymentOptions.Action
    | PaymentOptionsV2Action PaymentOptionsV2.Action
    | PopularBanksAction PopularBanks.Action
    | SavedCardFrontAction SavedCardFront.Action
    | SavedCardBackAction SavedCardBack.Action
    | Card

type State = {
  showAllBanks :: Boolean,
  isFrontVisible :: Boolean
}

initialState :: ScreenInput -> State
initialState input = {
  showAllBanks : false,
  isFrontVisible : true
}

eval VodafoneAction state = continue state
eval Card state = continue $ state {isFrontVisible = (not state.isFrontVisible), showAllBanks = false}
eval (PaymentOptionsAction (PaymentOptions.ToggleOption id)) state = do
  case id of
    "1" -> exit VodaDebitCredit
    "2" -> continue $ state {showAllBanks = (not state.showAllBanks), isFrontVisible = true}
    "3" -> exit VodaViewNetBanks
    _ -> continue state
eval _ state = continue $ state

overrides "Vodafone" push state = [onClick push $ const VodafoneAction]
overrides _ push state = []