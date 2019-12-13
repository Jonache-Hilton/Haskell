module UI.Controller.Screens.MainScreen where

import Effect
import Prelude
import PrestoDOM
import Types

type ScreenInput  = MainScreenState
type ScreenOutput = MainScreenStateOutput

data Action = Dream11Action 
    | AirtelAction 
    | RedBusAction 
    | GoibiboAction 
    | SpiceJetAction 
    | JioAction 
    | BigBasketAction 
    | VodafoneAction 
    | TestingAction 
    | GrofersAction
    | OlaAction
    | StockAction
    | IdeaAction

type State = {}

initialState :: ScreenInput -> State
initialState input = {}

eval Dream11Action state = exit $ Dream11 (MainScreenState {})
eval AirtelAction state = exit $ Airtel (MainScreenState {})
eval RedBusAction state = exit $ RedBus (MainScreenState {})
eval GoibiboAction state = exit $ Goibibo (MainScreenState {})
eval SpiceJetAction state = exit $ SpiceJet (MainScreenState {})
eval JioAction state = exit $ Jio (MainScreenState {})
eval BigBasketAction state = exit $ BigBasket (MainScreenState {})
eval VodafoneAction state = exit $ Vodafone (MainScreenState {})
eval GrofersAction state = exit $ Grofers (MainScreenState {})
eval OlaAction state = exit $ Ola (MainScreenState {})
eval StockAction state = exit $ Stock (MainScreenState {})
eval TestingAction state = exit $ Testing (MainScreenState {})
eval IdeaAction state = exit $ Idea (MainScreenState {})
eval StockAction state = exit $ Stock (MainScreenState {})
eval _ state = continue state

overrides "Dream11" push state = [onClick push $ const Dream11Action]
overrides "Airtel" push state = [onClick push $ const AirtelAction]
overrides "RedBus" push state = [onClick push $ const RedBusAction]
overrides "Goibibo" push state = [onClick push $ const GoibiboAction]
overrides "SpiceJet" push state = [onClick push $ const SpiceJetAction]
overrides "Jio" push state = [onClick push $ const JioAction]
overrides "BigBasket" push state = [onClick push $ const BigBasketAction]
overrides "Vodafone" push state = [onClick push $ const VodafoneAction]
overrides "Grofers" push state = [onClick push $ const GrofersAction]
overrides "Ola" push state = [onClick push $ const OlaAction]
overrides "Stock" push state = [onClick push $ const StockAction]
overrides "Testing" push state = [onClick push $ const TestingAction]
overrides "Idea" push state = [onClick push $ const IdeaAction]
overrides "Stock" push state = [onClick push $ const StockAction]
overrides _ push state = []