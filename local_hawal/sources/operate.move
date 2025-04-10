module haedal::operate {
    use haedal::manage::{OperatorCap};
    use haedal::walstaking::{Self, Staking};
    use haedal::config::{Self};
    use walrus::{
        staking::{Staking as WalStaking},
        system::{System}
    };

    public entry fun set_deposit_fee(_: &OperatorCap, staking: &mut Staking, deposit_fee: u64) {
        abort 0
    }

    public entry fun set_reward_fee(_: &OperatorCap, staking: &mut Staking, reward_fee: u64) {
        abort 0
    }

    public entry fun set_validator_reward_fee(_: &OperatorCap, staking: &mut Staking, validator_reward_fee: u64) {
        abort 0
    }

    public entry fun set_service_fee(_: &OperatorCap, staking: &mut Staking, service_fee: u64) {
        abort 0
    }

    public entry fun set_withdraw_time_limit(_: &OperatorCap, staking: &mut Staking, withdraw_time_limit: u64) {
        abort 0
    }

    public entry fun set_validator_count(_: &OperatorCap, staking: &mut Staking, validator_count: u64) {
        abort 0
    }

    public entry fun set_active_validators(_: &OperatorCap, staking: &mut Staking, active_validators: vector<ID>) {
        abort 0
    }

    public entry fun set_walrus_epoch_start(
        _: &OperatorCap, 
        staking: &mut Staking, 
        start_epoch: u32,
        start_timestamp_ms: u64,
        epoch_duration: u64
    ) {
        abort 0
    }

    public entry fun toggle_stake(_: &OperatorCap, staking: &mut Staking, status: bool) {
        abort 0
    }

    public entry fun toggle_unstake(_: &OperatorCap, staking: &mut Staking, status: bool) {
        abort 0
    }

    public entry fun toggle_claim(_: &OperatorCap, staking: &mut Staking, status: bool) {
        abort 0
    }

    public entry fun update_validator_rewards(_: &OperatorCap, staking: &mut Staking, system: &mut System, wal_staking: &mut WalStaking, validator: ID,ctx:&mut TxContext) {
        abort 0
    }

    public entry fun sort_validators(_: &OperatorCap, staking: &mut Staking, validators: vector<ID>) {
        abort 0
    }

    public entry fun migrate(_: &OperatorCap, staking: &mut Staking) {
        abort 0
    }

    public entry fun request_collect_rewards_fee(
        _: &OperatorCap, 
        system: &mut System,
        wal_staking: &mut WalStaking,
        staking: &mut Staking,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public entry fun claim_collect_rewards_fee(
        _: &OperatorCap, 
        system: &mut System, 
        wal_staking: &mut WalStaking,
        staking: &mut Staking, 
        account: address, 
        ctx: &mut TxContext
    ) {
        abort 0
    }
}
