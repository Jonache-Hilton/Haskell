module UI.Merchants.Goibibo.View.CreditCardScreen where

import Effect  (Effect)
import Prelude
import PrestoDOM
import UI.Merchants.Goibibo.Controller.CreditCardScreen
import UI.Merchants.Goibibo.Config as GoibiboConfig
import UI.Components.View.ToolBar as ToolBar
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.AmountView as AmountView
import UI.Components.Config.AmountView as AmountViewConfig
import UI.Components.Config.AddCard as AddCardConfig
import UI.Components.View.AddCard as AddCard
import UI.Components.View.PrimaryButton as PrimaryButton


screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
  linearLayout_  (Namespace "CreditCardScreen")
    [ height MATCH_PARENT
    , width MATCH_PARENT
    , background "#efefef"
    , orientation VERTICAL
    ]
    [ ToolBar.view (push <<< ToolBarAction) (ToolBarConfig.Config finalConfig)
    , AmountView.view (push <<< AmountViewAction) GoibiboConfig.amountConfigGoibibo2 state.orderSummaryState
    , scrollView 
        [ height $ V 0
        , weight 1.0
        , width MATCH_PARENT
        , margin (MarginTop 8)
        ]
        [ linearLayout
            [ height MATCH_PARENT
            , width MATCH_PARENT
            , padding (Padding 16 16 16 16)
            , orientation VERTICAL
            , background "#ffffff"  
            ] 
            [ textView
                [ width MATCH_PARENT
                , height $ V 30
                , text "Credit Card"
                , color "#4c7fc0"
                , textSize 18
                ]  
            , AddCard.view (push <<< AddCardAction) GoibiboConfig.goibiboAddCard
            , textView
                [ width MATCH_PARENT
                , height $ V 30
                , text "This card will be saved for faster checkout."
                , color "#000000"
                , gravity CENTER
                , margin (MarginTop 50)
                ]   
            ]
        ]
    , PrimaryButton.view (push <<< PayButtonAction) GoibiboConfig.goibiboPayButton
    ]
    where
      ToolBarConfig.Config toolBarConfig = GoibiboConfig.toolBarConfigGoibibo
      finalConfig = toolBarConfig {text = "Credit Card"}

