class SkipListSSet<T: Comparable> {
    class Node {
        let x: T?
        var height: Int = 0
        var next: [Node?] = []

        init(value: T?, height: Int) {
            x = value
            self.height = height
            next = [Node?](repeating: nil, count: height)
        }
    }

    private var sentinel: Node
    private var height: Int = 0
    private var n: Int = 0
    private var stack: [Node?] = []

    init() {
        sentinel = Node(value: nil, height: 32)
        stack = [Node?](repeating: nil, count: 32)
    }

    private func findPreNode(x: T) -> Node? {
        var u = sentinel
        var r = height
        while r >= 0 {
            while u.next[r] != nil {
                if let r = u.next[r], let _x = r.x, compare(x: _x, y: x) < 0 {
                    u = r // リスト r の中で右に進む
                } else {
                    break
                }
            }
            r -= 1 // リスト r-1 下がる
        }
        return u
    }

    private func compare(x: T, y: T) -> Int {
        if x == y { return 0 }
        if x < y { return -1 }
        return 1
    }

    private func pickHeight() -> Int {
        return Int.random(in: 1...32)
    }

    func find(x: T) -> T? {
        if let u = findPreNode(x: x), let first = u.next.first {
            return first?.x
        }
        return nil
    }

    func add(x: T) -> Bool {
        var u = sentinel
        var r = height
        var comp = 0
        while r >= 0 {
            while u.next[r] != nil {
                if let r = u.next[r], let _x = r.x {
                    comp = compare(x: _x, y: x)
                    if comp < 0 {
                        u = r // リスト r の中で右に進む
                    } else {
                      break
                    }
                } else {
                    break
                }
            }
            if u.next[r] != nil && comp == 0 {
               return false
            }
            stack[r] = u
            r -= 1 // リスト r-1 下がる
        }
        let w = Node(value: x, height: pickHeight())
        while height < w.height {
            height += 1
            stack[height] = sentinel // 高さが増える
        }
        for i in 0..<w.height {
            w.next[i] = stack[i]?.next[i]
            stack[i]?.next[i] = w
        }
        n += 1
        return true
    }
}
