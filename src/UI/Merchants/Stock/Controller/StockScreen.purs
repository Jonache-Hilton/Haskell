module UI.Merchants.Stock.Controller.StockScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Controller.ToolBar as ToolBar

type ScreenInput  = Unit
type ScreenOutput = Unit

data Action = StockAction
    | ToolBarAction ToolBar.Action

type State = {}

initialState :: ScreenInput -> State
initialState input = {}

eval _ state = continue state

overrides _ push state = []
