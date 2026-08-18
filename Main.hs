module Main where
import Haskellculus.MExp
import Haskellculus.Differentiate
import Haskellculus.Simplify

main :: IO ()
main = do
  putStrLn "Enter the Math Expression to differentiate:"
  input <- getLine
  putStrLn "Enter the variable to differentiate with respect to:"
  var <- getLine
  let expr = read input :: MExp
  print (simplify (differentiate expr var))
