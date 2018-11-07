class SLList<T> {
    class Node {
        private var x: T
        var next: Node?
        init(value: T) {
            x = value
        }
    }

    private var head: Node?
    private var tail: Node?
    private var n: Int = 0
}
