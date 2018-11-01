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

    func get(at index: Int) -> T {
        if index < front.size() {
            return front.get(at: front.size() - index - 1)
        } else {
            return back.get(at: index - front.size())
        }
    }

    func set(at index: Int, element: T) -> T {
        if index < front.size() {
            return front.set(at: front.size() - index - 1, element: element)
        } else {
            return back.set(at: index - front.size(), element: element)
        }
    }

    func remove(at index: Int) -> T {
        var x: T
        if index < front.size() {
            x = front.remove(at: front.size() - index - 1)
        } else {
            x = back.remove(at: index - front.size())
        }
        // TODO: balance
        return x
    }
}
