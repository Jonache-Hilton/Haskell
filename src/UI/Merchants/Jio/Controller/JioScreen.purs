module UI.Merchants.Jio.Controller.JioScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Config.BankListItem as BankListItemConfig
import UI.Components.Controller.BankListItem as BankListItem
import UI.Components.Controller.BankListItem as BankListItemig
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.EditTextV2 as EditTextV2
import UI.Components.Controller.PrimaryButton as PrimaryButton

type ScreenInput  = Unit
type ScreenOutput = JioOutput

data Action = JioAction
    | ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action
    | PaymentOptionsV2Action PaymentOptionsV2.Action
    | PaymentOptionsAction PaymentOptions.Action
    | PopularBanksAction BankListItem.Action
    | BankListItemAction BankListItem.Action
    | EditTextV2Action EditTextV2.Action
    | CloseSheet
    | CloseWalletSheet
    | DismissAction
    | SubmitButtonAction PrimaryButton.Action


type State = 
    { amountViewState :: AmountView.State
    , walletIcon :: String
    , sheetVisibility :: Boolean
    , walletSheetVisibility :: Boolean
    , popularBankState :: BankListItem.State
    , bankListItemState :: BankListItem.State
    }

initialState :: ScreenInput -> State
initialState input = 
    { amountViewState : AmountView.initialState
    , walletIcon : "ic_paytm"
    , sheetVisibility : false
    , walletSheetVisibility : false
    , popularBankState : BankListItem.initialState
    , bankListItemState : BankListItem.initialState
    }

eval JioAction state = continue state
eval CloseSheet state = continue $ state { sheetVisibility = (not state.sheetVisibility)}
eval CloseWalletSheet state = continue $ state { walletSheetVisibility = (not state.walletSheetVisibility)}
eval DismissAction state = continue $ state { sheetVisibility = false, walletSheetVisibility = false}
eval (PaymentOptionsV2Action (PaymentOptionsV2.ToggleOption id)) state = do
    case id of
        "1" -> exit JioUpi
        "2" -> continue $ state { walletSheetVisibility = (not state.walletSheetVisibility), walletIcon = "ic_jiomoney"}
        "3" -> continue $ state { walletSheetVisibility = (not state.walletSheetVisibility), walletIcon = "ic_paytm"}
        "4" -> continue $ state { walletSheetVisibility = (not state.walletSheetVisibility), walletIcon = "ic_phonepe"}
        _ -> continue state
    
eval (PaymentOptionsAction (PaymentOptions.ToggleOption id)) state = do
  case id of
    "1" -> exit JioCreditCard
    "2" -> exit JioDebitCard
    "3" -> continue $ state { sheetVisibility = (not state.sheetVisibility)}
    _ -> exit JioDebitCard
eval _ state = continue state

overrides "Jio" push state = [onClick push $ const JioAction]
overrides _ push state = []