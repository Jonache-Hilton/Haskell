module UI.Components.Config.BankListItem where

import Prelude
import PrestoDOM

data Direction = Right | Left | None

data Config = Config {
    background :: String,
    radioDirection :: Direction,
    radioInnerColor :: String,
    radioOuterColor :: String,
    bankImageSize :: Int,
    bankImageVisible :: Visibility,
    bankTextSize :: Int,
    bankTextFont :: String,
    arrowImage :: String,
    arrowVisible :: Visibility,
    bankTextColor :: String,
    cardHeight :: Int,
    orientation :: Orientation,
    dividerVisibility :: Visibility,
    dividerMargin :: Margin,
    dividerColor :: String,
    radioSize :: Length,
    radioPadding :: Padding,
    font :: String,
    radioImage :: String,
    cardPadding :: Padding,
    radioMargin :: Margin,
    bankImagePadding :: Padding,
    bankTextPadding :: Padding
}

defConfig = Config {
    background : "#ffffff",
    radioDirection : None,
    radioInnerColor : "#03A9F4",
    radioOuterColor : "#cccccc",
    bankImageSize : 24,
    bankImageVisible : VISIBLE,
    bankTextSize : 24,
    bankTextFont : "Arial",
    bankTextColor : "#000000",
    arrowImage : "arrowimg",
    arrowVisible : VISIBLE,
    cardHeight : 52,
    orientation : HORIZONTAL,
    dividerVisibility : GONE,
    dividerMargin : Margin 0 0 0 0,
    dividerColor : "#e1e1e1",
    radioSize : V 20,
    radioPadding : Padding 3 3 3 3,
    font : "Roboto-Regular",
    radioImage : "",
    cardPadding : Padding 10 0 10 0,
    radioMargin : Margin 0 0 0 0,
    bankImagePadding : Padding 0 0 0 0,
    bankTextPadding : Padding 0 0 0 0
}
