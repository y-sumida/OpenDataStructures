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

    func get(i: Int) -> T? {
        guard i >= 0 else { fatalError() }
        guard i <= n - 1 else { fatalError() }

        var u = head
        for _ in 0..<i {
           u = u?.next
        }
        return u?.x
    }

    func set(i: Int, x: T) {
        guard i >= 0 else { fatalError() }
        guard i <= n - 1 else { fatalError() }

        var u = head
        for _ in 0..<i - 1 {
            u = u?.next
        }
        let new = Node(value: x)
        new.next = u?.next?.next
        u?.next = new
    }

    func add(i: Int, x: T) -> Bool {
        guard i >= 0 else { return false}
        guard i <= n - 1 else { return false }

        var u = head
        let new = Node(value: x)
        if i > 0 {
            for _ in 0..<i - 1 {
                u = u?.next
            }
            new.next = u?.next
            u?.next = new
        } else {
            new.next = head
            head = new
        }
        n += 1
        return true
    }

    func remove(i: Int) -> T? {
        guard i >= 0 else { return nil }
        guard i <= n - 1 else { return nil }

        var u = head
        let x: T?
        if i > 0 {
            for _ in 0..<i - 1 {
                u = u?.next
            }
            x = u?.next?.x
            u?.next = u?.next?.next
        } else {
            x = head?.x
            head = head?.next
        }
        n -= 1
        if n == 0 {
            tail = nil
        }
        return x
    }
}
