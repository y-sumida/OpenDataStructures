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
        array[(head + index) % array.count] = element
        return t
    }

    func add(at index: Int, element: T) {
        guard 0 <= index,  index <= count else { fatalError("Index out of range.") }
        if count + 1 > array.count { resize() }
        if Double(index) < Double(count) / Double(2) { // a[0] ... a[i-1]を左にずらす
            head = (head == 0) ? array.count - 1 : head - 1
            for k in 0..<index {
                array[(head + k) % array.count] = array[(head + k + 1) % array.count]
            }
        } else { // a[i]...a[count-1]を右にずらす
            for k in (index...count).reversed() {
                array[(head + k) % array.count] = array[(head + k - 1) % array.count]
            }
        }
        array[(head + index) % array.count] = element
        count += 1
    }

    func remove(at index: Int) -> T {
        guard let x = array[(head + index) % array.count] else { fatalError() }
        if Double(index) < Double(count) / Double(2) { // a[0] ... a[i-1]を右にずらす
            for k in (1...index).reversed() {
                array[(head + k) % array.count] = array[(head + k - 1) % array.count]
            }
            head = (head + 1) % array.count
        } else { // a[i+1]...a[count-1]を左にずらす
            for k in index..<count {
                array[(head + k) % array.count] = array[(head + k + 1) % array.count]
            }
        }
        count -= 1
        if 3 * count < array.count { resize() }
        return x
    }
}
