{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DuplicateRecordFields  #-}

module Types.Keys where
import Data.Generics
import Data.List

-----------------------------------------------------

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
    { pubKey :: String
    , privKey :: String
    -- , keyType
    }

data ManagementKey =
  ManagementKey
    { pubKey :: String
    , privKey :: String
    -- , keyType
    }

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
