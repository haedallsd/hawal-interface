module haedal::manage {
    use sui::coin::{TreasuryCap};
    use haedal::hawal::{HAWAL};
    use haedal::walstaking::{Self,Staking};
    use haedal::config::{Self};
    use walrus::{
        staking::{Staking as WalStaking},
        system::{System}
    };

    const EInitialized: u64 = 1;
    public struct AdminCap has store, key {
        id: UID,
        init: bool,
    }

    public struct OperatorCap has store, key {
        id: UID,
    }

    fun init(ctx: &mut TxContext) {
        abort 0      
    }

    #[test_only]
    public fun init_staking_for_test(ctx: &mut TxContext) {
        init(ctx);
    }

    public entry fun initialize(cap: &mut AdminCap, treasuryCap: TreasuryCap<HAWAL>, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun set_operator_cap_to_address(_: &AdminCap, account: address, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun migrate(_: &AdminCap, staking: &mut Staking) {
        abort 0
    }

    public entry fun request_collect_rewards_fee(
        _: &AdminCap, 
        system: &mut System,
        wal_staking: &mut WalStaking,
        staking: &mut Staking,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public entry fun claim_collect_rewards_fee(
        _: &AdminCap, 
        system: &mut System, 
        wal_staking: &mut WalStaking,
        staking: &mut Staking, 
        account: address, 
        ctx: &mut TxContext
    ) {
        abort 0
    }
}
