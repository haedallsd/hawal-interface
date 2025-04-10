# Haedal Walrus

[Haedal Walrus](https://www.haedal.xyz/stake) is an unmanaged liquid rights protocol built on Walrus that allows anyone to use their WAL tokens for decentralized blob storage coordinated and governed by Walrus. At the same time, users will receive haWAL in return so that they can continue to participate in DeFi activities for additional revenue.

## Use  Haedal Walrus

### request_stake_coin

Method 1：Through the external announcement interface

model：interface

function：request_stake

```move
public entry fun request_stake(
    wal_staking: &mut WalStaking, 
    staking: &mut Staking, 
    input: Coin<WAL>, 
    validator: ID, 
    ctx: &mut TxContext
) {}
```

Method 2：Call walstaking directly

model：walstaking

function：request_stake_coin

```move
public fun request_stake_coin(
    wal_staking: &mut WalStaking,
    staking: &mut Staking, 
    input: Coin<WAL>, 
    validator: ID, 
    ctx: &mut TxContext
): Coin<HAWAL> {}
```

Parameter Description：
- wal_staking: StakingID from walrus
- staking: HaWal's own StakingID
- input: ObjectID of the Wal token
- validator: The validator ID (use 0x0 if not specified), 
- ctx: User address account object

Tip: 
- If you want to get all validators, please use rpc to get object (staking), you will see [validators] in the returned result. These are all our activated validators for you to choose from


### request_withdraw_stake

Method 1：Through the external announcement interface

model：interface

function：request_unstake_delay

```move
public entry fun request_unstake_delay(
    system:&mut System,
    wal_staking: &mut WalStaking,
    staking: &mut Staking, 
    clock: &Clock, 
    input: Coin<HAWAL>, 
    ctx: &mut TxContext
) {}
```

Method 2：Call walstaking directly

model：walstaking

function：request_withdraw_stake

```move
public fun request_withdraw_stake(
    system: &mut System, 
    wal_staking: &mut WalStaking, 
    staking: &mut Staking, 
    clock: &Clock, 
    input: Coin<HAWAL>, 
    ctx: &mut TxContext
) {}
```

Parameter Description：
- system: SystemID from walrus
- wal_staking: StakingID from walrus
- staking: HaWal's own StakingID
- input:ObjectID of HaWal token (obtained by request_stake_coin)
- ctx: User address account object

### withdraw_stake

Method 1：Through the external announcement interface

model：interface

function：claim

```move
public entry fun claim(
    system: &mut System, 
    wal_staking: &mut WalStaking, 
    staking: &mut Staking, 
    clock: &Clock,
    ticket: UnstakeTicket, 
    ctx: &mut TxContext
) {}
```

Method 2：Call walstaking directly

model：walstaking

function：withdraw_stake

```move
public fun withdraw_stake(
    system: &mut System, 
    wal_staking: &mut WalStaking, 
    staking: &mut Staking, 
    clock: &Clock, 
    ticket: UnstakeTicket,
    ctx: &mut TxContext
): Coin<WAL> {}
```

Parameter Description：
- system: SystemID from walrus
- wal_staking: StakingID from walrus
- staking: HaWal's own StakingID
- ticket: NFT object ObjectID (obtained by request_withdraw_stake)
- ctx: User address account object


### Get exchange Rate For WAL-HaWal

Method：Call walstaking directly

model：walstaking

function：get_exchange_rate

```move
public fun get_exchange_rate(
    staking: &Staking
): u64 {}
```

Parameter Description：
- staking: HaWal's own StakingID

Tip: 
- Since we enlarged the result to 1_000_000, we hope you can reduce the corresponding data after getting the data, such as exchange_rate/1000000

Some mainnet configuration information about haedal：
- HaWalPackageID(HaWal): [0x8b4d553839b219c3fd47608a0cc3d5fcc572cb25d41b7df3833208586a8d2470]([./docs/examples/](https://suiscan.xyz/mainnet/object/0x8b4d553839b219c3fd47608a0cc3d5fcc572cb25d41b7df3833208586a8d2470/tx-blocks)).
- HaWalStakingObjectID(HaWal): [0x9e5f6537be1a5b658ec7eed23160df0b28c799563f6c41e9becc9ad633cb592b]([./docs/examples/](https://suiscan.xyz/mainnet/object/0x9e5f6537be1a5b658ec7eed23160df0b28c799563f6c41e9becc9ad633cb592b/tx-blocks)).
- WalSystemObjectID(Walrus): [0x2134d52768ea07e8c43570ef975eb3e4c27a39fa6396bef985b5abc58d03ddd2]([./docs/examples/](https://suiscan.xyz/mainnet/object/0x2134d52768ea07e8c43570ef975eb3e4c27a39fa6396bef985b5abc58d03ddd2/tx-blocks)).
- WalStakingObjectID(Walrus): [0x10b9d30c28448939ce6c4d6c6e0ffce4a7f8a4ada8248bdad09ef8b70e4a3904]([./docs/examples/](https://suiscan.xyz/mainnet/object/0x10b9d30c28448939ce6c4d6c6e0ffce4a7f8a4ada8248bdad09ef8b70e4a3904/tx-blocks)).
- Coin Hawal(Hawal):[0x8b4d553839b219c3fd47608a0cc3d5fcc572cb25d41b7df3833208586a8d2470::hawal::HAWAL](https://suiscan.xyz/mainnet/coin/0x8b4d553839b219c3fd47608a0cc3d5fcc572cb25d41b7df3833208586a8d2470::hawal::HAWAL/txs).
- Coin WAL(WAL):[0x356a26eb9e012a68958082340d4c4116e7f55615cf27affcff209cf0ae544f59::wal::WAL](https://suiscan.xyz/mainnet/coin/0x356a26eb9e012a68958082340d4c4116e7f55615cf27affcff209cf0ae544f59::wal::WAL/txs).

## Walrus

A decentralized blob store using [Sui](https://github.com/MystenLabs/sui) for coordination and
governance.


## Walrus Documentation

Our main documentation is available [as a Walrus Site](https://docs.wal.app) (see [the
documentation](https://docs.wal.app/walrus-sites/intro.html) for further information on what
this means) and on [GitHub Pages](https://mystenlabs.github.io/walrus); it is generated using
[mdBook](https://rust-lang.github.io/mdBook/) from source files in the [`docs/book`](./docs/book)
directory.


## License

Haedal is audited by MoveBit(finished) & OtterSec(finished).
