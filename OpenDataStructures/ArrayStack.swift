class ArrayStack<T> {
    fileprivate var array: [T?] = [nil]
    fileprivate var count = 0

    fileprivate func resize() {
        var newArray = [T?](repeating: nil, count: max(2 * count, 1))
        for i in 0..<count {
            newArray[i] = array[i]
        }
        array = newArray
    }

    func size() -> Int {
        return count
    }

    func get(at index: Int) -> T {
        guard 0 <= index,  index < count, let t = array[index] else { fatalError("Index out of range.") }
        return t
    }

    func add(at index: Int, element: T) {
        guard 0 <= index,  index <= count else { fatalError("Index out of range.") }
        if count + 1 > array.count { resize() }
        if index < count {
            for k in (index+1...count).reversed() {
                array[k] = array[k - 1]
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

    func set(at index: Int, element: T) -> T {
        guard 0 <= index,  index < count, let before = array[index] else { fatalError("Index out of range.") }
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
        if count >= 3 * count { resize() }
        return before
    }

    func removeAll() {
        count = 0
        resize()
    }
}

class FastArrayStack<T>: ArrayStack<T> {
    override fileprivate func resize() {
        var newArray = [T?](repeating: nil, count: max(2 * count, 1))
        newArray[0..<count] = array[0..<count]
        array = newArray
    }

    override func add(at index: Int, element: T) {
        guard 0 <= index,  index <= count else { fatalError("Index out of range.") }
        if count + 1 > array.count { resize() }

        if index < count {
            array[index + 1..<count + 1] = array[index..<count]
        }
        array[index] = element
        count += 1
    }

    override func remove(at index: Int) -> T? {
        guard 0 <= index,  index < count else { fatalError("Index out of range.") }
        let before = array[index]
        array[index..<count - 1] = array[index + 1..<count]
        count -= 1
        return before
    }
}
