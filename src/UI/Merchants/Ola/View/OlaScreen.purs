module UI.Merchants.Ola.View.OlaScreen where

import Effect  (Effect)
import Prelude
import PrestoDOM
import UI.Merchants.Ola.Controller.OlaScreen
import UI.Merchants.Ola.Config as OlaConfig
import UI.Components.View.ToolBar as ToolBar
import UI.Components.View.AmountView as AmountView
import UI.Components.View.AddCard as AddCard
import UI.Components.View.PopularBanks as PopularBanks
import UI.Components.View.SecondaryButton as SecondaryButton

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "TestingScreen")
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#efefef"
        , orientation VERTICAL
        ]
        [ ToolBar.view (push <<< ToolBarAction) OlaConfig.toolBarOla
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
                [ AmountView.view (push <<< AmountViewAction) OlaConfig.amountView state.amountViewState
                , textView
                    [ height $ V 20
                    , width MATCH_PARENT
                    , text "DEBIT/CREDIT CARDS"
                    , textSize 18
                    , typeface BOLD
                    , margin (Margin 10 10 10 10)
                    ]
                , AddCard.view (push <<< AddCardAction) OlaConfig.addCardConfig
                , textView
                    [ height $ V 20
                    , width MATCH_PARENT
                    , text "NET BANKING"
                    , textSize 18
                    , typeface BOLD
                    , margin (Margin 10 10 10 10)
                    ]
                , textView
                    [ height $ V 30
                    , width MATCH_PARENT
                    , text "Popular Banks"
                    , typeface BOLD
                    , background "#FFFFFF"
                    , textSize 16
                    , gravity CENTER
                    ]
                , PopularBanks.view (push <<< PopularBanksAction) OlaConfig.olaPopularBanksConfig
                , SecondaryButton.view (push <<< SecondaryButtonAction) OlaConfig.payButtonConfig
                ]
            ]
        ]