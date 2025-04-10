module check_hawal_framework::check_hawal_framework{
    use sui::coin::{Self, Coin, TreasuryCap};
    use walrus::{
        staking::{Self, Staking as WalStaking},
        staked_wal::StakedWal,
        system::{System}
    };
    use sui::clock::{Self, Clock};
    use haedal::hawal::{HAWAL};
    use haedal::walstaking::{Self,Staking};
    use wal::wal::WAL;

    public fun request_stake_coin(
        wal_staking: &mut WalStaking,
        staking: &mut Staking, 
        input: Coin<WAL>, 
        validator: ID, 
        ctx: &mut TxContext
    ): Coin<HAWAL> {
        walstaking::request_stake_coin(wal_staking,staking,input,validator,ctx)
    }
}