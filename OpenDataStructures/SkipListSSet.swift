class SkipListSSet<T: Comparable> {
    class Node {
        let x: T?
        var height: Int = 0
        var next: [Node?] = []

        init(value: T?, height: Int) {
            x = value
            self.height = height
        }
    }

    private var sentinel: Node
    private var height: Int = 0
    private var n: Int = 0

    init() {
        sentinel = Node(value: nil, height: 32)
    }

    private func findPreNode(x: T) -> Node? {
        var u = sentinel
        var r = height
        while r >= 0 {
            while u.next[r] != nil {
                if let r = u.next[r],let _x = r.x, _x < x {
                    u = r // リスト r の中で右に進む
                } else {
                    break
                }
            }
            r -= 1 // リスト r-1 下がる
        }
        return u
    }

    func find(x: T) -> T? {
        if let u = findPreNode(x: x), let first = u.next.first {
            return first?.x
        }
        return nil
    }
}
