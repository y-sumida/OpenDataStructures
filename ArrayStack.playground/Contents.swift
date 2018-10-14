class ArrayStack<T> {
    private var array: [T] = []
    private var count = 0

    func size() -> Int {
        return count
    }

    func get(_ index: Int) -> T? {
        guard 0 <= index,  index < count else { return nil}
        return array[index]
    }
}

// Test
var hoge = ArrayStack<Int>()

assert(hoge.size() == 0)
assert(hoge.get(0) == nil)
assert(hoge.get(-1) == nil)

