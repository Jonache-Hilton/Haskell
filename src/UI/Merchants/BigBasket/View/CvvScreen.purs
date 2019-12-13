module UI.Merchants.BigBasket.View.CvvScreen where

import Data.Maybe
import Data.String
import Prelude
import PrestoDOM
import Utils
import UI.Merchants.BigBasket.Controller.CvvScreen

import Data.String.CodeUnits (charAt, singleton)
import Debug.Trace (spy)
import Effect (Effect)
import UI.Components.Config.PaymentOptions as PaymentOptionsConfig
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.KeyBoard as KeyBoard
import UI.Components.View.Offers as Offers
import UI.Components.View.PaymentOptions as PaymentOptions
import UI.Components.View.ToolBar as ToolBar
import UI.Merchants.BigBasket.Config as BigBasketConfig
import UI.Merchants.BigBasket.View.SavedOptions as SavedOptions

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : (\action state -> eval (spy "ACTION" action) (spy "STATE" state))
    }

-- view push state =
--     linearLayout_ (Namespace "BigBasketCvvScreen")
--         [ width MATCH_PARENT
--         , height MATCH_PARENT
--         , background "#FF00FF"
--         ]
--         []

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "BigBasketCvvScreen")
        ([ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#f1f1f1"
        , orientation VERTICAL
        , gravity CENTER_HORIZONTAL
        ]<> overrides "MainLayout" push state)
        [ ToolBar.view (push <<< ToolBarAction) (ToolBarConfig.Config toolbarConfig)
        -- , textView
        --     [ height $ V 24
        --     , width MATCH_PARENT
        --     , margin (Margin 16 16 10 0)
        --     , text "PREFERRED OPTION"
        --     , fontStyle "AvenirNext-Medium"            
        --     , typeface BOLD
        --     , textSize 16
        --     ] 
        , linearLayout
            [ width MATCH_PARENT
            , height $ V 0 
            , weight 1.0
            , orientation VERTICAL 
            -- , gravity CENTER_HORIZONTAL
            , background "#ffffff"
            , margin (Margin 16 16 16 16)
            , cornerRadius 8.0
            ]
            [ linearLayout
                [ width $ V 300
                , height $ V 0
                , weight 1.0
                , orientation HORIZONTAL
                , background "#ffffff"
                , margin (Margin 0 16 0 0)

                ]
                [ imageView 
                    [ width $ V 32 
                    , height $ V 32 
                    , imageUrl state.bankIcon 
                    , margin(Margin 8 0 8 0)
                    ]
                , linearLayout 
                    [ width $ V 0 
                    , weight 1.0
                    , height MATCH_PARENT
                    , orientation VERTICAL 
                    ]
                    [ linearLayout
                        [ width MATCH_PARENT
                        , height $ V 24 
                        , orientation HORIZONTAL
                        ]
                        [ textView
                            [ width case (getOS unit) of 
                                "ANDROID" -> WRAP_CONTENT
                                _ -> V $ getLabelWidth state.bankName "AvenirNext-Medium" 16 0 0 
                            , height MATCH_PARENT
                            , gravity LEFT 
                            , text state.bankName 
                            , textSize 16
                            , fontStyle "AvenirNext-Medium"
                            ]
                        , imageView 
                            [ width $ V 24 
                            , height $ V 16
                            , imageUrl state.cardTypeIcon
                            , margin (MarginLeft 8)
                            ]
                        ]
                    , textView 
                        [ width MATCH_PARENT
                        , height $ V 24 
                        , text state.cardNumber 
                        , typeface BOLD
                        , fontStyle "AvenirNext-Medium"
                        , textSize 16                        
                        , color "#000000"
                        ]
                    , textView 
                        [ width MATCH_PARENT 
                        , height $ V 40
                        , text state.offer 
                        , color "#689F39"
                        , fontStyle "AvenirNext-Medium"
                        , textSize 16
                        , gravity LEFT
                        ]                
                    , cvvView push state 
                    ]
                ]
            , linearLayout
                [ width MATCH_PARENT
                , height $ V 48 
                , cornerRadius 8.0
                , background "#EF7674"
                , gravity CENTER
                , padding (PaddingBottom 8)
                , visibility if ((length state.cvv) > 2) then VISIBLE  else GONE
                , onClick push $ const CvvEntered
                ]
                [ textView 
                    [ width MATCH_PARENT
                    , height MATCH_PARENT
                    , text "PAY NOW"
                    , color "#ffffff"
                    , gravity CENTER
                    , fontStyle "AvenirNext-Medium"
                    , textSize 20
                    , background "#EF7674"
                    ]
                ]
            ]
        , KeyBoard.view (push <<< KeyBoardAction) $
			{ enterImg : Just state.keyBoardProceedIcon
			, backImg : Just state.keyBoardClearIcon
			}
        ]
    where
        ToolBarConfig.Config toolBarConfigBigBasket = BigBasketConfig.toolBarConfigBigBasket
        toolbarConfig = toolBarConfigBigBasket {secondaryText = "₹ " <> state.amount}








