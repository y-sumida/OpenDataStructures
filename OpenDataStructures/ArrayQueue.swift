class ArrayQueue<T> {
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

    func add(x: T) -> Bool {
        if count + 1 > array.count { resize() }
        array[(head + count) % array.count] = x
        count += 1
        return true
    }

    func remove() -> T {
        guard let x = array[head] else { fatalError() }
        head = (head + 1) % array.count
        count -= 1
        if (array.count >= 3 * count) { resize() }
        return x
    }
}
