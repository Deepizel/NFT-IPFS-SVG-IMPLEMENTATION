## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```


Happy SVG:
data:image/svg+xml;base64,
PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyMDAg
MjAwIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgcm9sZT0iaW1nIiBhcmlhLWxhYmVsbGVkYnk9
InRpdGxlIGRlc2MiPgogIDx0aXRsZSBpZD0idGl0bGUiPlNtaWxleSBmYWNlPC90aXRsZT4KICA8
ZGVzYyBpZD0iZGVzYyI+WWVsbG93IGNpcmN1bGFyIHNtaWxleSBmYWNlIHdpdGggdHdvIGV5ZXMg
YW5kIGEgY3VydmVkIG1vdXRoPC9kZXNjPgoKICA8IS0tIGZhY2UgLS0+CiAgPGNpcmNsZSBjeD0i
MTAwIiBjeT0iMTAwIiByPSI5MCIgZmlsbD0iI0ZGRDkzQiIgc3Ryb2tlPSIjRjRCNDAwIiBzdHJv
a2Utd2lkdGg9IjYiLz4KCiAgPCEtLSBsZWZ0IGV5ZSAtLT4KICA8ZWxsaXBzZSBjeD0iNzAiIGN5
PSI4MCIgcng9IjEyIiByeT0iMTYiIGZpbGw9IiMyRDJEMkQiLz4KCiAgPCEtLSByaWdodCBleWUg
LS0+CiAgPGVsbGlwc2UgY3g9IjEzMCIgY3k9IjgwIiByeD0iMTIiIHJ5PSIxNiIgZmlsbD0iIzJE
MkQyRCIvPgoKICA8IS0tIG1vdXRoIC0tPgogIDxwYXRoIGQ9Ik01NSAxMjAgUTEwMCAxNjAgMTQ1
IDEyMCIgc3Ryb2tlPSIjMkQyRDJEIiBzdHJva2Utd2lkdGg9IjgiIGZpbGw9InRyYW5zcGFyZW50
IiBzdHJva2UtbGluZWNhcD0icm91bmQiLz4KCiAgPCEtLSBzbGlnaHQgY2hlZWsgaGlnaGxpZ2h0
cyAtLT4KICA8ZWxsaXBzZSBjeD0iNjIiIGN5PSIxMTAiIHJ4PSI2IiByeT0iMyIgZmlsbD0iI0ZG
RTY4MCIgb3BhY2l0eT0iMC45Ii8+CiAgPGVsbGlwc2UgY3g9IjEzOCIgY3k9IjExMCIgcng9IjYi
IHJ5PSIzIiBmaWxsPSIjRkZFNjgwIiBvcGFjaXR5PSIwLjkiLz4KPC9zdmc+Cg==

Sad SVG:
data:image/svg+xml;base64,
PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyMDAg
MjAwIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgcm9sZT0iaW1nIiBhcmlhLWxhYmVsbGVkYnk9
InRpdGxlIGRlc2MiPgogIDx0aXRsZSBpZD0idGl0bGUiPlNhZCBmYWNlPC90aXRsZT4KICA8ZGVz
YyBpZD0iZGVzYyI+WWVsbG93IGNpcmN1bGFyIHNhZCBmYWNlIHdpdGggdHdvIGV5ZXMgYW5kIGEg
ZG93bndhcmQgY3VydmVkIG1vdXRoPC9kZXNjPgoKICA8IS0tIGZhY2UgLS0+CiAgPGNpcmNsZSBj
eD0iMTAwIiBjeT0iMTAwIiByPSI5MCIgZmlsbD0iI0ZGRDkzQiIgc3Ryb2tlPSIjRjRCNDAwIiBz
dHJva2Utd2lkdGg9IjYiLz4KCiAgPCEtLSBsZWZ0IGV5ZSAtLT4KICA8ZWxsaXBzZSBjeD0iNzAi
IGN5PSI4MCIgcng9IjEyIiByeT0iMTYiIGZpbGw9IiMyRDJEMkQiLz4KCiAgPCEtLSByaWdodCBl
eWUgLS0+CiAgPGVsbGlwc2UgY3g9IjEzMCIgY3k9IjgwIiByeD0iMTIiIHJ5PSIxNiIgZmlsbD0i
IzJEMkQyRCIvPgoKICA8IS0tIG1vdXRoIChmcm93bikgLS0+CiAgPHBhdGggZD0iTTU1IDE0MCBR
MTAwIDEwMCAxNDUgMTQwIiBzdHJva2U9IiNlNDcwNzAiIHN0cm9rZS13aWR0aD0iOCIgZmlsbD0i
dHJhbnNwYXJlbnQiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIvPgo8L3N2Zz4K


<!-- DID A FORK TEST USING FORGE TEST --fork-url $SEPOLIA URL TO TEST IF IT PASSES ON SEPOLIA -->

