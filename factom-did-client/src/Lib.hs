{-# LANGUAGE OverloadedStrings #-}

module Lib
    ( getChain
    , create
    , update
    , deactivate
    , addPurpose
    , convertToSchema
    , convertToRevIdSchema
    , createMGMKey
    , createDIDKey
    ) where

import qualified Data.Text as T

import           Types

--------------------------------------------------------------------------------
--

id :: IO ()
id = putStrLn "id"

create :: IO ()
create = putStrLn "create-did"

update :: IO ()
update = putStrLn "update"

deactivate :: IO ()
deactivate = putStrLn "update"

getChain :: IO ()
getChain = putStrLn "getChain"

addPurpose :: IO ()
addPurpose = undefined

convertToSchema :: IO ()
convertToSchema = undefined

convertToRevIdSchema :: IO ()
convertToRevIdSchema = undefined

createMGMKey = undefined
createDIDKey = undefined
