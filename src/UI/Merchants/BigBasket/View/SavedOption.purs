module UI.Merchants.BigBasket.View.SavedOptions where 

import Data.Maybe
import Data.String.CodePoints
import Prelude
import PrestoDOM
import UI.Merchants.BigBasket.Controller.BigBasketScreen
import UI.Types

import Data.Array ((!!))
import Effect (Effect)
import Utils
bankText = "Kotak Credit Card"

view push (SavedOptionDetails state) index =
    linearLayout 
        [ width MATCH_PARENT
        , height $ V 104
        , orientation HORIZONTAL
        , background "#ffffff"
        , padding (Padding 16 16 16 16)
        ]
        [ imageView
            [ width $ V 40
            , height $ V 40 
            , imageUrl state.savedOptionIcon
            , margin (Margin 0 0 16 0)
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
                    [ case (getOS unit) of 
                        "ANDROID" -> width WRAP_CONTENT
                        _ -> width $ V (getLabelWidth state.savedOptionName "AvenirNext-Medium" 18 0 0)
                    , height MATCH_PARENT
                    , text state.savedOptionName
                    , fontStyle "AvenirNext-Medium"
                    , textSize 18 
                    , color "#000000"
                    , margin (MarginRight 8)
                    ]
                -- , imageView 
                --     [ width $ V 32 
                --     , height MATCH_PARENT
                --     , imageUrl "bb_visa_logo"
                --     ]
                ]
            , textView 
                [ width MATCH_PARENT
                , height $ V 24 
                , text state.savedOptionDetails
                , fontStyle "AvenirNext-Medium"
                , textSize 18 
                ]
            , linearLayout 
                [ width MATCH_PARENT
                , height $ V 16 
                , orientation HORIZONTAL 
                -- , gravity BOTTOM
                ]
                [ imageView 
                    [ width $ V 12
                    , height $ V 12 
                    , imageUrl "bb_hollow_round_tick"
                    , margin (Margin 0 4 4 0)
                    , visibility if state.savedOptionOfferText == "" then INVISIBLE else VISIBLE
                    ]
                , textView 
                    [ width MATCH_PARENT
                    , text state.savedOptionOfferText
                    , color "#689f39"
                    , fontStyle "AvenirNext-Medium"
                    , multipleLine "true"
                    , textSize 16 
                    ]
                ]
            ]
        , imageView 
            [ width $ V 20 
            , height $ V 20 
            , imageUrl state.tickIcon
            , margin (Margin 0 0 8 0)
            ]
        ]


-- old saved option
-- view push (SavedOptionDetails state) index =
--   linearLayout_  (Namespace "BigBasketSavedOptionScreen")
--     [ height $ V 200 
--     , width $ V 300
--     , orientation VERTICAL
--     , background "#ffffff"
--     , cornerRadius 4.0
--     , margin (Margin 16 16 16 16)
--     , padding (Padding 0 16 0 0)
--     ]
--     [ linearLayout
--       [ width MATCH_PARENT
--       , height $ V 108 
--       , orientation VERTICAL
--       , weight 1.0
--       , margin (Margin 16 0 0 0) 
--       ]
--       [ imageView 
--         [ width state.savedOptionIconWidth
--         , height $ V 24 
--         , imageUrl state.savedOptionIcon
--         , gravity LEFT
--         ]
--         ,linearLayout 
--         [ width MATCH_PARENT 
--         , height $ V 0
--         , orientation VERTICAL
--         , weight 1.0
--         , margin ( Margin 0 8 0 0) 
--         ]
--         [
--           linearLayout 
--           [ width MATCH_PARENT
--           , height $ V 0
--           , orientation VERTICAL 
--           , weight 1.0
--           ]
--           [
--             linearLayout
--             [ width MATCH_PARENT 
--             , height $ V 20
--             , orientation HORIZONTAL
--             , gravity CENTER_VERTICAL
--             , margin (Margin 0 0 0 8)
--             ]
--             [
--               textView 
--                 [ width $ case (getOS unit) of 
--                     "ANDROID" -> WRAP_CONTENT
--                     _ -> V (getLabelWidth (state.savedOptionName) "AvenirNext-Medium" 18 0 0) 
--                 , height MATCH_PARENT
--                 , text state.savedOptionName
--                 , textSize 18
--                 , color "#000000"
--                 , fontStyle "AvenirNext-Medium"
--                 , gravity LEFT
--                 ]
--               , imageView 
--                 [ width $ V 24 
--                 , height MATCH_PARENT 
--                 , imageUrl state.savedOptionTypeIcon 
--                 ]
--             ]
--             , textView 
--               [ width MATCH_PARENT 
--               , height $ V 20 
--               , text state.savedOptionDetails 
--               , textSize 20  
--               , color "#4C4B4C"
--               , fontStyle "AvenirNext-Medium"
--               ]
--           ]
--             ---
--           , linearLayout 
--             [ width MATCH_PARENT 
--             , height $ V 20 
--             , orientation HORIZONTAL
--             ]
--             [
--               imageView 
--               [ width $ V 16 
--               , height $ V 16 
--               , imageUrl (if state.savedOptionOfferText == "" then "" else "bb_offers_icon_green")
--               , margin (Margin 0 0 8 0)  
--               ]
--             , textView
--               [ width $ V 0 
--               , height MATCH_PARENT 
--               , weight 1.0
--               , text state.savedOptionOfferText 
--               , fontStyle "AvenirNext-Medium"
--               , textSize 14
--               , color "#689F39"
--               , gravity LEFT
--               , singleLine false 
--               , multipleLine "true"  
--               ]
--             ]
--         ]
--       ]
--       , linearLayout
--         [ width MATCH_PARENT 
--         , height $ V 48 
--         , background "#EF7674"
--         , gravity CENTER
--         , cornerRadius 4.0 
--         , padding (PaddingBottom 4)
--         , margin ( MarginTop 4)
--         , onClick push $ const $ PreferredOption index
--         , clickable true
--         ]
--         [ 
--           textView
--           [ width MATCH_PARENT
--           , height MATCH_PARENT
--           , text "PAY NOW"
--           , color "#ffffff"
--           , gravity CENTER
--           , textSize 20 
--           -- , typeface BOLD
--           , fontStyle "AvenirNext-Medium"
--           ]
--         ]
--       ]