cvvView push state = 
    linearLayout 
        [ width $ V 130
        , height $ V 72 
        , background "#FFFFFF"
        , margin (MarginTop 16)
        , visibility VISIBLE  
        ]
        [ relativeLayout
            [ width MATCH_PARENT
            , height MATCH_PARENT
            ] 
            [ editText
                [ width MATCH_PARENT
                , height MATCH_PARENT
                , onChange push (CVV_CHANGED)
                , inputType NumericPassword
                ]
            , linearLayout
                [ width MATCH_PARENT
                , height MATCH_PARENT
                , orientation VERTICAL
                , background "#ffffff"
                , userInteraction false
                ]
                [ linearLayout 
                    [ width MATCH_PARENT
                    , height $ V 0
                    , weight 1.0
                    , orientation HORIZONTAL
                    ]
                    [ textView 
                        [ width $ V 0 
                        , height MATCH_PARENT
                        , weight 1.0
                        , text  $ if(length state.cvv == 0) then "C" else singleton (fromMaybe ' ' (charAt 0 state.cvv))
                        , textSize 45
                        -- , fontSize 45
                        , scaleY 1.5
                        , gravity CENTER
                        , color "#000000"
                        , fontStyle "AvenirNext-Medium" 
                        , alpha $ case (charAt 0 state.cvv) of
                                        Nothing -> 0.3
                                        _ -> 1.0
                        ]
                    , textView 
                        [ width $ V 0 
                        , height MATCH_PARENT
                        , weight 1.0
                        , text  $ if(length state.cvv == 0) then "V" else singleton (fromMaybe ' ' (charAt 1 state.cvv))
                        , textSize 45 
                        , color "#000000"
                        , fontStyle "AvenirNext-Medium" 
                        , gravity CENTER
                        , scaleY 1.5 
                        , alpha $ case (charAt 0 state.cvv) of
                                        Nothing -> 0.3
                                        _ -> 1.0
                        ]
                    , textView 
                        [ width $ V 0 
                        , height MATCH_PARENT
                        , weight 1.0
                        , text  $ if(length state.cvv == 0) then "V" else singleton (fromMaybe ' ' (charAt 2 state.cvv))
                        , color "#000000"
                        , fontStyle "AvenirNext-Medium" 
                        , textSize 45
                        , gravity CENTER
                        , scaleY 1.5
                        , alpha $ case (charAt 0 state.cvv) of
                                        Nothing -> 0.3
                                        _ -> 1.0
                        ]
                    ]
                , linearLayout
                    [ height $ V 4
                    , width MATCH_PARENT
                    , orientation HORIZONTAL 
                    , userInteraction false
                    ]
                    [ linearLayout
                        [ height MATCH_PARENT
                        , width $ V 0
                        , weight 1.0
                        , background "#EF7674"
                        , visibility if ((length state.cvv) == 0) then VISIBLE else INVISIBLE
                        , orientation VERTICAL
                        ][]
                    , linearLayout
                        [ height MATCH_PARENT
                        , width $ V 0
                        , weight 1.0
                        , background "#EF7674"
                        , orientation VERTICAL
                        , visibility if ((length state.cvv) == 1) then VISIBLE else INVISIBLE
                        ][]
                    , linearLayout
                    
                        [ height MATCH_PARENT
                        , width $ V 0
                        , weight 1.0
                        , background "#EF7674"
                        , orientation VERTICAL
                        , visibility if ((length state.cvv) >= 2) then VISIBLE else INVISIBLE
                        ][]
                    ]
                ]
            ]
        ]



-- cvvWithVisibleEditText push state =
--     linearLayout 
--         [ width $ V 150
--         , height $ V 72 
--         , background "#FFFFFF"
--         , margin (MarginTop 16)
--         , visibility VISIBLE  
--         , orientation VERTICAL 
--         ]
--         [ editText
--             [ width MATCH_PARENT
--             , height $ V 0 
--             , weight 1.0 
--             , onChange push (CVV_CHANGED)
--             , gravity LEFT
--             , hint "CVV"
--             , color "#000000"
--             , background "#ffffff"
--             , scaleY 1.5
--             , case (getOS unit) of 
--                 "ANDROID" -> letterSpacing 6.7
--                 _ -> letterSpacing (6.7 * 10.0)
--             , textSize 35
--             , fontStyle "AvenirNext-Medium"                           
--             , clickable false 
--             , text state.cvv

--             , inputType NumericPassword
--                 ]
--         , linearLayout
--             [ height $ V 4
--             , width MATCH_PARENT
--             , orientation HORIZONTAL 
--             ]
--             [ linearLayout
--                 [ height MATCH_PARENT
--                 , width $ V 0
--                 , weight 1.0
--                 , background "#EF7674"
--                 , visibility if ((length state.cvv) == 0) then VISIBLE else INVISIBLE
--                 , orientation VERTICAL
--                 ][]
--             , linearLayout
--                 [ height MATCH_PARENT
--                 , width $ V 0
--                 , weight 1.0
--                 , background "#EF7674"
--                 , orientation VERTICAL
--                 , visibility if ((length state.cvv) == 1) then VISIBLE else INVISIBLE
--                 ][]
--             , linearLayout
            
--                 [ height MATCH_PARENT
--                 , width $ V 0
--                 , weight 1.0
--                 , background "#EF7674"
--                 , orientation VERTICAL
--                 , visibility if ((length state.cvv) >= 2) then VISIBLE else INVISIBLE
--                 ][]
--             ]
--         ]