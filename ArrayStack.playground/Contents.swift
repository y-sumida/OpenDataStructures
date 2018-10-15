class ArrayStack<T> {
    private var array: [T] = []
    private var count = 0

    func size() -> Int {
        return count
    }

    func get(at index: Int) -> T? {
        guard 0 <= index,  index < count else { return nil}
        return array[index]
    }

    func add(at index: Int, element: T) {
        // Todo resize()
        guard 0 <= index,  index <= count else { return }
        var newArray: [T] = array[0..<index].map { $0 }
        newArray.append(element)
        newArray.append(contentsOf: array[index..<count].map { $0 })
        array = newArray
        count += 1
    }

    func set(at index: Int, element: T) -> T? {
        guard 0 <= index,  index < count else { return nil }
        let before = array[index]
        array[index] = element
        return before
    }
}

// Test
var hoge = ArrayStack<Int>()

assert(hoge.size() == 0)
assert(hoge.get(at: 0) == nil)
assert(hoge.get(at: -1) == nil)

hoge.add(at: 0, element: 99)
assert(hoge.size() == 1)
assert(hoge.get(at: 0) == 99)
hoge.add(at: 0, element: 1)
assert(hoge.size() == 2)
assert(hoge.get(at: 0) == 1)
assert(hoge.get(at: 1) == 99)

assert(hoge.set(at: 0, element: 10) == 1)
assert(hoge.get(at:0) == 10)
