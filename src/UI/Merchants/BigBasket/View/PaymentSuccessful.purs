module UI.Merchants.BigBasket.View.PaymentSuccessful where


import Prelude
import PrestoDOM
import UI.Merchants.BigBasket.Controller.PaymentSuccessful

import Effect (Effect)
import Utils
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.Offers as Offers
import UI.Components.View.PaymentOptions as PaymentOptions
import UI.Components.View.ToolBar as ToolBar
import UI.Merchants.BigBasket.Config as BigBasketConfig


screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
 let _ = log "INSIDE PAYMENT SUCCESSFUL"
 in 
   linearLayout_  (Namespace "BigBasketScreenPaymentSuccessfulScreen")
        ([ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#efefef"
        , orientation VERTICAL
        , gravity CENTER 
        ]<> overrides "MainLayout" push state)
        [ ToolBar.view (push <<< ToolBarAction) (ToolBarConfig.Config toolbarConfig)
        , imageView
            [ width $ V 240
            , height $ V 240 
            , imageUrl state.paymentStatusIcon 
            , margin (Margin 0 52 0 48)
            ]
        , textView 
            [ width MATCH_PARENT
            , height $ V 40 
            , fontStyle "AvenirNext-Medium"
            , text state.paymentStatus 
            , color "#333333"
            , gravity CENTER 
            , typeface BOLD
            , textSize 25
            ]
        , linearLayout 
            [ width MATCH_PARENT
            , height $ V 0
            , weight 1.0
            ][]
        , linearLayout 
            [ width MATCH_PARENT
            , height $ V 24 
            , orientation HORIZONTAL 
            , gravity CENTER
            , margin (Margin 0 0 0 42)
            ]
            [ textView 
                [ width $
                    case (getOS unit) of 
                        "ANDROID" -> WRAP_CONTENT
                        _ -> V (getLabelWidth "You can view your order " "AvenirNext-Medium" 18 0 0)
                , height $ V 24 
                , text "You can view your order "
                , fontStyle "AvenirNext-Medium"
                , textSize 18
                ]
            , textView
                [ width $ V 50-- $ V (getLabelWidth "here" "AvenirNext-Medium" 13 0 24)
                , height $ V 24
                , text "here"
                , textSize 18
                , fontStyle "AvenirNext-Medium"
                , color "#689F39"
                ]
            ]
        ]
    where
        ToolBarConfig.Config toolBarConfigBigBasket = BigBasketConfig.toolBarConfigBigBasket
        toolbarConfig = toolBarConfigBigBasket {secondaryText = "₹ " <> state.amount}
