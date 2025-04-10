module haedal::walstaking {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::balance::{Self, Balance};
    use sui::event;
    use sui::clock::{Self, Clock};
    use sui::table::{Self, Table};
    use sui::vec_map::{Self, VecMap};
    use sui::dynamic_field;
    use std::string::{String, utf8};
    use sui::{display, package};
    use wal::wal::WAL;
    use walrus::{
        staking::{Self, Staking as WalStaking},
        staked_wal::StakedWal,
        system::{System}
    };
    use haedal::config::{Self, StakingConfig};
    use haedal::hawal::{HAWAL};
    use haedal::vault::{Self, Vault};

    const MIN_STAKING_THRESHOLD: u64 = 1_000_000_000;
    const DEFAULT_DEPOSIT_FEE_RATE: u64 = 0;
    const DEFAULT_REWARD_FEE_RATE: u64 = 60_0000;
    const DEFAULT_VALIDATOR_REWARD_FEE_RATE: u64 = 0;
    const DEFAULT_SERVICE_FEE_RATE: u64 = 90_0000;
    const DEFAULT_WALRUS_START_RPOCH: u32 = 1;
    const DEFAULT_WALRUS_START_TIME: u64 = 1742914804744;
    const DEFAULT_WALRUS_EPOCH_DURATION: u64 = 14 * 24 * 60 * 60 * 1000;
    const FEE_DENOMINATOR: u64 = 1000_0000;
    const EPOCH_FIRST_TWENTY_HOURS_MILI: u64 = 20*3600*1000;
    const DEFAULT_VALIDATOR_COUNT: u64 = 10;
    const EXCHANGE_RATE_PRECISION: u64 = 1_000_000;
    const PAUSE_CLAIM_KEY: vector<u8> = b"pause_claim_key";
    const PROGRAM_VERSION: u64 = 0;

    const EDataNotMatchProgram: u64 = 1;
    const EStakeNotEnoughWal: u64 = 2;
    const EStakeNoHaWalMint: u64 = 3;
    const EUnstakeNormalTicketLocking: u64 = 4;
    const EUnstakeExceedMaxWalAmount: u64 = 5;
    const EUnstakeNotZeroHawal: u64 = 6;
    const EStakePause: u64 = 7;
    const EUnstakePause: u64 = 8;
    const EUnstakeNeedAmountIsNotZero: u64 = 9;
    const EClaimPause: u64 = 10;
    const EValidatorCountNotMatch: u64 = 11;
    const EValidatorNotFound: u64 = 12;
    const EStakeActiveValidatorsNotFound: u64 = 13;
    const EUnstakeOutOfRange: u64 = 14;
    const EStakeActiveValidatorsIsNull: u64 = 15;
    const EUnstakeExceedMinWalAmount: u64 = 16;

    public struct Staking has key {
        id: UID,
        version: u64,
        config: StakingConfig,
        wal_vault: Vault<WAL>,
        protocol_wal_vault: Vault<WAL>,
        hawal_treasury_cap: TreasuryCap<HAWAL>,
        total_staked: u64,
        total_unstaked: u64,
        total_rewards: u64,
        unclaimed_wal_amount:u64,
        collected_protocol_fees: u64,
        collected_protocol_fees_pending: u64,
        uncollected_protocol_fees: u64,
        hawal_supply: u64,
        pause_stake: bool,
        pause_unstake: bool,
        active_validators: vector<ID>,
        validators: vector<ID>,
        pools: Table<ID, PoolInfo>,
        rewards_last_updated_epoch: u64
    }

    public struct PoolInfo has store {
        staked: VecMap<u32, StakedWal>,
        withdrawing: VecMap<u32, StakedWal>,
        total_staked: u64,
        rewards: u64,
    }

    public struct UnstakeTicket has key {
        id: UID,
        unstake_timestamp_ms: u64,
        hawal_amount: u64,
        wal_amount: u64,
        claim_epoch: u32,
        claim_timestamp_ms: u64,
    }

    public struct UserStaked has copy, drop {
        owner: address,
        wal_amount: u64,
        hawal_amount: u64,
        validator: ID,
    }

    public struct UserNormalUnstaked has copy, drop {
        owner: address,
        epoch: u32,
        epoch_timestamp_ms: u64,
        unstake_timestamp_ms: u64,
        wal_amount: u64,
        hawal_amount: u64,
    }

    public struct UserClaimed has copy, drop {
        id: ID,
        owner: address,
        wal_amount: u64,
    }

    public struct SystemStaked has copy, drop {
        staked_wal_id: ID,
        epoch: u64,
        wal_amount: u64,
        validator: ID,
    }

    public struct WalRewardsUpdated has copy, drop {
        old: u64,
        new: u64,
        fee: u64,
    }

    public struct RequestRewardsFeeCollected has copy, drop {
        owner: address,
        epoch: u32,
        wal_amount: u64,
    }

    public struct RewardsFeeCollected has copy, drop {
        owner: address,
        wal_amount: u64,
    }

    public struct PoolSystemUnstaked has copy, drop {
        validator: ID,
        epoch: u32,
        wal_amount: u64,
    }

    public struct PoolSystemClaim has copy, drop {
        validator: ID,
        epoch: u32,
        wal_amount: u64,
    }

    public struct VersionUpdated has copy, drop {
        old: u64,
        new: u64,
    }

    public struct ExchangeRateUpdated has copy, drop {
        old: u64,
        new: u64,
    }

    public struct WALSTAKING has drop {}
    
    fun init(otw: WALSTAKING, ctx: &mut TxContext) {
        abort 0
    }

    public(package) fun initialize(cap: TreasuryCap<HAWAL>, ctx: &mut TxContext) {
        abort 0
    }

    public fun request_stake_coin(
        wal_staking: &mut WalStaking,
        staking: &mut Staking, 
        input: Coin<WAL>, 
        validator: ID, 
        ctx: &mut TxContext
    ): Coin<HAWAL> {
        abort 0
    }

    fun stake_to_validator(
        bal: Balance<WAL>,
        staking: &mut Staking,
        wal_staking: &mut WalStaking, 
        validator: ID,
        ctx: &mut TxContext,
    ) {
        abort 0
    }

    public fun request_withdraw_stake(
        system: &mut System, 
        wal_staking: &mut WalStaking, 
        staking: &mut Staking, 
        clock: &Clock, 
        input: Coin<HAWAL>, 
        ctx: &mut TxContext
    ) {
        abort 0
    }

    fun do_validator_request_withdraw(
        staking: &mut Staking,
        wal_staking: &mut WalStaking,
        validator: ID,
        mut need_amount: u64,
        current_epoch: u32,
        ctx: &mut TxContext,
    ): u64 {
        abort 0
    }

    public fun withdraw_stake(
        system: &mut System, 
        wal_staking: &mut WalStaking, 
        staking: &mut Staking, 
        clock: &Clock, 
        ticket: UnstakeTicket,
        ctx: &mut TxContext
    ): Coin<WAL> {
        abort 0
    }

    fun withdraw_wal_bal(
        system: &System, 
        wal_staking: &mut WalStaking, 
        staking: &mut Staking, 
        mut need_amount :u64, 
        ctx: &mut TxContext
    ): Balance<WAL> {
        abort 0
    }

    fun do_validator_withdraw(
        staking: &mut Staking,
        wal_staking: &mut WalStaking,
        unstaked_bal: &mut Balance<WAL>,
        validator: ID,
        mut need_amount: u64,
        now_epoch: u32,
        ctx: &mut TxContext,
    ): u64 {
        abort 0
    }

    public fun assert_version(staking: &Staking) {
        abort 0
    }

    public(package) fun set_active_validators(staking: &mut Staking, active_validators: vector<ID>) {
        abort 0
    }

    public(package) fun migrate(staking: &mut Staking) {
        abort 0
    }

    public(package) fun update_validator_rewards(
        staking: &mut Staking, 
        system: &System, 
        wal_staking: &WalStaking, 
        validator: ID, 
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public(package) fun sort_validators(staking: &mut Staking, validators: vector<ID>) {
        abort 0
    }

    fun get_epoch_time_info(staking: &mut Staking, current_epoch:u32):(u64,u64,u64,u64){
        abort 0
    }

    fun calculate_validator_pool_rewards_increase(
        wal_staking: &WalStaking, 
        pool: &mut PoolInfo, 
        current_epoch: u32
    ): u64 {
        abort 0
    }

    fun calculate_staked_wal_rewards(wal_staking: &WalStaking, staked_wal_ref: &StakedWal, current_epoch: u32): u64 {
        abort 0
    }

    fun get_min_total_validator(staking: &Staking): ID {
        abort 0
    }

    fun get_split_wal_amount(
        wal_staking: &WalStaking, 
        staked_wal_ref: &StakedWal, 
        need_amount: u64, 
        current_epoch: u32
    ): (u64, u64) {
        abort 0
    }

    public(package) fun request_collect_rewards_fee(
        system: &System, 
        wal_staking: &mut WalStaking,
        staking: &mut Staking,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public(package) fun claim_collect_rewards_fee(
        system: &System, 
        wal_staking: &mut WalStaking,
        staking: &mut Staking,
        account: address, 
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public fun get_hawal_by_wal(staking: &Staking, wal_amount: u64): u64 {
        abort 0
    }

    public fun get_wal_by_hawal(staking: &Staking, hawal_amount: u64): u64 {
        abort 0
    }

    public fun get_exchange_rate(staking: &Staking): u64 {
        abort 0
    }

    public fun get_total_wal(staking: &Staking): u64 {
        abort 0
    }

    public fun get_total_wal_cap(staking: &Staking): u64 {
        abort 0
    }
    
    public fun get_version(staking: &Staking): u64 {
        abort 0
    }
    
    public fun get_config_mut(staking: &mut Staking): &mut StakingConfig {
        abort 0
    }
    
    public fun get_total_staked(staking: &Staking): u64 {
        abort 0
    }
    
    public fun get_total_unstaked(staking: &Staking): u64 {
        abort 0
    }
    
    public fun get_total_rewards(staking: &Staking): u64 {
        abort 0
    }
    
    public fun get_hawal_supply(staking: &Staking): u64 {
        abort 0
    }
    
    public fun get_wal_vault_amount(staking: &Staking): u64 {
        abort 0
    }
    
    public fun get_protocol_wal_vault_amount(staking: &Staking): u64 {
        abort 0
    }
    
    public fun get_collected_protocol_fees(staking: &Staking): u64 {
        abort 0
    }
    
    public fun get_uncollected_protocol_fees(staking: &Staking): u64 {
        abort 0
    }
    
    public fun get_unclaimed_wal_amount(staking: &Staking): u64 {
        abort 0
    }

    public(package) fun toggle_stake(staking: &mut Staking, status: bool) {
        abort 0
    }

    public(package) fun toggle_unstake(staking: &mut Staking, status: bool) {
        abort 0
    }

    public(package) fun toggle_claim(staking: &mut Staking, status: bool) {
        abort 0
    }

    public fun query_pause_claim(staking: &Staking): bool {
        abort 0
    }

    public fun get_staked_validators(staking: &Staking): vector<ID> {
        abort 0
    }

    public fun get_staked_pools(staking: &mut Staking, validator: ID): &mut PoolInfo {
        abort 0
    }

    public fun get_staked_validator(staking: &Staking, validator: ID): bool {
        abort 0
    }

    public fun get_epoch_time_ms_and_epoch(system:&mut System,staking: &mut Staking):(u64,u64,u64,u64,u32){
        abort 0
    }

    public fun ticket_unstake_timestamp_ms(ticket: &UnstakeTicket): u64 {
        abort 0
    }
    
    public fun ticket_hawal_amount(ticket: &UnstakeTicket): u64 {
        abort 0
    }
    
    public fun ticket_wal_amount(ticket: &UnstakeTicket): u64 {
        abort 0
    }
    
    public fun ticket_claim_epoch(ticket: &UnstakeTicket): u32 {
        abort 0
    }
    
    public fun ticket_claim_timestamp_ms(ticket: &UnstakeTicket): u64 {
        abort 0
    }

    fun mul_div(x: u64, y: u64, z: u64): u64 {
        abort 0
    }
}