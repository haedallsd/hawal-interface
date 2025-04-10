module haedal::vault {

    use sui::balance::{Self, Balance};

    public struct Vault<phantom T> has key, store {
        id: UID,
        cache_pool: Balance<T>,
    }

    public(package) fun new<T>(ctx: &mut TxContext) : Vault<T> {
        abort 0
    }

    public(package) fun deposit<T>(vault: &mut Vault<T>, input: Balance<T>) {
        abort 0
    }

    public(package) fun withdraw<T>(vault: &mut Vault<T>, amount: u64) : Balance<T> {
        abort 0
    }

    public(package) fun withdraw_max<T>(vault: &mut Vault<T>, amount: u64) : (Balance<T>, u64) {
        abort 0
    }

    public(package) fun withdraw_all<T>(vault: &mut Vault<T>) : Balance<T> {
        abort 0
    }

    public fun vault_amount<T>(vault: &Vault<T>) : u64 {
        abort 0
    }

}
