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

## Usage in applications

- In development - Tasset Wallet
- In development - ChainViewDb
- In Testing     - AuthDeX, integrated at:
-- [SatData](https://satdata.rocks)
-- [Plydis](https://plydis.com)

## Contributions

Libraries developed by [Kompendium, LLC](https://kompendium.co) in partnership with [Kelecorix, Inc](https://kelecorix.com) and [Sergey Bushnyak](https://sigrlami.eu) for the good of the Factom community. The Factom community tend not to support this type of work in the form of a grant either upfront or as backpay, confirmed on multiple occasions ([1](https://factomize.com/forums/threads/kompendium-12-back-pay-two-factom-community-sdks-client-libraries-php-ruby.4802/), [2](https://factomize.com/forums/threads/kompendium-12-back-pay-ruby-haskell-client-libraries-for-the-factom-blockchain.2740/), [3](https://factomize.com/forums/threads/back-pay-development-of-4-json-rpc-client-libraries-to-the-factom-community.2513/))

So, if you're an active user or find it useful we strongly encourage you to support our efforts and ensure long maintenance by contributing a small donation to one of the following cryptocurrency addresses:

- FCT: FA38cwer93mmPw1HxjScLmK1yF9iJTu5P87T2vdkbuLovm2YXyss
- BTC: 39oVXpsgsyW8ZgzsnX3sV7HLdtXWfT96qN
- ETH: 0x9cDBA6bb44772259B3A3fb89cf233A147a720f34
