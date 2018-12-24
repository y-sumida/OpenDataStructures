class SEList<T> {
    class Node {
        var deque: BDeque<T>
        var next: Node?
        var prev: Node?

        init(block_size: Int) {
            deque = BDeque<T>(block_size: block_size)
        }
    }

    struct Location {
        var u: Node?
        var j: Int = 0
    }

    private var n: Int = 0 // node count
    private var b: Int // block size
    private var dummy: Node?

    init(block_size: Int) {
        b = block_size
        dummy = Node(block_size: b)
        dummy?.next = dummy
        dummy?.prev = dummy
    }
}
