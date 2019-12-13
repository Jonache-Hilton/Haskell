module UI.Merchants.RedBus.View.RedBusScreen where

import Prelude
import PrestoDOM
import UI.Merchants.RedBus.Controller.RedBusScreen

import Effect (Effect)
import Types (MainScreenStateOutput(..))
import UI.Components.Config.AddCard as AddCardConfig
import UI.Components.Config.PaymentOptions as PaymentOptionsConfig
import UI.Components.Config.PopularBanks as PopularBanksConfig
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.AddCard as AddCard
import UI.Components.View.PaymentOptions as PaymentOptions
import UI.Components.View.PopularBanks as PopularBanks
import UI.Components.View.ToolBar as ToolBar
import UI.Components.View.PrimaryButton as PrimaryButton
import UI.Merchants.RedBus.Config as RedBusConfig

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
  linearLayout_  (Namespace "RedBusScreen")
    [ height MATCH_PARENT
    , width MATCH_PARENT
    , background "#efefef"
    , orientation VERTICAL
    ]
    [ ToolBar.view (push <<< ToolBarAction) RedBusConfig.toolBarConfigRedBus
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
                [ width MATCH_PARENT
                , height MATCH_PARENT
                , orientation HORIZONTAL
                , margin $ Margin 10 10 10 0
                ]
                [ orderSummary push state
                ]
            , textView
                [ width MATCH_PARENT
                , height $ V 20
                , text "PAYMENT OPTIONS"
                , typeface BOLD
                , textSize 18
                , margin (Margin 10 10 0 10)
                ]
            , linearLayout
                [ height MATCH_PARENT
                , width MATCH_PARENT
                , margin (Margin 10 0 10 10)
                , orientation VERTICAL
                , translationY (-10.0)
                ]
                [ PaymentOptions.view (push <<< PaymentOptionsAction) (PaymentOptionsConfig.Config $ toggleRadio RedBusConfig.redBusDebit state)
                , AddCard.view (push <<< AddCardAction) (toggleAccordion RedBusConfig.redBusAddCard RedBusConfig.redBusDebit state)

                , PaymentOptions.view (push <<< PaymentOptionsAction) (PaymentOptionsConfig.Config $ toggleRadio RedBusConfig.redBusTez state)

                , PaymentOptions.view (push <<< PaymentOptionsAction) (PaymentOptionsConfig.Config $ toggleRadio RedBusConfig.redBusBHIM state)
                , linearLayout 
                    [ width MATCH_PARENT
                    , height $ V 80
                    , orientation VERTICAL
                    , visibility if state.active == "3" then VISIBLE else GONE
                    , stroke "1,#aaaaaa"
                    , padding (Padding 16 16 8 16)
                    , color "#000000"
                    ]
                    [ textView
                        [ width MATCH_PARENT
                        , height $ V 0
                        , weight 1.0
                        , text "You will be taken to BHIM App for completing payment."
                        ]
                    ]

                , PaymentOptions.view (push <<< PaymentOptionsAction) (PaymentOptionsConfig.Config $ toggleRadio RedBusConfig.redBusDebit2 state)
                , AddCard.view (push <<< AddCardAction) (toggleAccordion RedBusConfig.redBusAddCard2 RedBusConfig.redBusDebit2 state)

                , PaymentOptions.view (push <<< PaymentOptionsAction) (PaymentOptionsConfig.Config $ toggleRadio RedBusConfig.redBusCredit state)
                , AddCard.view (push <<< AddCardAction) (toggleAccordion RedBusConfig.redBusAddCredit RedBusConfig.redBusCredit state)

                , PaymentOptions.view (push <<< PaymentOptionsAction) (PaymentOptionsConfig.Config $ toggleRadio RedBusConfig.redBusNetBank state)
                , linearLayout
                    [ width MATCH_PARENT
                    , height $ V 290
                    , visibility if state.active == "6" then VISIBLE else GONE
                    , padding (Padding 0 20 0 0)
                    , background "#ffffff"
                    , orientation VERTICAL
                    ] 
                    [ PopularBanks.view (push <<< PopularBanksAction) (toggleAccordion RedBusConfig.redBusPopularBanks RedBusConfig.redBusNetBank state)
                    , textView
                        [ width MATCH_PARENT
                        , height $ V 68
                        , gravity CENTER
                        , text "Other Banks"
                        , color "#C13D49"
                        , textSize 18
                        , onClick push (const OtherBanksAction)
                        ]
                    , linearLayout
                        [ width MATCH_PARENT
                        , height $ V 1
                        , background "#aaaaaa"
                        ] []
                    ]
                , PaymentOptions.view (push <<< PaymentOptionsAction) (PaymentOptionsConfig.Config $ toggleRadio RedBusConfig.redBusBookNow state)
                ]
            ]
        ]
    , PrimaryButton.view (push <<< PrimaryButtonAction) RedBusConfig.redBusPayButtonConfig
    ]

