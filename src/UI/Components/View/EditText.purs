module UI.Components.View.EditText where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Config.EditText
import UI.Components.Controller.EditText

view :: forall w . (Action  -> Effect Unit) -> Config  -> PrestoDOM (Effect Unit) w
view push (Config config) =
    linearLayout
        [ height $ config.parentHeight
        , width $ config.parentWidth
        , margin $ config.parentMargin
        , padding $ config.parentPadding
        , background $ config.parentBackground
        , orientation VERTICAL
        , visibility if config.isFormVisible then VISIBLE else GONE
        ] 
        [ textView
            [ height $ config.textHeight
            , width MATCH_PARENT
            , text $ config.text
            , textSize $ config.textSize
            , color $ config.textColor
            , typeface $ config.typeface
            , margin $ config.textMargin
            , gravity CENTER_VERTICAL
            , visibility config.visibility
            , fontStyle config.font
            ]
        , linearLayout
            [ height $ config.rowHeight
            , width MATCH_PARENT
            , orientation HORIZONTAL
            , background "#f5f5f5"
            , stroke $ config.rowStroke
            , cornerRadius $ config.rowCornerRadius
            , padding $ config.rowPadding
            ]
            [ editText
                [ height MATCH_PARENT
                , width $ V 0
                , weight 1.0
                , gravity CENTER_VERTICAL
                , padding (Padding 10 0 0 0)
                , inputType $ config.inputType
                , background $ config.editTextBackground
                , hint $ config.hint
                , textSize $ config.editTextSize
                , hintColor config.editTextColor
                ]
            , linearLayout
                [ height MATCH_PARENT
                , width $ V 1
                , background "#bdbdbd"
                , visibility $ config.pipeVisibility
                ][],
            imageView
                [ height MATCH_PARENT
                , width $ config.imageWidth
                , visibility $ config.imageVisibility
                , imageUrl $ config.imageUrl
                , background $ config.imageBackground
                , padding $ config.imagePadding
                ]
            ]
        ]

