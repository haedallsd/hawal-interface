# Haedal Walrus

[Haedal Walrus](https: //www.haedal.xyz/stake) is a liquid staking protocol built on Walrus that allows anyone to use their WAL tokens for decentralized blob storage coordinated and governed by Walrus. At the same time, users will receive haWAL in return so that they can continue to participate in DeFi activities for additional revenue.


## Demo Description
The root directory of this repo is a demo to integrate HaWAL, we downloaded the Walrus framework to the local directory. You may need to update to the latest code and change to the latest Walrus package. You can import the `local_hawal` directory into your project, and then refer to the address configuration in the demo `Move.toml` file to reference it.


## Use  Haedal Walrus

### Packages & Objects
Some mainnet configuration information about Haedal Walrus: 
- Walrus system object:[0x2134d52768ea07e8c43570ef975eb3e4c27a39fa6396bef985b5abc58d03ddd2](https://suiscan.xyz/mainnet/object/0x2134d52768ea07e8c43570ef975eb3e4c27a39fa6396bef985b5abc58d03ddd2/tx-blocks).
- Walrus staking object:[0x10b9d30c28448939ce6c4d6c6e0ffce4a7f8a4ada8248bdad09ef8b70e4a3904](https://suiscan.xyz/mainnet/object/0x10b9d30c28448939ce6c4d6c6e0ffce4a7f8a4ada8248bdad09ef8b70e4a3904/tx-blocks).
- Coin WAL:[0x356a26eb9e012a68958082340d4c4116e7f55615cf27affcff209cf0ae544f59::wal::WAL](https://suiscan.xyz/mainnet/coin/0x356a26eb9e012a68958082340d4c4116e7f55615cf27affcff209cf0ae544f59::wal::WAL/txs).
- HaWalPackageID(HaWal):[0x8b4d553839b219c3fd47608a0cc3d5fcc572cb25d41b7df3833208586a8d2470](https://suiscan.xyz/mainnet/object/0x8b4d553839b219c3fd47608a0cc3d5fcc572cb25d41b7df3833208586a8d2470/tx-blocks).
- HaWalStakingObjectID(HaWal):[0x9e5f6537be1a5b658ec7eed23160df0b28c799563f6c41e9becc9ad633cb592b](https://suiscan.xyz/mainnet/object/0x9e5f6537be1a5b658ec7eed23160df0b28c799563f6c41e9becc9ad633cb592b/tx-blocks).
- Coin haWAL(haWAL):[0x8b4d553839b219c3fd47608a0cc3d5fcc572cb25d41b7df3833208586a8d2470::hawal::HAWAL](https://suiscan.xyz/mainnet/coin/0x8b4d553839b219c3fd47608a0cc3d5fcc572cb25d41b7df3833208586a8d2470::hawal::HAWAL/txs).


### Methods

#### request_stake_coin

Method 1: Through the external announcement interface

module:  interface

function: request_stake

```move
public entry fun request_stake(
    wal_staking:  &mut WalStaking, 
    staking:  &mut Staking, 
    input:  Coin<WAL>, 
    validator:  ID, 
    ctx:  &mut TxContext
) {}
```

Method 2: Call walstaking directly

module: walstaking

function: request_stake_coin

```move
public fun request_stake_coin(
    wal_staking:  &mut WalStaking,
    staking:  &mut Staking, 
    input:  Coin<WAL>, 
    validator:  ID, 
    ctx:  &mut TxContext
):  Coin<HAWAL> {}
```

Parameter Description: 
- wal_staking:  StakingID from walrus
- staking:  haWAL's own StakingID
- input:  ObjectID of the Wal token
- validator:  The validator ID (use 0x0 if not specified), 
- ctx:  User address account object

Tip:  
- If you want to get all validators, please use rpc to get object (staking), you will see [validators] in the returned result. These are all our activated validators for you to choose from


#### request_withdraw_stake

Method 1: Through the external announcement interface

module: interface

function: request_unstake_delay

```move
public entry fun request_unstake_delay(
    system: &mut System,
    wal_staking:  &mut WalStaking,
    staking:  &mut Staking, 
    clock:  &Clock, 
    input:  Coin<HAWAL>, 
    ctx:  &mut TxContext
) {}
```

Method 2: Call walstaking directly

module: walstaking

function: request_withdraw_stake

```move
public fun request_withdraw_stake(
    system:  &mut System, 
    wal_staking:  &mut WalStaking, 
    staking:  &mut Staking, 
    clock:  &Clock, 
    input:  Coin<HAWAL>, 
    ctx:  &mut TxContext
) {}
```

Parameter Description: 
- system:  SystemID from walrus
- wal_staking:  StakingID from walrus
- staking:  haWAL's own StakingID
- input: ObjectID of haWAL token (obtained by request_stake_coin)
- ctx:  User address account object

#### withdraw_stake

Method 1: Through the external announcement interface

module: interface

function: claim

```move
public entry fun claim(
    system:  &mut System, 
    wal_staking:  &mut WalStaking, 
    staking:  &mut Staking, 
    clock:  &Clock,
    ticket:  UnstakeTicket, 
    ctx:  &mut TxContext
) {}
```

Method 2: Call walstaking directly

module: walstaking

function: withdraw_stake

```move
public fun withdraw_stake(
    system:  &mut System, 
    wal_staking:  &mut WalStaking, 
    staking:  &mut Staking, 
    clock:  &Clock, 
    ticket:  UnstakeTicket,
    ctx:  &mut TxContext
):  Coin<WAL> {}
```

Parameter Description: 
- system:  SystemID from walrus
- wal_staking:  StakingID from walrus
- staking:  haWAL's own StakingID
- ticket:  NFT object ObjectID (obtained by request_withdraw_stake)
- ctx:  User address account object


#### Get exchange rate for WAL-haWAL

Method: Call walstaking directly

module: walstaking

function: get_exchange_rate

```move
public fun get_exchange_rate(
    staking:  &Staking
):  u64 {}
```

Parameter Description: 
- staking:  haWAL's own StakingID

Tip:  
- - The exchange rate returned by this function is magnified by 1_000_000, so when you use it, you need to reduce the corresponding multiple, for example, exchange_rate/1000000


## Walrus Documentation

Our main documentation is available [as a Walrus Site](https: //docs.wal.app) (see [the
documentation](https://docs.wal.app/walrus-sites/intro.html) for further information on what
this means) and on [GitHub Pages](https://mystenlabs.github.io/walrus).


