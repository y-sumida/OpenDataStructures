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

    private var dummy: Node
    private var n: Int = 0

    init() {
        dummy = Node()
        dummy.next = dummy
        dummy.prev = dummy
    }

    func size() -> Int {
        return n
    }

    func get(at index: Int) -> T {
        guard let x = getNode(at: index).x else { fatalError("Index out of range.") }
        return x
    }

    func set(at index: Int, value: T) -> T? {
        let u = getNode(at: index)
        let y = u.x
        u.x = value
        return y
    }

    private func getNode(at index: Int) -> Node {
        var p: Node
        if Double(index) < Double(n) / 2.0  {
            p = dummy.next!
            for _ in 0..<index {
                p = p.next!
            }
        } else {
            p = dummy
            if index < n {
                for _ in (index+1...n).reversed() {
                    p = p.prev!
                }
            }
        }
        return p
    }

    private func addBefore(node: Node, value: T) -> Node {
        let u = Node(value: value)
        u.prev = node.prev
        u.next = node
        u.next?.prev = u
        u.prev?.next = u
        n += 1
        return u //返す必要ないのでは？
    }

    func add(at index: Int, value: T) {
        let _ = addBefore(node: getNode(at: index), value: value)
    }
}
