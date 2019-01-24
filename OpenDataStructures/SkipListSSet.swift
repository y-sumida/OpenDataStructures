class SkipListSSet<T: Comparable> {
    class Node {
        let x: T?
        var height: Int = 0
        var next: [Node] = []

        init(value: T?, height: Int) {
            x = value
            self.height = height
        }
    }

    private var sentinel: Node

    init() {
        sentinel = Node(value: nil, height: 32)
    }
}
