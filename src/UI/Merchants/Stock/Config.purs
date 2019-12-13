module UI.Merchants.Stock.Config where

import Prelude
import PrestoDOM

import UI.Components.Config.ToolBar as ToolBar

screenFont = "Roboto-Bold"

toolBarConfigStock :: ToolBar.Config
toolBarConfigStock = let
    ToolBar.Config config = ToolBar.defConfig
    toolBarConfig = config 
        { background = "#ED3833" 
        , text =  "Select payment option"
        , padding = (Padding 10 0 0 0 )
        , imageUrl =  "toolbar_arrow_back_white" 
        , font = screenFont
        }
    in (ToolBar.Config toolBarConfig)
