class ArrayDequeue<T> {
    private var array: [T?] = [nil]
    private var head = 0
    private var count = 0

    private func resize() {
        var newArray = [T?](repeating: nil, count: max(2 * count, 1))
        for i in 0..<count {
            newArray[i] = array[(head + i) % array.count]
        }
        array = newArray
        head = 0
    }

    func size() -> Int {
        return count
    }

    func get(at index: Int) -> T {
        guard let t = array[(head + index) % array.count] else { fatalError("Index out of range.") }
        return t
    }

    func set(at index: Int, element: T) -> T {
        guard let t = array[(head + index) % array.count] else { fatalError("Index out of range.") }
        array[(head + index) % array.count] = elemtnt
        return t
    }
}
