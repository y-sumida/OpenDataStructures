class DLList<T> {
    class Node {
        var x: T?
        var next: Node?
        var prev: Node?

        init() {}

        init(value: T) {
            x = value
        }
    }

    private var dummy: Node?
    private var n: Int = 0

    init() {
        dummy = Node()
        dummy?.next = dummy
        dummy?.prev = dummy
    }

    func size() -> Int {
        return n
    }
}
