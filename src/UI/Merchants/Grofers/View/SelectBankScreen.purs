module UI.Merchants.Grofers.View.SelectBankScreen where

import Effect  (Effect)
import Prelude
import PrestoDOM
import Data.Array
import UI.Types
import UI.Merchants.Grofers.Controller.SelectBankScreen
import UI.Merchants.Grofers.Config as GrofersConfig
import UI.Components.View.ToolBar as ToolBar
import UI.Components.View.AddCard as AddCard
import UI.Components.View.BankListItem as BankListItem
import UI.Components.View.SearchBox as SearchBox
import UI.Components.Config.ToolBar as ToolBarConfig

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "SelectBankScreen")
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#ffffff"
        , orientation VERTICAL
        ]
        [ ToolBar.view (push <<< ToolBarAction) (ToolBarConfig.Config newToolbarConfig)
        , linearLayout
            [ height $ V 52
            , width MATCH_PARENT
            , background "#1C2224"
            , padding (Padding 10 0 10 10)
            , gravity CENTER
            ]
            [ SearchBox.view (push <<< SearchBoxAction) (GrofersConfig.searchBoxConfig)
            ]
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
                (mapWithIndex (\i (NetBank bank) -> BankListItem.view (push <<< (BankListItemAction i)) GrofersConfig.bankListItemConfig 
                    { active : i == state.selectedBank
                    , name : bank.name
                    , logo : "ic_bank_" <> bank.iin
                    , index : i
                    }) state.banks)
            ]
        ]
    where
        ToolBarConfig.Config toolbarConfig = GrofersConfig.toolBarConfigGrofers
        newToolbarConfig = toolbarConfig {text = "Net Banking"}
