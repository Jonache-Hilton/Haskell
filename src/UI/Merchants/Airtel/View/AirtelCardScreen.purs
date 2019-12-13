module UI.Merchants.Airtel.View.AirtelCardScreen where

import Prelude

import Effect (Effect)
import PrestoDOM (Gravity(..), Length(..), Margin(..), Namespace(..), Orientation(..), Padding(..), PrestoDOM, Screen, Typeface(..), background, color, gravity, height, imageUrl, imageView, linearLayout, linearLayout_, margin, orientation, padding, scrollView, text, textSize, textView, typeface, weight, width)
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.AddCard as AddCard
import UI.Components.View.PrimaryButton as PrimaryButton
import UI.Components.View.ToolBar as ToolBar
import UI.Merchants.Airtel.Config as AirtelConfig
import UI.Merchants.Airtel.Controller.AirtelCardScreen (Action(..), ScreenInput, ScreenOutput, State, eval, initialState)

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "AirtelCard")
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#ffffff"
        , orientation VERTICAL
        ]
        [ ToolBar.view (push <<< ToolBarAction) (ToolBarConfig.Config finalConfig)
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
                [ textView
                    [ width MATCH_PARENT
                    , height $ V 60
                    , gravity CENTER
                    , text "DEBIT/CREDIT CARD"
                    , color "#000000"
                    , textSize 18
                    ]
                , AddCard.view (push <<< AddCardAction) AirtelConfig.airtelAddCardConfig
                , textView
                    [ width MATCH_PARENT
                    , height $ V 50
                    , margin (Margin 8 8 8 0)
                    , text "We'll save this card for faster transactions in future."
                    , textSize 18
                    ]
                , textView
                    [ width MATCH_PARENT
                    , height $ V 50
                    , margin (Margin 8 8 8 0)
                    , text "At any point of time, if you want to remove the card, please go to:"
                    , textSize 16
                    ]
                , linearLayout
                    [ width MATCH_PARENT
                    , height $ V 30
                    , orientation HORIZONTAL
                    , margin (Margin 8 8 8 0)
                    ]
                    [ imageView
                        [ width $ V 30
                        , height $ V 20
                        , imageUrl "addcard_airtel_settings_icon"
                        ]
                    , textView
                        [ width $ V 0
                        , height MATCH_PARENT
                        , weight 1.0
                        , text "settings"
                        , textSize 16
                        , typeface BOLD
                        , color "#000000"
                        , padding (Padding 2 0 0 0)
                        ]
                    ]
                ]
            ]
        , PrimaryButton.view (push <<< PrimaryButtonAction) AirtelConfig.primarybuttonConfigAirtel    
        ]
    where
      ToolBarConfig.Config toolBarConfig = AirtelConfig.toolBarConfigAirtel
      finalConfig = toolBarConfig {text = "Add New Card"}
                
