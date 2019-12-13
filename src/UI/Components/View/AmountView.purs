module UI.Components.View.AmountView where

import Effect
import Prelude
import PrestoDOM
import Types
import Utils

import UI.Components.Controller.AmountView
import UI.Components.Config.AmountView

view :: forall w . (Action  -> Effect Unit) -> Config -> State -> PrestoDOM (Effect Unit) w
view push (Config config) state =
  linearLayout
    [ height config.heightParent
    , width config.widthParent
    , orientation HORIZONTAL
    , gravity config.parentGravity
    , background config.background
    , padding config.padding
    , margin config.margin
    , cornerRadius config.cornerRadius
    ] 
    [ linearLayout
        [ height MATCH_PARENT
        , width $ V 0
        , weight 1.0
        , orientation config.orientation
        , gravity CENTER
        ]
        [ textView
            [ height config.headingHeight
            , weight config.headingWeight
            , width config.headingWidth
            , color config.headingColor
            , text config.headingText 
            , textSize config.headingTextSize
            , typeface config.headingTypeface
            , fontStyle config.font
            ]
        , textView
            [ height MATCH_PARENT
            , width $ V 1
            , visibility config.pipeVisibility
            , background "#ffffff"
            ]
        , textView
            [ width config.width
            , height config.height
            , weight config.weight
            , color config.color
            , text config.text
            , gravity config.gravity
            , textSize config.textSize
            , typeface config.typeface
            , fontStyle config.font
            ]
        ]
      , linearLayout 
        [ height MATCH_PARENT
        , width if os == "ANDROID" then WRAP_CONTENT else V $ (getLabelWidth config.amountText config.font config.amountTextSize 0 0)
        , orientation VERTICAL
        , gravity CENTER
        ]
        [ textView
            [ height $ V 0
            , width MATCH_PARENT
            , weight 1.0
            , text config.amountHeadingText
            , textSize 16
            , gravity CENTER
            , color "#80ffffff"
            , visibility config.amountHeadingVisibility
            , fontStyle config.font
            , background "#000000"
            ]
          , linearLayout 
            [ height $ V 0
            , width MATCH_PARENT
            , weight 1.0
            , gravity CENTER
            ]
            [ textView
                [ height config.amountHeight
                , width MATCH_PARENT
                , color config.amountColor
                , text config.amountText
                , textSize config.amountTextSize
                , visibility config.amountVisibility
                , gravity config.amountGravity
                , typeface config.amountTypeface
                , fontStyle config.font 
                ]
            ]
        ]
      , imageView
          [ height config.imageHeight
          , width config.imageWidth
          , visibility config.imageVisibility
          , imageUrl config.imageUrl
          , margin config.imageMargin
          ]
    ]