module UI.Merchants.Stock.View.StockScreen where

import Prelude

import Effect (Effect)
import PrestoDOM

import UI.Components.View.ToolBar as ToolBar
import UI.Merchants.Stock.Config as StockConfig
import UI.Merchants.Stock.Controller.StockScreen


screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "StockScreen")
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#EBEBEB"
        , orientation VERTICAL
        ]
        [ ToolBar.view (push <<< ToolBarAction) StockConfig.toolBarConfigStock
        ]
