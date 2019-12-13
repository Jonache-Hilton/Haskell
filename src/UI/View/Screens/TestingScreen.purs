module UI.View.Screens.TestingScreen where

import Engineering.Helpers.Commons
import Prelude
import PrestoDOM
import UI.Controller.Screens.TestingScreen

import Effect (Effect)


screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "TestingScreen")
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , orientation VERTICAL
        , background "#efefef"
        , padding (Padding 8 8 8 8)
        ]
        [ scrollView 
            [ height $ V 0 
            , weight 1.0
            , width MATCH_PARENT
            ]
            [ linearLayout
                [ width MATCH_PARENT
                , height MATCH_PARENT
                , orientation VERTICAL
                ]
                [ 
                ]
            ]
        ]

