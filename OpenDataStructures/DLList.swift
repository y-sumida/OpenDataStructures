class DLList<T: Comparable> {
    class Node {
        var x: T?
        lazy var next: Node = self
        lazy var prev: Node = self

        init() {}

        init(value: T) {
            x = value
        }
    }

    private var dummy: Node
    private var n: Int = 0

    init() {
        dummy = Node()
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

    func pop() -> Node {
        let h = dummy.next
        dummy.next = h.next
        n -= 1
        return h
    }

    private func getNode(at index: Int) -> Node {
        var p: Node
        if Double(index) < Double(n) / 2.0  {
            p = dummy.next
            for _ in 0..<index {
                p = p.next
            }
        } else {
            p = dummy
            for _ in (index..<n) {
                p = p.prev
            }
        }
        return p
    }

    private func addBefore(node: Node, value: T) -> Node {
        let u = Node(value: value)
        u.prev = node.prev
        u.next = node
        u.next.prev = u
        u.prev.next = u
        n += 1
        return u //返す必要ないのでは？
    }

    func add(at index: Int, value: T) {
        let _ = addBefore(node: getNode(at: index), value: value)
    }

    func add(node: Node) {
        dummy.prev.next = node
        node.prev = dummy.prev
        node.next = dummy
        dummy.prev = node
        n += 1
    }

    private func remove(node: Node) {
        node.prev.next = node.next
        node.next.prev = node.prev
        n -= 1
    }

    func remove(at index: Int) -> T? {
        let w = getNode(at: index)
        let x = w.x
        remove(node: w)
        return x
    }

    func truncate(i: Int) -> DLList {
        var p: Node
        if Double(i) < Double(n) / 2.0  {
            p = dummy.next
            for _ in 0..<i {
                p = p.next
            }
        } else {
            p = dummy
            if i < n {
                for _ in (i+1...n).reversed() {
                    p = p.prev
                }
            }
        }
        let newlist = DLList<T>()
        for j in (i + 1)..<n {
            newlist.add(node: getNode(at: j))
        }
        p.next = dummy
        dummy.prev = p
        n = n - (n - i) + 1
        return newlist
    }

    func isPalindrome() -> Bool {
        var h = dummy
        var t = dummy
        for _ in 0..<n / 2 {
            if h.next.x != t.prev.x {
                return false
            }
            h = h.next
            t = t.prev
        }
        return true
    }

    func rotate(r: Int) {
        guard r > 0 else { return }
        let diff = r % n

        let head = dummy.next
        let tail = dummy.prev
        var d = dummy
        for _ in 0...diff {
            d = d.next
        }

        dummy.next = d
        dummy.prev = d.prev
        d.prev = dummy
        tail.next = head
        head.prev = tail
    }

    func absorb(l: DLList) {
        let _ = dummy.prev

        for _ in 0..<l.size() {
            add(at: size(), value: (l.remove(at: 0))!)
        }
    }

    func takeFirst(l: DLList) {
        guard l.size() > 0 else { return }

        let node = l.pop()
        let tail = dummy.prev

        tail.next = node
        node.prev = tail
        node.next = dummy
        dummy.prev = node
        n += 1
    }

    static func merge(l1: DLList<T>, l2: DLList<T>) -> DLList<T> {
        let list = DLList<T>()

        while l1.size() > 0 || l2.size() > 0 {
            if l1.size() == 0 && l2.size() > 0 {
               list.takeFirst(l: l2)
            } else if l1.size() > 0 && l2.size() == 0 {
               list.takeFirst(l: l1)
            } else {
                if l1.get(at: 0) < l2.get(at: 0) {
                    list.takeFirst(l: l1)
                } else {
                    list.takeFirst(l: l2)
                }
            }
        }

        return list
    }
}
