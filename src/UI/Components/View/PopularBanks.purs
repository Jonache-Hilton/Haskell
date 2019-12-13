module UI.Components.View.PopularBanks where

import UI.Components.Config.PopularBanks
import UI.Components.Controller.PopularBanks

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
        [ height $ config.parentHeight
        , width $ config.parentWidth
        , orientation VERTICAL
        , visibility if config.isFormVisible then VISIBLE else GONE
        , background "#ffffff" 
        , gravity CENTER
        , margin config.parentMargin
        ] 
        [ linearLayout
            [ height $ config.rowHeight
            , width $ config.rowWidth
            , margin $ config.rowMargin
            , orientation HORIZONTAL
            , gravity CENTER
            ]
            [ linearLayout
                [ height $ config.cellHeight
                , width $ config.cellWidth
                , stroke $ config.cellStroke
                , cornerRadius $ config.cellCornerRadius
                , margin $ config.cellMargin
                , padding $ config.cellPadding
                , orientation VERTICAL
                , gravity CENTER
                , weight 1.0
                ]
                [ imageView
                    [ height $ config.imageHeight
                    , width $ config.imageWidth
                    , margin $ config.imageMargin
                    , stroke $ config.imageStroke
                    , cornerRadius $ config.imageCornerRadius
                    , padding $ config.imagePadding
                    , imageUrl "bank_hdfc"
                    , gravity CENTER_HORIZONTAL
                    ]
                , textView
                    [ height $ config.textHeight
                    , width $ config.textWidth
                    , text "HDFC"
                    , textSize $ config.textSize
                    , padding (Padding 0 2 0 0)
                    , textAllCaps $ config.textAllCaps
                    , color $ config.textColor
                    , gravity CENTER_HORIZONTAL
                    , visibility config.bankNameVisibility
                    , fontStyle config.font
                    ]
                ]
            , linearLayout
                [ height $ config.cellHeight
                , width $ config.cellWidth
                , stroke $ config.cellStroke
                , cornerRadius $ config.cellCornerRadius
                , margin $ config.cellMargin
                , padding $ config.cellPadding
                , orientation VERTICAL
                , gravity CENTER
                , weight 1.0
                ]
                [ imageView
                    [ height $ config.imageHeight
                    , width $ config.imageWidth
                    , margin $ config.imageMargin
                    , stroke $ config.imageStroke
                    , cornerRadius $ config.imageCornerRadius
                    , padding $ config.imagePadding
                    , imageUrl "bank_axis"
                    , gravity CENTER_HORIZONTAL
                    ]
                , textView
                    [ height $ config.textHeight
                    , width $ config.textWidth
                    , text "Axis"
                    , textSize $ config.textSize
                    , padding (Padding 0 2 0 0)
                    , textAllCaps $ config.textAllCaps
                    , color $ config.textColor
                    , gravity CENTER_HORIZONTAL
                    , visibility config.bankNameVisibility
                    , fontStyle config.font
                    ]
                ]
            , linearLayout
                [ height $ config.cellHeight
                , width $ config.cellWidth
                , stroke $ config.cellStroke
                , cornerRadius $ config.cellCornerRadius
                , margin $ config.cellMargin
                , padding $ config.cellPadding
                , orientation VERTICAL
                , gravity CENTER
                , weight 1.0
                ]
                [ imageView
                    [ height $ config.imageHeight
                    , width $ config.imageWidth
                    , margin $ config.imageMargin
                    , stroke $ config.imageStroke
                    , cornerRadius $ config.imageCornerRadius
                    , padding $ config.imagePadding
                    , imageUrl "bank_icici"
                    , gravity CENTER_HORIZONTAL
                    ]
                , textView
                    [ height $ config.textHeight
                    , width $ config.textWidth
                    , text "ICICI"
                    , textSize $ config.textSize
                    , padding (Padding 0 2 0 0)
                    , textAllCaps $ config.textAllCaps
                    , color $ config.textColor
                    , gravity CENTER_HORIZONTAL
                    , visibility config.bankNameVisibility
                    , fontStyle config.font
                    ]
                ]
            ]
        , linearLayout
            [ height $ config.rowHeight
            , width $ config.rowWidth
            , margin $ config.rowMargin
            , orientation HORIZONTAL
            ] 
            [ linearLayout
                [ height $ config.cellHeight
                , width $ config.cellWidth
                , stroke $ config.cellStroke
                , cornerRadius $ config.cellCornerRadius
                , margin $ config.cellMargin
                , padding $ config.cellPadding
                , orientation VERTICAL
                , gravity CENTER
                , weight 1.0
                ]
                [ imageView
                    [ height $ config.imageHeight
                    , width $ config.imageWidth
                    , margin $ config.imageMargin
                    , stroke $ config.imageStroke
                    , cornerRadius $ config.imageCornerRadius
                    , padding $ config.imagePadding
                    , imageUrl "bank_sbi"
                    , gravity CENTER_HORIZONTAL
                    ]
                , textView
                    [ height $ config.textHeight
                    , width $ config.textWidth
                    , text "SBI"
                    , textSize $ config.textSize
                    , textAllCaps true
                    , padding (Padding 0 2 0 0)
                    , textAllCaps $ config.textAllCaps
                    , color $ config.textColor
                    , gravity CENTER_HORIZONTAL
                    , visibility config.bankNameVisibility
                    , fontStyle config.font
                    ]
                ]
            , linearLayout
                [ height $ config.cellHeight
                , width $ config.cellWidth
                , stroke $ config.cellStroke
                , cornerRadius $ config.cellCornerRadius
                , margin $ config.cellMargin
                , padding $ config.cellPadding
                , orientation VERTICAL
                , gravity CENTER
                , weight 1.0
                ]
                [ imageView
                    [ height $ config.imageHeight
                    , width $ config.imageWidth
                    , margin $ config.imageMargin
                    , stroke $ config.imageStroke
                    , cornerRadius $ config.imageCornerRadius
                    , padding $ config.imagePadding
                    , imageUrl "bank_canara"
                    , gravity CENTER_HORIZONTAL
                    ]
                , textView
                    [ height $ config.textHeight
                    , width $ config.textWidth
                    , text "Canara"
                    , textSize $ config.textSize
                    , padding (Padding 0 2 0 0)
                    , textAllCaps $ config.textAllCaps
                    , color $ config.textColor
                    , gravity CENTER_HORIZONTAL
                    , visibility config.bankNameVisibility
                    , fontStyle config.font
                    ]
                ]
            , linearLayout
                [ height $ config.cellHeight
                , width $ config.cellWidth
                , stroke $ config.cellStroke
                , cornerRadius $ config.cellCornerRadius
                , margin $ config.cellMargin
                , padding $ config.cellPadding
                , orientation VERTICAL
                , gravity CENTER
                , weight 1.0
                ]
                [ imageView
                    [ height $ config.imageHeight
                    , width $ config.imageWidth
                    , margin $ config.imageMargin
                    , stroke $ config.imageStroke
                    , cornerRadius $ config.imageCornerRadius
                    , padding $ config.imagePadding
                    , imageUrl "bank_dummy"
                    , gravity CENTER_HORIZONTAL
                    ]
                , textView
                    [ height $ config.textHeight
                    , width $ config.textWidth
                    , text "Dummy"
                    , textSize $ config.textSize
                    , padding (Padding 0 2 0 0)
                    , textAllCaps $ config.textAllCaps
                    , color $ config.textColor
                    , gravity CENTER_HORIZONTAL
                    , visibility config.bankNameVisibility
                    , fontStyle config.font
                    ]
                ]
            ]
        ]