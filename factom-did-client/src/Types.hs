{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE DuplicateRecordFields  #-}

module Types where

import Data.Generics
import Data.List

-----------------------------------------------------
-- Constants that reused in global operations
-- and define spec for Factom

didMethodName     = "did:factom"
didEntrySchema    = "1.0.0"
didMethodSpec     = "0.2.0"
didEntrySizeLimit = 10275

------------------------------------------------------
-- Representation Types

-- |
--
data KeyType =
    EdDSA
  | ECDSA
  | RSA
  deriving (Eq, Ord)

instance Read KeyType where
  readsPrec _ str =
    case str of
      "Ed25519VerificationKey"        -> [(EdDSA, str)]
      "ECDSASecp256k1VerificationKey" -> [(ECDSA, str)]
      _                               -> [(RSA, str)]



-- |
--
data EntryType = Create
               | Update
               | Upgrade
               | Deactivate

-- |
--
data KeyPurpose = PubKey
                | AuthKey
                | UnknownPurpose

instance Read KeyPurpose where
  readsPrec _ str =
    case str of
      "publicKey"        -> [(PubKey, str)]
      "authentification" -> [(AuthKey, str)]
      _                  -> [(UnknownPurpose, str)]


-- |
--
data NetworkType = MainNet
                 | TestNet
                 | Local
                 | Unknown

instance Read NetworkType where
  readsPrec _ str =
    case str of
      "mainnet" -> [(MainNet, str)]
      "testnet" -> [(TestNet, str)]
      "local"   -> [(Local  , str)]
      _         -> [(Unknown, str)]
