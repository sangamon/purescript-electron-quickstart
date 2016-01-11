module Main where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console

import Electron.App
import Electron.BrowserWindow
import Electron.Eff

main :: forall eff. Eff (console :: CONSOLE, electron :: ELECTRON | eff) Unit
main = do
  appPath <- getAppPath
  log appPath
  homePath <- getPath Home
  log homePath
  onReady $ do
    log "starting..."
    mainWindow <- newBrowserWindow { width: 1200, height: 800, show: true }
    mainWindow `onClose` quit
    mainWindow `loadURL` "http://purescript.org"
