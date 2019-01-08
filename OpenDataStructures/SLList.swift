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
        n -= 1
        if n == 0 {
            tail = nil
        }
        return x
    }

    func remove() -> T? {
        // remove と pop はただのエイリアスっぽい
        return pop()
    }

    func add(value: T) -> Bool {
        let u = Node(value: value)
        if n == 0 {
            head = u
        } else {
            tail?.next = u
        }
        tail = u
        n += 1
        return true
    }

    func secondLast() -> T? {
        var u = head
        var x: T?

        while u != nil {
            if u?.next != nil {
                x = u?.x
            }
            u = u?.next
        }
        return x
    }
}
