{-# LANGUAGE MagicHash #-}

module Main (main, external) where

import GHC.Prim         ( unsafeCoerce#
                        , reallyUnsafePtrEquality#)
import GHC.Int          ( Int64 (I64#) )
import System.Mem       ( performGC )
import System.IO.Unsafe ( unsafePerformIO )

main :: IO ()
main = print internal

alfa :: [Int]
alfa = [0..0]

--data Box = Box { unbox :: Int }
newtype Box = Box Int
unbox :: Box -> Int
unbox (Box x) = x

internal :: Bool
internal = let k = head alfa in unbox (case k of { 0 -> Box k }) `isLiterally` k

-- If you remove this from the export list, then main prints True
external :: Bool
external = let k = head alfa in unbox (case k of { 0 -> Box k }) `isLiterally` k 

isLiterally :: a -> b -> Bool
isLiterally x y = unsafePerformIO $ do
  let x' = unsafeCoerce# y :: a
  x `seq` x' `seq` performGC
  return $ I64# (reallyUnsafePtrEquality# x x') == 1

