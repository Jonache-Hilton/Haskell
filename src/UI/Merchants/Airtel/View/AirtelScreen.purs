module UI.Merchants.Airtel.View.AirtelScreen where

import Prelude

import Effect (Effect)
import PrestoDOM
import UI.Components.View.AmountView as AmountView
import UI.Components.View.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.View.ToolBar as ToolBar
import UI.Components.View.PopularBanks as PopularBanks
import UI.Merchants.Airtel.Config as AirtelConfig
import UI.Merchants.Airtel.Controller.AirtelScreen (Action(..), ScreenInput, ScreenOutput, State, eval, initialState)


screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "AirtelScreen")
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#EBEBEB"
        , orientation VERTICAL
        ]
        [ ToolBar.view (push <<< ToolBarAction) AirtelConfig.toolBarConfigAirtel
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
                [ linearLayout
                    [ height $ V 120
                    , width MATCH_PARENT
                    , orientation VERTICAL
                    , background "#ffffff"
                    , padding (Padding 16 16 16 0)
                    , translationY (-10.0)
                    , translationZ 20.0
                    ]
                    [ textView
                        [ height $ V 24
                        , width MATCH_PARENT
                        , text "Postpaid Bill Payment for"
                        , color "#777777"
                        , textSize 18
                        , typeface BOLD
                        ]
                    ,  textView
                        [ height $ V 24
                        , width MATCH_PARENT
                        , text "9916190154"
                        , color "#777777"
                        , textSize 18
                        , typeface BOLD
                        ]
                        , AmountView.view (push <<< AmountViewAction) AirtelConfig.amountConfigAirtel state.orderSummaryState
                    ]
                , linearLayout
                    [ height MATCH_PARENT
                    , width MATCH_PARENT
                    , orientation VERTICAL
                    , margin (Margin 16 0 16 0)
                    ]
                    [ textView
                        [ width MATCH_PARENT
                        , height $ V 18
                        , text "MY CARDS"
                        , margin (Margin 0 10 0 10)
                        , typeface BOLD
                        , textSize 16
                        ]
                    , PaymentOptionsV2.view (push <<< PaymentOptionsV2Action) AirtelConfig.addCardConfig
                    , textView
                        [ width MATCH_PARENT
                        , height $ V 18
                        , text "OTHER CARDS"
                        , typeface BOLD
                        , textSize 16
                        , margin (Margin 0 10 0 10)
                        ]
                    , PaymentOptionsV2.view (push <<< PaymentOptionsV2Action) AirtelConfig.airtelMoneyConfig
                    , PaymentOptionsV2.view (push <<< PaymentOptionsV2Action) AirtelConfig.phonepeConfig
                    , PaymentOptionsV2.view (push <<< PaymentOptionsV2Action) AirtelConfig.paytmConfig
                    ]
                ,   linearLayout
                    [ height MATCH_PARENT
                    , width MATCH_PARENT
                    , orientation VERTICAL
                    , margin (Margin 16 0 16 0)
                    ]
                    [ textView
                        [ width MATCH_PARENT
                        , height $ V 18
                        , text "NETBANKING"
                        , margin (Margin 0 10 0 10)
                        , typeface BOLD
                        , textSize 16
                        , onClick push (const AirtelAction)
                        ]
                    , PopularBanks.view (push <<< PopularBanksAction) AirtelConfig.popularBanksConfigAirtel

                    ]    
                ]
            ]
        ]
