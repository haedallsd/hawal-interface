/// Interface for users.
module haedal::interface {
    use sui::clock::{Clock};
    use sui::coin::{Coin};

    use wal::wal::WAL;
    use walrus::{
        staking::{Staking as WalStaking},
        system::{System}
    }; 

    use haedal::hawal::{HAWAL};
    use haedal::walstaking::{Self, Staking, UnstakeTicket};

    public entry fun request_stake(
        wal_staking: &mut WalStaking, 
        staking: &mut Staking, 
        input: Coin<WAL>, 
        validator: ID, 
        ctx: &mut TxContext
        ) {
        abort 0
    }
    
    public entry fun request_unstake_delay(
        system:&mut System,
        wal_staking: &mut WalStaking,
        staking: &mut Staking, 
        clock: &Clock, 
        input: Coin<HAWAL>, 
        ctx: &mut TxContext
        ) {
        abort 0
    }

    public entry fun claim(
        system: &mut System, 
        wal_staking: &mut WalStaking, 
        staking: &mut Staking, 
        clock: &Clock,
        ticket: UnstakeTicket, 
        ctx: &mut TxContext
        ) {
        abort 0
    }
}
