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

    func push(value: T) -> T {
        let u = Node(value: value)
        u.next = head
        head = u
        if n == 0 {
            tail = u
        }
        n += 1
        return value
    }
}
