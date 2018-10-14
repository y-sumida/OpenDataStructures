class ArrayStack<T> {
    private var array: [T] = []
    private var count = 0

    func size() -> Int {
        return count
    }
}

// Test
var hoge = ArrayStack<Int>()

assert(hoge.size() == 0)

