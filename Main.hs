{-# LANGUAGE JavaScriptFFI #-}

import Control.Concurrent(threadDelay)

import GHCJS.Foreign
import GHCJS.Types
import GHCJS.Extended

foreign import javascript unsafe
  "document.getElementById('left_block').style.left='' + $1 + 'px'"
  moveLeft :: Int -> IO ()

foreign import javascript unsafe
  "document.getElementById('right_block').style.down='' + $1 + 'px'"
  moveDown :: Int -> IO ()

moveBoth :: Int -> Int -> IO ()
moveBoth l d = do
  moveLeft l
  moveDown d

animate l d = do
  let newL = l + 2
      newD = d + 2
  moveBoth newL newD
  threadDelay 1
  animate newL newD

main = animate
