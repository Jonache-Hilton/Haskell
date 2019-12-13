module UI.Merchants.BigBasket.Controller.WalletScreen where

import Effect
import Prelude
import PrestoDOM
import Types
import UI.Types

import UI.Components.Config.BankListItem as BankListItemConfig
import UI.Components.Controller.AddCard as AddCard
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.BankListItem as BankListItemig
import UI.Components.Controller.EditText (Action(..))
import UI.Components.Controller.EditText as EditText
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.PopularBanks as PopularBanks
import UI.Components.Controller.PrimaryButton as PrimaryButton
import UI.Components.Controller.ToolBar as ToolBar
--import Engineering.Helpers.Commons (getOS, log)
--import Effect.Console (logShow)




type ScreenInput  = WalletScreenState
type ScreenOutput = WalletScreenOutput

data Action = ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action
    | AddCardAction AddCard.Action
    | PopularBanksAction PopularBanks.Action
    | PrimaryButtonAction PrimaryButton.Action
    | PaymentOptionsAction PaymentOptions.Action
    | EditTextAction EditText.Action
    | BackPressed
    


type State = {
    amountViewState :: AmountView.State
    , amount :: String
    , mobileNo :: String
    --, username :: String -- , prefferedOptions :: Array String
    -- , orderAmount :: String 
    -- , bbWalletAmount :: String
    -- , savedOptionName :: Array String 
    -- , savedOptionDetails :: Array String 
    -- , savedOptionTypeIcon :: Array String 
    -- , savedOptionOfferText :: Array String     
    -- , savedOptionIcon :: Array String
    -- , savedOptionIconWidth :: Array Length  
}

initialState :: ScreenInput -> State
initialState (WalletScreenState input) = {
    amountViewState : AmountView.initialState
    , amount : input.amount
    , mobileNo : ""

        
}

eval BackPressed state = exit $ GoBackFromBBWalletScreen
eval (EditTextAction (TextChanged str)) state = continue $ state {mobileNo = str}
eval _ state = continue state

overrides "MainLayout" push state = [onBackPressed push $ const BackPressed]
overrides _ push state = []   