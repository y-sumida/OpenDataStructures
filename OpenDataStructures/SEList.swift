class SEList<T> {
    class Node {
        var deque: BDeque<T>
        lazy var next: Node = self
        lazy var prev: Node = self

        init(block_size: Int) {
            deque = BDeque<T>(block_size: block_size)
        }
    }

    struct Location {
        var u: Node
        var j: Int = 0
    }

    private var n: Int = 0 // node count
    private var b: Int // block size
    private var dummy: Node

    init(block_size: Int) {
        b = block_size
        dummy = Node(block_size: b)
    }

    func get(i: Int) -> T {
        guard i >= 0 else { fatalError() }
        guard i <= n - 1 else { fatalError() }

        let l = getLocation(i: i)
        return l.u.deque.get(at: l.j)
    }

    func set(i: Int, x: T) -> T {
        guard i >= 0 else { fatalError() }
        guard i <= n - 1 else { fatalError() }

        let l = getLocation(i: i)
        let y = l.u.deque.get(at: l.j)
        _ = l.u.deque.set(at: l.j, element: x)
        return y
    }

    func add(x: T) {
        var last = dummy.prev
        if last === dummy || last.deque.size() == b + 1 {
            last = addBefore(x: dummy)
        }
        last.deque.add(element: x)
        n += 1
    }

    func add(i: Int, x: T) {
        if i == n {
            add(x: x)
            return
        }

        let l = getLocation(i: i)
        var u = l.u
        var r = 0
        while r < b && u !== dummy && u.deque.size() == b + 1 {
            u = l.u.next
            r += 1
        }
        if r == b { // b + 1 要素を含むブロックが b 個
            spread(u: l.u)
            u = l.u
        }
        if l.u === dummy { // 末尾まで到達したので新たなノードをつくる
            u = addBefore(x: l.u)
        }
        while u !== l.u {// 逆方向に要素をシフトする
            u.deque.add(at: 0, element: u.prev.deque.remove(at: u.prev.deque.size() - 1))
            u = u.prev
        }
        u.deque.add(at: l.j, element: x)
        n += 1
    }

    private func addBefore(x: Node) -> Node {
        let u = Node(block_size: b)
        u.prev = x.prev
        u.next = x
        u.next.prev = u
        u.prev.next = u
        return u
    }

    private func getLocation(i: Int) -> Location {
        var u = dummy.next
        if i < n / 2 {
            var k = i
            while k >= u.deque.size() {
                k -= u.deque.size()
                u = u.next
            }
            return Location(u: u, j: k)
        } else {
            var idx = n
            while i < idx {
                u = u.prev
                idx -= u.deque.size()
            }
            return Location(u: u, j: i - idx)
        }
    }

    private func spread(u: Node) {
        var w = u
        for _ in 0..<b {
            w = w.next
        }
        w = addBefore(x: w)
        while w !== u {
            while w.deque.size() < b {
                w.deque.add(at: 0, element: w.deque.remove(at: w.prev.deque.size() - 1))
            }
            w = w.prev
        }
    }
}
