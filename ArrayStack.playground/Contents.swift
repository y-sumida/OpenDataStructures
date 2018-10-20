class ArrayStack<T> {
    private var array: [T?] = [nil]
    private var count = 0

    private func resize() {
        var newArray = [T?](repeating: nil, count: max(2 * count, 1))
        array.enumerated().forEach { offset ,e in
            newArray[offset] = e
        }
        array = newArray
    }

    func size() -> Int {
        return count
    }

    func get(at index: Int) -> T? {
        guard 0 <= index,  index < count else { fatalError("Index out of range.") }
        return array[index]
    }

    func add(at index: Int, element: T) {
        guard 0 <= index,  index <= count else { fatalError("Index out of range.") }
        if count + 1 > array.count { resize() }
        array.enumerated().forEach { offset, e in
            if offset >= index, offset < array.count - 1 {
                array[offset + 1] = array[offset]
            }
        }
        array[index] = element
        count += 1
    }

    func set(at index: Int, element: T) -> T? {
        guard 0 <= index,  index < count else { fatalError("Index out of range.") }
        let before = array[index]
        array[index] = element
        return before
    }

    func remove(at index: Int) -> T? {
        guard 0 <= index,  index < count else { fatalError("Index out of range.") }
        let before = array[index]
        var newArray: [T?] = array[0..<index].map { $0 }
        newArray.append(contentsOf: array[index..<count].map { $0 })
        array = newArray
        count -= 1
        return before
    }
}

// Test
var hoge = ArrayStack<Int>()

assert(hoge.size() == 0)
hoge.add(at: 0, element: 99)
assert(hoge.size() == 1)
assert(hoge.get(at: 0) == 99)
hoge.add(at: 0, element: 1)
assert(hoge.size() == 2)
assert(hoge.get(at: 0) == 1)
assert(hoge.get(at: 1) == 99)

assert(hoge.set(at: 0, element: 10) == 1)
assert(hoge.get(at:0) == 10)

assert(hoge.remove(at: 1) == 99)
assert(hoge.size() == 1)

