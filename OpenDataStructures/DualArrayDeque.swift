class DualArrayDeque<T> {
    private var front = ArrayStack<T>()
    private var back = ArrayStack<T>()

    func size() -> Int {
        return front.size() + back.size()
    }

    func add(at index: Int, element: T) {
        if index < front.size() {
           front.add(at: front.size() - index, element: element)
        } else {
            back.add(at: index - front.size(), element: element)
        }
        // TODO: balance
    }
}
