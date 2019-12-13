module UI.Components.View.PopularBanksV2 where

import UI.Components.Config.PopularBanksV2
import UI.Components.Controller.PopularBanksV2

import Effect
import Prelude
import PrestoDOM
import Types

import Animations as A
import Presto.Core.Flow (Flow, initUI, runScreen, showScreen)
import Record as Record
import Simple.JSON (writeJSON)
import Type.Prelude (SProxy(..))  


view :: forall w . (Action  -> Effect Unit) -> Config -> State -> PrestoDOM (Effect Unit) w
view push (Config config) state=
    linearLayout
        [ height $ config.parentHeight
        , width MATCH_PARENT
        , orientation VERTICAL
        , background config.background
        ] [
            linearLayout
                [ height $ config.rowHeight
                , width MATCH_PARENT
                , margin $ config.rowMargin
                , padding $ config.rowPadding
                , orientation HORIZONTAL
                ] [
                    imageView
                        [ height MATCH_PARENT
                        , width $ config.imageWidth
                        , margin $ config.imageMargin
                        , padding $ config.imagePadding
                        , imageUrl state.logo
                        , gravity CENTER
                        ],
                    textView
                        [ height MATCH_PARENT
                        , width $ V 0
                        , weight 1.0
                        , text state.name
                        , textSize $ config.textSize
                        , color "#000000"
                        , gravity CENTER_VERTICAL
                        , fontStyle config.font
                        ],
                    imageView
                        [ height MATCH_PARENT
                        , width $ V 25
                        , visibility $ config.arrowVisibility
                        , imageUrl "ic_right_arrow"
                        ]
                        
                ],
            linearLayout
                [ height $ V 1
                , width MATCH_PARENT
                , background "#e0e0e0"
                ][]
        ]
    
    