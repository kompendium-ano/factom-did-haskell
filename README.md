# Factom DiDs implemented in Haskell
![build](https://github.com/kompendium-ano/factom-did-haskell/workflows/build/badge.svg)

- `factom-did-client`   - library provides functionality for DIDs creation
- `factom-did-resolver` - library for re-constructing the effective DID Document
- `factom-did-demo`      - demo application that uses above libraries

Complete specification available here https://github.com/bi-foundation/FIS/blob/feature/DID/FIS/DID.md , libraries trying to be aligned with W3C standard represented [here](https://w3c.github.io/did-core/).

## Usage

Creating new DiD document

```haskell
  import qualified DID.Types as DT

  ...

  d    <- Factom.initDID
  dKey <- Factom.initKey "my-alias" DT.ECDSA
  mKey <- Factom.initMKey "mm-my-alias" DT.RSA

  -- add keys to did as function composition
  d' <- (attachKey d dKey) . (attachManagementKey d mKey)

```
