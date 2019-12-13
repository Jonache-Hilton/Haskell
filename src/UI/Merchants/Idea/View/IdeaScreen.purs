module UI.Merchants.Idea.View.IdeaScreen where

import Prelude
import PrestoDOM
import UI.Merchants.Idea.Controller.IdeaScreen

import Effect (Effect)
import UI.Components.View.AddCard as AddCard
import UI.Components.View.AmountView as AmountView
import UI.Components.View.PaymentOptions as PaymentOptions
import UI.Components.View.PopularBanks as PopularBanks
import UI.Components.View.PrimaryButton as PrimaryButton
import UI.Components.View.ToolBar as ToolBar
import UI.Merchants.Idea.Config as IdeaConfig

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "IdeaScreen")
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#efefef"
        , orientation VERTICAL
        ]
        [ ToolBar.view (push <<< ToolBarAction) IdeaConfig.toolBarIdea
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
                [ AmountView.view (push <<< AmountViewAction) IdeaConfig.amountView state.amountViewState
                , linearLayout
                    [ height $ V 1
                    , width MATCH_PARENT
                    , background "#ffffff"
                    , padding $ Padding 10 0 10 0
                    , margin $ Margin 10 0 10 0
                    ]
                    [ linearLayout
                        [ height MATCH_PARENT
                        , width MATCH_PARENT
                        , background "#a1a1a1"
                        ]
                        []
                    ]
                , textView
                    [ height $ V 60
                    , width MATCH_PARENT
                    , text "Unlimited Calls(Local/STD/Roaming) + 1.4 GB/Day 2G/3G/4G Internet + 100 SMS/Day \n Validity-70 Days"
                    , textSize 14
                    , background "#ffffff"
                    , padding (Padding 10 5 10 10)
                    , margin (Margin 10 0 10 0)
                    ]
                , textView
                    [ height $ V 50
                    -- , background "#ffffff"
                    , width MATCH_PARENT
                    , text "DEBIT CARDS/CREDIT CARDS/NET BANKING"
                    , textSize 16
                    , typeface BOLD
                    , padding (Padding 10 15 10 10)
                    , margin (Margin 10 10 10 10)
                    ]
                , linearLayout 
                    [ width MATCH_PARENT
                    , height MATCH_PARENT
                    , orientation VERTICAL
                    ]
                    [ PaymentOptions.view (push <<< PaymentOptionsAction) IdeaConfig.ideaDebitPO
                    ]
                , textView
                    [ height $ V 50
                    -- , background "#ffffff"
                    , width MATCH_PARENT
                    , text "WALLET"
                    , typeface BOLD
                    -- , background "#FFFFFF"
                    , textSize 16
                    , padding (Padding 10 15 10 10)
                    , margin (Margin 10 10 10 10)
                    , gravity LEFT
                    ]
                , linearLayout 
                    [ width MATCH_PARENT
                    , height MATCH_PARENT
                    , orientation VERTICAL
                    ]
                    [ PaymentOptions.view (push <<< PaymentOptionsAction) IdeaConfig.ideaPaytmPO
                    , PaymentOptions.view (push <<< PaymentOptionsAction) IdeaConfig.ideaMobiWalletPO
                    ]
                ]
            ]
        ]