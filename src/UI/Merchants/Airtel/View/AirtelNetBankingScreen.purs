module UI.Merchants.Airtel.View.AirtelNetBankingScreen where

import Effect  (Effect)
import Prelude
import PrestoDOM (Length(..), Margin(..), Namespace(..), Orientation(..), Padding(..), PrestoDOM, Screen, Typeface(..), background, color, height, linearLayout, linearLayout_, margin, orientation, padding, scrollView, text, textSize, textView, typeface, weight, width)
import UI.Merchants.Airtel.Controller.AirtelNetBankingScreen (Action(..), ScreenInput, ScreenOutput, State, eval, initialState)
import UI.Merchants.Airtel.Config as AirtelConfig
import UI.Components.View.ToolBar as ToolBar
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.BankListItem as BankListItem
import UI.Components.View.PrimaryButton as PrimaryButton
import UI.Components.View.SearchBox as SearchBox

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "AirtelNB")
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#ffffff"
        , orientation VERTICAL
        ]
        [ ToolBar.view (push <<< ToolBarAction) (ToolBarConfig.Config finalConfig)
        , SearchBox.view (push <<< SearchBoxAction) AirtelConfig.searchBoxConfigAirtel
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
                [ BankListItem.view (push <<< BankListItemAction) AirtelConfig.airtelNetBankConfig state.bankListItemState {name = "AXIS Bank"} 
                , BankListItem.view (push <<< BankListItemAction) AirtelConfig.airtelNetBankConfig state.bankListItemState {name = "Allahabad Bank"} 
                , BankListItem.view (push <<< BankListItemAction) AirtelConfig.airtelNetBankConfig state.bankListItemState {name = "Andhra Bank"} 
                , BankListItem.view (push <<< BankListItemAction) AirtelConfig.airtelNetBankConfig state.bankListItemState {name = "Axis Cooperate"}
                , BankListItem.view (push <<< BankListItemAction) AirtelConfig.airtelNetBankConfig state.bankListItemState {name = "Bank Of India"} 
                , BankListItem.view (push <<< BankListItemAction) AirtelConfig.airtelNetBankConfig state.bankListItemState {name = "Bank of Baroda"}
                , BankListItem.view (push <<< BankListItemAction) AirtelConfig.airtelNetBankConfig state.bankListItemState {name = "Bank of Baroda - Cooperate NetBanking"}  
                , BankListItem.view (push <<< BankListItemAction) AirtelConfig.airtelNetBankConfig state.bankListItemState {name = "Bank of Baroda - Retail NetBanking"}  
                ]
            ]
        , PrimaryButton.view (push <<< PrimaryButtonAction) AirtelConfig.primarybuttonConfigAirtel    
        ]
    where
      ToolBarConfig.Config toolBarConfig = AirtelConfig.toolBarConfigAirtel
      finalConfig = toolBarConfig {text = "Select Bank"}       
