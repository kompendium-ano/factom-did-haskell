{-# LANGUAGE DeriveDataTypeable        #-}
{-# LANGUAGE DuplicateRecordFields     #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE OverloadedStrings         #-}

module Types where

import           Data.Generics
import           Data.List

import           Types.Keys

--------------------------------------------------------------------------------

-- Constants that reused in global operations
-- and define spec for Factom
didMethodName     = "did:factom"
didEntrySchema    = "1.0.0"
didMethodSpec     = "0.2.0"
didEntrySizeLimit = 10275

--------------------------------------------------------------------------------
-- Representation Types

-- | Identify type of cryptographic keys used
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
      _                               -> [(RSA  , str)]



-- | Identify type of the entry
--
data EntryType = Create
               | Update
               | Upgrade
               | Deactivate

-- | Identify type of the keys
--
data KeyPurpose = PubKey
                | AuthKey
                | UnknownPurpose

instance Read KeyPurpose where
  readsPrec _ str =
    case str of
      "publicKey"        -> [(PubKey        , str)]
      "authentification" -> [(AuthKey       , str)]
      _                  -> [(UnknownPurpose, str)]


-- | Network type to work with
--
data NetworkType =
    MainNet
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

--------------------------------------------------------------------------------
--

-- | Enables the construction of a DID document,
--   by facilitating the construction of management keys and DID keys and the
--   addition of services. Allows exporting of the resulting DID object into a format suitable
--   for recording on the Factom blockchain.
--
--   Provides encryption functionality of private keys for the DID and their export to a string or to a JSON file
--
data DID =
  { did      :: Maybe T.Text          -- ^ The decentralized identifier, a 32 byte hexadecimal string
  , keysMGM  :: Maybe [ManagementKey] -- ^ A list of management keys
  , keysDID  :: Maybe [DIDKey]        -- ^ A list of DID keys
  , services :: Maybe [Service]       -- ^ A list of services
  , version  :: T.Text                -- ^ used specification version
  } deriving (Eq, Show)
