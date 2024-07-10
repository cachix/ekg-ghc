{-# LANGUAGE OverloadedStrings #-}
module System.Metrics.GHC (register) where

import System.Metrics 
import GHC.Conc (listThreads)
import qualified Data.HashMap.Strict as M


data GHCMetrics = GHCMetrics
    { threads :: Int
    }

getGHCmetrics :: IO GHCMetrics 
getGHCmetrics = do
    numThreads <- listThreads
    return $ GHCMetrics (length numThreads)

register :: Store -> IO ()
register store = do
    let metrics =
            [ ("ghc.threads", Gauge . fromIntegral . threads)
            ]
    registerGroup (M.fromList metrics) getGHCmetrics store