toggleRadio (PaymentOptionsConfig.Config config) state = let
    newConfig = if state.active == config.id then config {checkVisibility = VISIBLE}
        else config {checkVisibility = GONE}
    in newConfig

class Accordion config where
  toggleAccordion :: config -> PaymentOptionsConfig.Config -> State -> config

instance addCardAccordion :: Accordion AddCardConfig.Config where
  toggleAccordion (AddCardConfig.Config config) (PaymentOptionsConfig.Config idConfig) state =  let
    newConfig = config {isFormVisible = idConfig.id == state.active}
    in AddCardConfig.Config newConfig

instance popularBanksAccordion :: Accordion PopularBanksConfig.Config where
  toggleAccordion (PopularBanksConfig.Config config) (PaymentOptionsConfig.Config idConfig) state =  let
    newConfig = config {isFormVisible = idConfig.id == state.active}
    in PopularBanksConfig.Config newConfig


orderSummary push state = 
    linearLayout
        [ width MATCH_PARENT
        , height if state.isExpanded then V 570 else V 190
        , background "#ffffff"
        , orientation VERTICAL
        , onClick push (const ExpandOrder)
        , translationY (-10.0)
        , translationZ 10.0
        , cornerRadius 6.0
        ]
        [ linearLayout
            [ width MATCH_PARENT 
            , height MATCH_PARENT
            , padding (Padding 8 16 8 16)
            , orientation VERTICAL
            , visibility if state.isExpanded then GONE else VISIBLE
            ] 
            [ linearLayout
                [ width MATCH_PARENT
                , height $ V 0
                , background "#ffffff"
                , orientation VERTICAL 
                , weight 1.0
                ]
                [ linearLayout
                    [ width MATCH_PARENT
                    , height $ V 28
                    , orientation HORIZONTAL 
                    ]
                    [ textView
                        [ width $ V 0
                        , height MATCH_PARENT
                        , text "07 Mar at 21:45"
                        , typeface BOLD 
                        , weight 1.0
                        , color "#000000"
                        ]
                    , textView
                        [ width $ V 0
                        , weight 1.0
                        , height MATCH_PARENT
                        , text "₹ 1,225.50"
                        , typeface BOLD 
                        , color "#000000" 
                        , gravity RIGHT      
                        ]
                    ]
                , textView
                    [ width MATCH_PARENT
                    , height $ V 28
                    , text "GreenLine Travels And Holidays"
                    , color "#6d6e70"
                    ]
                , textView
                    [ width MATCH_PARENT
                    , height $ V 28
                    , text "Boarding Point (21:45): Jayanagar 4th Block"
                    , color "#6d6e70"
                    , textSize 16
                    ]
                , textView
                    [ width MATCH_PARENT
                    , height $ V 28
                    , text "Dropping Point(07:30): Gachi Bowli"
                    , color "#6d6e70"
                    ]
                , textView
                    [ width MATCH_PARENT
                    , height $ V 28
                    , text "Duration: 7:45 hrs"
                    , color "#6d6e70"
                    ]
                ]
            , linearLayout
                [ width MATCH_PARENT
                , height $ V 24
                , orientation VERTICAL
                , gravity CENTER 
                ]
                [ imageView 
                    [ height MATCH_PARENT
                    , width $ V 24
                    , imageUrl "juspay_arrow_up"
                    , rotation 180.0
                    ]
                ]
            ]
        , linearLayout
            [ width MATCH_PARENT
            , height MATCH_PARENT
            , orientation VERTICAL 
            , padding (Padding 16 16 16 16)
            , visibility if state.isExpanded then VISIBLE else GONE
            ]
            [ linearLayout
                [width MATCH_PARENT
                , height $ V 0
                , orientation VERTICAL
                , weight 1.0
                ]
                [ textView
                    [ width MATCH_PARENT
                    , height $ V 32
                    , text "TRAVEL DETAILS"
                    , color "#6d6e70"
                    , typeface BOLD
                    , gravity CENTER
                    , textSize 16
                    , margin(MarginBottom 8)
                    ]
                , textView
                    [ width MATCH_PARENT
                    , height $ V 32
                    , text "Evacay Bus"
                    , color "#6d6e70"
                    , textSize 16
                    ]
                , textView
                    [ width MATCH_PARENT
                    , height $ V 32
                    , text "26 Jul at 23:30"
                    , color "#6d6e70"
                    , textSize 16
                    ]
                , textView
                    [ width MATCH_PARENT
                    , height $ V 32
                    , text "Mercedes Multi-Axle Semi-sleeper (2+2)"
                    , color "#6d6e70"
                    , textSize 16
                    ]
                , textView
                    [ width MATCH_PARENT
                    , height $ V 32
                    , text "BOARDING P0INT: Madiwala Police Station"
                    , color "#6d6e70"
                    , textSize 16
                    ]
                , textView
                    [ width MATCH_PARENT
                    , height $ V 32
                    , text "DROPPING POINT: Sriperumbudur Toll"
                    , color "#6d6e70"
                    , textSize 16
                    ]
                , textView
                    [ width MATCH_PARENT
                    , height $ V 32
                    , text "PASSENGER DETAILS"
                    , color "#6d6e70"
                    , gravity CENTER 
                    , typeface BOLD
                    , textSize 16
                    , margin (Margin 0 16 0 16)
                    ]
                , linearLayout
                    [ width MATCH_PARENT
                    , height $ V 32
                    , orientation HORIZONTAL
                    ]
                    [ textView
                        [ width $ V 0
                        , height MATCH_PARENT
                        , text "Manoj Radhakrishnan"
                        , color "#6d6e70"
                        , weight 1.0
                        , textSize 16
                        ]
                    , textView
                        [ width $ V 0
                        , weight 1.0
                        , gravity RIGHT
                        , height MATCH_PARENT
                        , text "3"
                        , color "#6d6e70"
                        , textSize 16
                        ]
                    ]
                , textView 
                    [ width MATCH_PARENT
                    , height $ V 32
                    , text "M, 27 years"
                    , color "#6d6e70"
                    , textSize 16
                    ]
                , textView 
                    [ width MATCH_PARENT
                    , height $ V 32
                    , text "FARE BREAKUP"
                    , color "#6d6e70"
                    , gravity CENTER
                    , typeface BOLD
                    , textSize 16
                    , margin (Margin 0 16 0 16)
                    ]
                , linearLayout
                    [ width MATCH_PARENT
                    , height $ V 32
                    , orientation HORIZONTAL
                    ]
                    [ textView
                        [ width $ V 0
                        , height MATCH_PARENT
                        , text "Base Fare"
                        , color "#6d6e70"
                        , weight 1.0
                        , textSize 16
                        ]
                    , textView
                        [ width $ V 0
                        , weight 1.0
                        , gravity RIGHT
                        , height MATCH_PARENT
                        , text "₹ 680.00"
                        , color "#6d6e70"
                        , textSize 16
                        ]
                    ]
                , linearLayout
                    [ width MATCH_PARENT
                    , height $ V 32
                    , orientation HORIZONTAL
                    ]
                    [ textView
                        [ width $ V 0
                        , height MATCH_PARENT
                        , text "Bus Operator GST"
                        , color "#6d6e70"
                        , weight 1.0
                        , textSize 16
                        ]
                    , textView
                        [ width $ V 0
                        , weight 1.0
                        , gravity RIGHT
                        , height MATCH_PARENT
                        , text "₹ 34.00"
                        , color "#6d6e70"
                        , textSize 16
                        ]
                    ]
                , linearLayout
                    [ width MATCH_PARENT
                    , height $ V 32
                    , orientation HORIZONTAL
                    ]
                    [ textView
                        [ width $ V 0
                        , height MATCH_PARENT
                        , text "Total Fare"
                        , color "#6d6e70"
                        , weight 1.0
                        , textSize 16
                        ]
                    , textView
                        [ width $ V 0
                        , weight 1.0
                        , gravity RIGHT
                        , height MATCH_PARENT
                        , text "₹ 714.00"
                        , color "#6d6e70"
                        , textSize 16
                        ]
                    ]
                , linearLayout
                    [ width MATCH_PARENT
                    , height $ V 32
                    , orientation HORIZONTAL
                    ]
                    [ textView
                        [ width $ V 0
                        , height MATCH_PARENT
                        , text "TOTAL PAYABLE"
                        , color "#000000"
                        , weight 1.0
                        , typeface BOLD
                        , textSize 16
                        ]
                    , textView
                        [ width $ V 0
                        , weight 1.0
                        , gravity RIGHT
                        , height MATCH_PARENT
                        , text "₹ 714.00"
                        , color "#000000"
                        , typeface BOLD
                        , textSize 16
                        ]
                    ]
                ]
            , linearLayout 
                [ width MATCH_PARENT
                , height $ V 20
                , gravity CENTER
                ]
                [ imageView
                    [ width $ V 24
                    , height MATCH_PARENT
                    , imageUrl "juspay_arrow_up"
                    ]
                ]
            ]
        ]