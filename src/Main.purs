module Main where

import Prelude
import Effect (Effect)

import Express (AppM, Route, Handler, httpGet, listen, makeExpress, runApp)

main :: Effect Unit
main = runApp myApp makeExpress

-- Example Express application
myApp :: AppM Unit
myApp = app "/" myHandler 8787

-- Barebones HTTP GET server skeleton
app :: Route -> Handler -> Int -> AppM Unit
app route handler port = do -- sequence enabled by AppM instance of Bind type class
  httpGet route handler
  listen port

-- Example handler
myHandler :: Handler
myHandler req = "Hello World!"
