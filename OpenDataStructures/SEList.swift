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

    func get(i: Int) -> T? {
        let l = getLocation(i: i)
        return l.u?.deque.get(at: l.j)
    }

    func set(i: Int, x: T) -> T? {
       let l = getLocation(i: i)
        let y = l.u?.deque.get(at: l.j)
        _ = l.u?.deque.set(at: l.j, element: x)
        return y
    }

    func getLocation(i: Int) -> Location {
        var ell = Location()
        if i < n / 2 {
            guard var u = dummy?.next else { return ell }
            var k = i
            while(k >= u.deque.size()) {
                if let next = u.next {
                    k -= u.deque.size()
                    u = next
                }
            }
            ell.u = u
            ell.j = k
        } else {
            guard var u = dummy?.next else { return ell }
            var idx = n
            while(i < idx) {
                if let prev = u.prev {
                    u = prev
                    idx -= u.deque.size()
                }
            }
            ell.u = u
            ell.j = i - idx
        }
        return ell
    }
}
