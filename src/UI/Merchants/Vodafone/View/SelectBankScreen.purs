module UI.Merchants.Vodafone.View.SelectBankScreen where

import Data.Array
import Prelude
import PrestoDOM
import UI.Merchants.Vodafone.Controller.SelectBankScreen
import UI.Types

import Effect (Effect)
import UI.Components.Config.PrimaryButton as PrimaryButtonConfig
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.AddCard as AddCard
import UI.Components.View.BankListItem as BankListItem
import UI.Components.View.PrimaryButton as PrimaryButton
import UI.Components.View.SearchBox as SearchBox
import UI.Components.View.ToolBar as ToolBar
import UI.Components.View.ToolbarV2 as ToolbarV2
import UI.Components.View.SearchBox as SearchBox
import UI.Merchants.Vodafone.Config as VodafoneConfig


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
        [ ToolbarV2.view (push <<< ToolbarV2Action) (ToolBarConfig.Config toolConfig)
        , linearLayout
            [ width MATCH_PARENT
            , height $ V 100
            , orientation VERTICAL
            , padding (Padding 10 10 10 10)
            ] [
                textView
                    [ width MATCH_PARENT
                    , text "Choose other banks"
                    , typeface BOLD
                    , color "#000000"
                    , textSize 16
                    ],
                SearchBox.view (push <<< SearchBoxAction) VodafoneConfig.vodaSearchBoxConfig
            ]
        , linearLayout
            [ width MATCH_PARENT
            , height $ V 1
            , background "#9e9e9e"
            , margin (Margin 0 2 0 2)
            ][]
        , scrollView
            [ width MATCH_PARENT
            , height $ V 0
            , weight 1.0
            ] 
            [ linearLayout
                [ height MATCH_PARENT
                , width MATCH_PARENT
                , orientation VERTICAL
                ]
                (mapWithIndex (\i (NetBank bank) -> BankListItem.view (push <<< (BankListItemAction i)) VodafoneConfig.bankListItemConfig 
                    { active : i == state.selectedBank
                    , name : bank.name
                    , logo : "ic_bank_" <> bank.iin
                    , index : i
                    }) state.banks)
            ]
        , linearLayout
            [ width MATCH_PARENT
            , height $ V 90
            , background "#000000"
            , padding (Padding 20 15 15 10)
            ] [
                PrimaryButton.view (push <<< PrimaryButtonAction) (PrimaryButtonConfig.Config payConfig)
            ]
        ]
        where
            ToolBarConfig.Config toolBarConfig = VodafoneConfig.toolBarConfigVodafone
            toolConfig = toolBarConfig {text = "Internet Banking", textVisibility = GONE, height = V 140}

            PrimaryButtonConfig.Config primaryPayButtonConfig = VodafoneConfig.primaryPayButtonConfigVodafone
            payConfig = primaryPayButtonConfig {text = "Pay Now", color = "#424242", background = "#616161"}