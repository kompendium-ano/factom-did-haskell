{-# LANGUAGE DeriveDataTypeable        #-}
{-# LANGUAGE DuplicateRecordFields     #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE OverloadedStrings         #-}
{-# LANGUAGE TypeFamilies              #-}

module Types.Keys where

import           Data.Generics
import           Data.List
import qualified Data.Text     as T

-----------------------------------------------------

-- Wrapper for textual field, shows prurpose of the key
type DIDKeyPurpose = T.Text

data DIDKeyInstance =
  DIDKeyInstance
    { dkAbstractKey :: AbstractKey
    , dkPurpose     :: [DIDKeyPurpose]
    } deriving (Eq, Show)

-- Typeclass with common functionality reused
-- in specialized instances
class DIDKey a where

  -- key type
  -- public key
  -- private key

  -- internal, message, signature, hash
  verify  :: a -> a -> a -> a -> a
  -- internal message hash
  sign    :: a -> a -> a -> a
  -- internal did schema
  toEntryDict :: a -> a -> a -> a
  -- dict, schema
  fromEntryDict :: a -> a -> a
  -- internal
  rotate :: a -> a
  -- internal did
  fullId :: a -> a -> a

data ApplicationKey =
  ApplicationKey
    { pubKey  :: T.Text
    , privKey :: T.Text
    -- , keyType
    } deriving(Eq, Show)

data ManagementKey =
  ManagementKey
    { pubKey  :: T.Text
    , privKey :: T.Text
    -- , keyType
    } deriving(Eq, Show)

data AbstractKey =
  AbstractKey
    { pubKey  :: T.Text
    , privKey :: T.Text
    -- , keyType
    } deriving(Eq, Show)

-- | Application-level key that can be used for authentication, signing, encryption, decryption, etc.
instance DIDKey ApplicationKey where
  verify _ = undefined

-- | Management-key used to sign updates for an existing DIDs
instance DIDKey ManagementKey where
  verify _ = undefined


-- other keys
-- ECDSASecp256k1Key
-- Ed25519Key
-- RSAKey
