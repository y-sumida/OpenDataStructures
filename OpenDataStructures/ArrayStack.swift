class ArrayStack<T> {
    private var array: [T?] = [nil]
    private var count = 0

    private func resize() {
        var newArray = [T?](repeating: nil, count: max(2 * count, 1))
        for i in 0..<count {
            newArray[i] = array[i]
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

    func add(element: T) {
        if count + 1 > array.count { resize() }
        array[count] = element
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
        array.enumerated().forEach { offset, e in
            if offset >= index, offset < array.count - 1 {
                array[offset - 1] = array[offset]
            }
        }
        count -= 1
        return before
    }

    func removeAll() {
        count = 0
        resize()
    }
}
