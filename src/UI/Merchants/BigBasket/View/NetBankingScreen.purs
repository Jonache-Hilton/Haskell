module UI.Merchants.BigBasket.View.NetBankingScreen where

import Data.Array
import Prelude
import PrestoDOM
import UI.Components.Controller.PaymentOptions
import UI.Merchants.BigBasket.Controller.NetBankingScreen
import UI.Types

import Effect (Effect)
import UI.Components.Config.BankCard as BankCardConfig
import UI.Components.Config.PopularBanks as PopularBanksConfig
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.Config.PrimaryButton as PrimaryButtonConfig
import UI.Components.View.AmountView as AmountView
import UI.Components.View.BankCard as BankCard
import UI.Components.View.BankListItem as BankListItem
import UI.Components.View.PopularBanks as PopularBanks
import UI.Components.View.PopularBanksV2 as PopularBanksV2
import UI.Components.View.PrimaryButton as PrimaryButton
import UI.Components.View.SearchBox as SearchBox
import UI.Components.View.ToolBar as ToolBar
import UI.Merchants.BigBasket.Config as BigBasketConfig


screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view push state = 
  linearLayout_  (Namespace "NetBankingScreen")
    ([ height MATCH_PARENT
    , width MATCH_PARENT
    , background "#efefef"
    , orientation VERTICAL
    ] <> overrides "MainLayout" push state)
    [ ToolBar.view (push <<< ToolBarAction) (ToolBarConfig.Config finalConfig)
    -- , scrollView
    --   [ width MATCH_PARENT
    --   , height MATCH_PARENT
    --   ]
    --   [ 
    , linearLayout 
        [ width MATCH_PARENT
        , height MATCH_PARENT
        , orientation VERTICAL
        , background "#eceff1"
        , margin (Margin 0 0 0 0)
        , padding (Padding 0 0 0 0)
        ]
        [ textView
          [ height $ V 30 
          , width MATCH_PARENT
          , text "FREQUENTLY USED BANKS"
          , textSize 16
          , typeface BOLD
          , margin ( Margin 10 20 10 0 )
          , padding ( Padding 0 0 0 0)
          ]
          , horizontalScrollView
            [ width MATCH_PARENT
            , height $ V 120
            , background "#ffffff"
            ]
            [ linearLayout
              [ height MATCH_PARENT
              , width MATCH_PARENT
              , orientation HORIZONTAL
              , padding ( Padding 30 10 10 10)
              , background "#ffffff"
              ]
              [ BankCard.view (push <<< BankCardAction)  (BankCardConfig.Config bank1)
              , BankCard.view (push <<< BankCardAction)  (BankCardConfig.Config bank2)
              ]
            ]
          , textView
            [ height $ V 30 
            , width MATCH_PARENT
            , text "MORE BANKS"
            , textSize 16
            , typeface BOLD
            , margin ( Margin 10 20 10 0 )
            , padding ( Padding 0 0 0 0)
            ]
          , linearLayout 
              [ width MATCH_PARENT
              , height MATCH_PARENT
              , orientation VERTICAL
              , margin (Margin 0 0 0 0)
              , padding (Padding 0 0 0 0)
              ]
              [ SearchBox.view (push <<< SearchBoxAction) BigBasketConfig.bigBasketSearchBox
              , linearLayout
                [ height $ V 1
                , width MATCH_PARENT
                , background "#ffffff"
                , padding $ Padding 10 0 0 0
                , margin $ Margin 0 0 0 0
                ]
                [ linearLayout
                    [ height MATCH_PARENT
                    , width MATCH_PARENT
                    , background "#eceff1"
                    ][]
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
                    ] --listView 
                    (mapWithIndex (\i (NetBank bank) -> BankListItem.view (push <<< (BankListItemAction i)) BigBasketConfig.bankListItemConfig 
                      { active : i == state.selectedBank
                      , name : bank.name
                      , logo : "ic_bank_" <> bank.iin
                      , index : i
                      }) state.banks)
                ]
                , linearLayout
                  [ width MATCH_PARENT
                  , height $ V 90
                  , background "#ffffff"
                  , translationY 5.0
                  , translationZ 30.0
                  , padding (Padding 20 15 15 10)
                  ] [
                      PrimaryButton.view (push <<< PrimaryButtonAction) newPayNowConfig
                  ]
              ]
      ]
    ]
    where
      ToolBarConfig.Config toolBarConfig = BigBasketConfig.toolBarConfigBigBasket
      finalConfig = toolBarConfig {text = "Payment"}

      BankCardConfig.Config bankCardConfig = BigBasketConfig.bigBasketBankCard
      bank1 = bankCardConfig {text = "Axis", imageUrl = "bank_axis"}

      BankCardConfig.Config bankCardConfig = BigBasketConfig.bigBasketBankCard
      bank2 = bankCardConfig {text = "Kotak", imageUrl = "bank_kotak"}

      PrimaryButtonConfig.Config payNowConfig = BigBasketConfig.bbPrimaryPayButtonConfig
      newPayNowConfig = PrimaryButtonConfig.Config payNowConfig {background = if state.selectedBank == -1 then "#b0bec5" else "#F57C20"}
