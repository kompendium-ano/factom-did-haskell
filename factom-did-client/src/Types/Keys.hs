{-# LANGUAGE DeriveDataTypeable        #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE OverloadedStrings         #-}

module Types.Keys where
import           Data.Generics
import           Data.List

-----------------------------------------------------

-- Wrapper for textual field, shows prurpose of the key
type DIDKeyPurpose = T.Text

data DIDKey =
  DIDKey
    { dkAbstractKey :: AbstractKey
    , dkPurpose     :: [DIDKeyPurpose]
    } deriving (Eq, Show)
