# Factom DID client

is a Haskell library for working with DIDs on the Factom blockchain. It is an implementation
of the [Factom DID method
specification](https://github.com/bi-foundation/FIS/blob/feature/DID/FIS/DID.md) responsible for client operations.

The `client` module enables:

* creation of a new DID
* addition of management key(s) for the DID
* addition of DID key(s) for the DID
* addition of service(s) for the DID
* export of public metadata to be recorded on Factom
* encryption of the newly created keys
* update of an existing DID: adding/revoking management keys, DID keys and services and producing a signed DID
update entry
* upgrade of the method version of an existing DID
* deactivaiton of an existing DID
