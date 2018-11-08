class SLList<T> {
    class Node {
        let x: T
        var next: Node?
        init(value: T) {
            x = value
        }
    }

    private var head: Node?
    private var tail: Node?
    private var n: Int = 0

    func size() -> Int {
        return n
    }

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

    func pop() -> T? {
        if n == 0 {
            return nil
        }

        let x = head?.x
        head = head?.next
        if n - 1 == 0 {
            tail = nil
        }
        return x
    }
}
