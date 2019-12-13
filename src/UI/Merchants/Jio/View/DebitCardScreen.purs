module UI.Merchants.Jio.View.DebitCardScreen where

import Effect  (Effect)
import Prelude
import PrestoDOM
import UI.Merchants.Jio.Controller.DebitCardScreen

import UI.Merchants.Jio.Config as JioConfig
import UI.Components.View.ToolBar as ToolBar
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.AmountView as AmountView
import UI.Components.Config.AmountView as AmountViewConfig
import UI.Components.View.AddCardV2 as AddCardV2
import UI.Components.View.PrimaryButton as PrimaryButton

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "DebitCardScreen")
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#ffffff"
        , orientation VERTICAL
        ]
        [ ToolBar.view (push <<< ToolBarAction) JioConfig.toolBarConfigJio
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
                [ AmountView.view (push <<< AmountViewAction) JioConfig.amountV2ConfigJio state.orderSummaryState
                , linearLayout
                    [ width MATCH_PARENT
                    , height MATCH_PARENT
                    , margin (Margin 20 20 20 0)
                    , orientation VERTICAL
                    ]
                    [ textView 
                        [ width MATCH_PARENT
                        , height $ V 30
                        , text "Pay by Debit Card"
                        , color "#2A3890"
                        ]
                    , AddCardV2.view (push <<< AddCardAction) JioConfig.addCardConfigJio 
                    , PrimaryButton.view (push <<< PayButtonAction) JioConfig.jioPayButton 
                    , textView
                        [ width MATCH_PARENT
                        , height $ V 50
                        , text "Cancel"
                        , color "#2A3890"
                        , gravity CENTER
                        , textSize 18
                        ]
                    ]
                ]
            ]
        ]
