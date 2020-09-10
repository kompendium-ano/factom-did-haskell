{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExistentialQuantification #-}

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
  readsPrec _ input =
    case input of
      "Ed25519VerificationKey"        -> EdDSA
      "ECDSASecp256k1VerificationKey" -> ECDSA
      _                               -> RSA



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
                | Unknown

instance Read KeyPurpose where
  readsPrec _ input =
    case input of
      "publicKey"        -> PubKey
      "authentification" -> AuthKey
      _                  -> Unknown


-- |
--
data NetworkType = MainNet
                 | TestNet
                 | Local
                 | Unknown

instance Read NetworkType where
  readsPrec _ input =
    case input of
      "mainnet" -> MainNet
      "testnet" -> TestNet
      "local"   -> Local
      _         -> Unknown
