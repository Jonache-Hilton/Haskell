module UI.View.Screens.MainScreen where

import Effect  (Effect)
import Prelude
import PrestoDOM
import UI.Controller.Screens.MainScreen
import UI.Components.View.BankListItem as BankListItem
import Utils


screen ::  ScreenInput  -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w  . (Action  -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "MainScreen")
        [ height MATCH_PARENT
        , padding (Padding 20 20 20 20)
        , width MATCH_PARENT
        , background "#272727"
        , orientation $ VERTICAL
        ]
        [ scrollView 
            [ height MATCH_PARENT
            , width MATCH_PARENT
            ]   
            case os of
                "ANDROID" -> 
                    [ linearLayout
                        [ height MATCH_PARENT
                        , width MATCH_PARENT
                        , orientation VERTICAL
                        ] (body push state)
                    ]
                _ -> (body push state)


        ]


body push state  = 
    [ textView
        [ width MATCH_PARENT
        , height $ V 40
        , text "Payment Pages"
        , color "#ffffff"
        , textSize 24
        , gravity CENTER
        ]
    , linearLayout
        [ width MATCH_PARENT
        , height $ V 60
        , stroke "1,#ffffff"
        , margin (MarginTop 20)
        , gravity CENTER
        ]
        [ textView
            ([ width MATCH_PARENT
            , height $ if os == "ANDROID" then WRAP_CONTENT else V $ (getLabelHeight "Dream11" "Roboto-Regular" 20 (screenWidth unit) 0)
            , padding (Padding 20 10 20 10)
            , text "Dream11"
            , textSize 20
            , color "#ffffff"
            , gravity CENTER
            , fontStyle "Roboto-Regular"
            ] <> overrides "Dream11" push state)
        ]
    , linearLayout
        [ width MATCH_PARENT
        , height $ V 60
        , stroke "1,#ffffff"
        , margin (MarginTop 20)
        , gravity CENTER
        ]
        [ textView
            ([ width MATCH_PARENT
            , height $ if os == "ANDROID" then WRAP_CONTENT else V (getLabelHeight "Airtel" "Roboto-Regular" 20 (screenWidth unit) 0)
            , padding (Padding 20 10 20 10)
            , text "Airtel"
            , textSize 20
            , color "#ffffff"
            , gravity CENTER
            , fontStyle "Roboto-Regular"
            ] <> overrides "Airtel" push state)
        ]
    , linearLayout
        [ width MATCH_PARENT
        , height $ V 60
        , stroke "1,#ffffff"
        , margin (MarginTop 20)
        , gravity CENTER
        ]
        [ textView
            ([ width MATCH_PARENT
            , height $ if os == "ANDROID" then WRAP_CONTENT else V (getLabelHeight "RedBus" "Roboto-Regular" 20 (screenWidth unit) 0)
            , padding (Padding 20 10 20 10)
            , text "RedBus"
            , textSize 20
            , color "#ffffff"
            , gravity CENTER
            , fontStyle "Roboto-Regular"
            ] <> overrides "RedBus" push state)
        ]
    , linearLayout
        [ width MATCH_PARENT
        , height $ V 60
        , stroke "1,#ffffff"
        , margin (MarginTop 20)
        , gravity CENTER
        ]
        [ textView
            ([ width MATCH_PARENT
            , height $ if os == "ANDROID" then WRAP_CONTENT else V (getLabelHeight "Goibibo" "Roboto-Regular" 20 (screenWidth unit) 0)
            , padding (Padding 20 10 20 10)
            , text "Goibibo"
            , textSize 20
            , color "#ffffff"
            , gravity CENTER
            , fontStyle "Roboto-Regular"
            ] <> overrides "Goibibo" push state)
        ]
    , linearLayout
        [ width MATCH_PARENT
        , height $ V 60
        , stroke "1,#ffffff"
        , margin (MarginTop 20)
        , gravity CENTER
        ]
        [ textView
            ([ width MATCH_PARENT
            , height $ if os == "ANDROID" then WRAP_CONTENT else V (getLabelHeight "Spice Jet" "Roboto-Regular" 20 (screenWidth unit) 0)
            , padding (Padding 20 10 20 10)
            , text "Spice Jet"
            , textSize 20
            , color "#ffffff"
            , gravity CENTER
            , fontStyle "Roboto-Regular"
            ] <> overrides "SpiceJet" push state)
        ]
    , linearLayout
        [ width MATCH_PARENT
        , height $ V 60
        , stroke "1,#ffffff"
        , margin (MarginTop 20)
        , gravity CENTER
        ]
        [ textView
            ([ width MATCH_PARENT
            , height $ if os == "ANDROID" then WRAP_CONTENT else V (getLabelHeight "Jio" "Roboto-Regular" 20 (screenWidth unit) 0)
            , padding (Padding 20 10 20 10)
            , text "Jio"
            , textSize 20
            , color "#ffffff"
            , gravity CENTER
            , fontStyle "Roboto-Regular"
            ] <> overrides "Jio" push state)
        ]
    , linearLayout
        [ width MATCH_PARENT
        , height $ V 60
        , stroke "1,#ffffff"
        , margin (MarginTop 20)
        , gravity CENTER
        ]
        [ textView
            ([ width MATCH_PARENT
            , height $ if os == "ANDROID" then WRAP_CONTENT else V (getLabelHeight "Big Basket" "Roboto-Regular" 20 (screenWidth unit) 0)
            , padding (Padding 20 10 20 10)
            , text "Big Basket"
            , textSize 20
            , color "#ffffff"
            , gravity CENTER
            , fontStyle "Roboto-Regular"
            ] <> overrides "BigBasket" push state)
        ]
    , linearLayout
        [ width MATCH_PARENT
        , height $ V 60
        , stroke "1,#ffffff"
        , margin (MarginTop 20)
        , gravity CENTER
        ]
        [ textView
            ([ width MATCH_PARENT
            , height $ if os == "ANDROID" then WRAP_CONTENT else V (getLabelHeight "Vodafone" "Roboto-Regular" 20 (screenWidth unit) 0)
            , padding (Padding 20 10 20 10)
            , text "Vodafone"
            , textSize 20
            , color "#ffffff"
            , gravity CENTER
            , fontStyle "Roboto-Regular"
            ] <> overrides "Vodafone" push state)
        ]
    , linearLayout
        [ width MATCH_PARENT
        , height $ V 60
        , stroke "1,#ffffff"
        , margin (MarginTop 20)
        , gravity CENTER
        ]
        [ textView
            ([ width MATCH_PARENT
            , height $ if os == "ANDROID" then WRAP_CONTENT else V (getLabelHeight "Grofers" "Roboto-Regular" 20 (screenWidth unit) 0)
            , padding (Padding 20 10 20 10)
            , text "Grofers"
            , textSize 20
            , color "#ffffff"
            , gravity CENTER
            , fontStyle "Roboto-Regular"
            ] <> overrides "Grofers" push state)
        ]
    , linearLayout
        [ width MATCH_PARENT
        , height $ V 60
        , stroke "1,#ffffff"
        , margin (MarginTop 20)
        , gravity CENTER
        ]
        [ textView
            ([ width MATCH_PARENT
            , height $ if os == "ANDROID" then WRAP_CONTENT else V (getLabelHeight "Ola" "Roboto-Regular" 20 (screenWidth unit) 0)
            , padding (Padding 20 10 20 10)
            , text "Ola"
            , textSize 20
            , color "#ffffff"
            , gravity CENTER
            , fontStyle "Roboto-Regular"
            ] <> overrides "Ola" push state)
        ]
    , linearLayout
        [ width MATCH_PARENT
        , height $ V 60
        , stroke "1,#ffffff"
        , margin (MarginTop 20)
        , gravity CENTER
        ]
        [ textView
            ([ width MATCH_PARENT
            , height $ if os == "ANDROID" then WRAP_CONTENT else V (getLabelHeight "Testing" "Roboto-Regular" 20 (screenWidth unit) 0)
            , padding (Padding 20 10 20 10)
            , text "Testing"
            , textSize 20
            , color "#ffffff"
            , gravity CENTER
            , fontStyle "Roboto-Regular"
            ] <> overrides "Testing" push state)
        ]
    ]