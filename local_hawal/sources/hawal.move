module haedal::hawal {
    use sui::coin::{Self};
    use sui::url::{Self};

    public struct HAWAL has drop {}

    fun init(_witness: HAWAL, ctx: &mut TxContext) {
        abort 0
    }

    #[test_only]
    public fun init_hawal_for_test(ctx: &mut TxContext) {
        init(HAWAL{}, ctx);
    }
}
