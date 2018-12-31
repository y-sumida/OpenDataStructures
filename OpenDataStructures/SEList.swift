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

    func add(x: T) {
        guard let d = dummy, let prev = d.prev else { return }
        var last = prev
        if last === d || last.deque.size() == b + 1 {
            last = addBefore(x: d)
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
        guard let u = l.u, let next = u.next else { return }
        var u_ = u
        var r = 0
        while (r < b && u_ !== dummy && u_.deque.size() == b + 1) {
            u_ = next
            r += 1
        }
        if r == b { // b + 1 要素を含むブロックが b 個
            // TODO あとで
        }
        if u === dummy { // 末尾まで到達したので新たなノードをつくる
            u_ = addBefore(x: u)
        }
        while (u_ !== u) {// 逆方向に要素をシフトする
            // TODO あとで
        }
        u_.deque.add(at: l.j, element: x)
        n += 1
    }

    func addBefore(x: Node) -> Node {
        let u = Node(block_size: b)
        u.prev = x.prev
        u.next = x
        u.next?.prev = u
        u.prev?.next = u
        return u
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
