class ArrayQueue<T> {
    fileprivate var array: [T?] = [nil]
    fileprivate var count = 0

    func size() -> Int {
        return count
    }
}
