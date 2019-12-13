module UI.Merchants.Grofers.View.SelectUPIScreen where

import Effect  (Effect)
import Prelude
import PrestoDOM
import Data.Array
import UI.Types
import UI.Merchants.Grofers.Controller.SelectUPIScreen
import UI.Merchants.Grofers.Config as GrofersConfig
import UI.Components.View.PaymentOptions as PaymentOptions

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "SelectUPIScreen")
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#ffffff"
        , orientation VERTICAL
        ]
        [ textView
            [ height $ V 20
            , width MATCH_PARENT
            , text "Choose an UPI App"
            , typeface BOLD
            , color "#000000"
            , textSize 18
            , margin $ Margin 20 20 10 10
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
                ]
                [ PaymentOptions.view (push <<< PaymentOptionsAction) GrofersConfig.googlePlayPO
                , PaymentOptions.view (push <<< PaymentOptionsAction) GrofersConfig.googleBHIMPO
                , PaymentOptions.view (push <<< PaymentOptionsAction) GrofersConfig.googlePhonePePO
                ]
            ]
        ]