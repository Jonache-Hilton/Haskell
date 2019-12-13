module UI.Components.View.BankCard where

import UI.Components.Config.BankCard
import UI.Components.Controller.BankCard

import Effect
import Prelude
import PrestoDOM
import Types

import Animations as A
import Presto.Core.Flow (Flow, initUI, runScreen, showScreen)
import Record as Record
import Simple.JSON (writeJSON)
import Type.Prelude (SProxy(..))  


view ::forall w. (Action -> Effect Unit) -> Config -> PrestoDOM (Effect Unit) w
view push (Config config) =
    linearLayout
        [ height $ config.cellHeight
        , width $ config.cellWidth
        , stroke $ config.cellStroke
        , cornerRadius $ config.cellCornerRadius
        , margin $ config.cellMargin
        , padding $ config.cellPadding
        , orientation VERTICAL
        , gravity CENTER
        ]
        [ imageView
            [ height $ config.imageSize
            , width $ config.imageSize
            , margin $ config.imageMargin
            , stroke $ config.imageStroke
            , cornerRadius $ config.imageCornerRadius
            , padding $ config.imagePadding
            , imageUrl $ config.imageUrl
            , background $ config.background
            , gravity CENTER
            ]
        , textView
            [ height $ config.textHeight
            , width $ config.textWidth
            , text $ config.text
            , textSize $ config.textSize
            , padding (Padding 0 2 0 0)
            , color $ config.textColor
            , gravity CENTER
            , visibility if config.text == "" then VISIBLE else GONE
            , fontStyle config.font
            ]
        ]