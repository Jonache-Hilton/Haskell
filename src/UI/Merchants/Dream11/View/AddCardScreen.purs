module UI.Merchants.Dream11.View.AddCardScreen where

import Prelude
import PrestoDOM
import UI.Merchants.Dream11.Controller.AddCardScreen

import Effect (Effect)
import UI.Components.Controller.PaymentOptions
import UI.Merchants.Dream11.Config as Dream11Config
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.ToolBar as ToolBar
import UI.Components.Config.AddCard as AddCardConfig
import UI.Components.View.AddCard as AddCard
import UI.Components.Config.PrimaryButton as PrimaryButtonConfig
import UI.Components.View.PrimaryButton as PrimaryButton

screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view push state =
  linearLayout_  (Namespace "AddCardScreen")
    [ height MATCH_PARENT
    , width MATCH_PARENT
    , background "#efefef"
    , orientation VERTICAL
    ]
    [ ToolBar.view (push <<< ToolBarAction) (ToolBarConfig.Config finalConfig)
    , linearLayout 
        [ width MATCH_PARENT
        , height $ V 230
        ]
        [ AddCard.view (push <<< AddCardAction) Dream11Config.addCardConfigDream11
        ]
    , linearLayout
        [ height $ V 40
        , width MATCH_PARENT
        , orientation HORIZONTAL
        , margin (Margin 20 0 20 0)
        , gravity CENTER_VERTICAL
        ]
        [ imageView
            [ width $ V 20
            , height $ V 20
            , imageUrl "ic_orange_lock"
            ]
        , textView
            [ width $ V 0
            , height MATCH_PARENT
            , weight 1.0
            , text "Your CVV will not be saved"
            , margin (Margin 10 0 0 0)
            , gravity CENTER_VERTICAL
            , textSize 18
            , color "#555555"
            ]
        ]
    , linearLayout 
        [ width MATCH_PARENT
        , height $ V 60
        , margin (Margin 20 0 20 0)
        ]
        [ PrimaryButton.view (push <<< PrimaryButtonAction) Dream11Config.primaryPayButtonConfigDream11
        ]
    ]
    where
      ToolBarConfig.Config toolBarConfig = Dream11Config.toolBarConfigDream11
      finalConfig = toolBarConfig {text = "ENTER CARD DETAILS"}

      
