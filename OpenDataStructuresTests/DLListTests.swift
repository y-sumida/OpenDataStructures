import XCTest
@testable import OpenDataStructures

class DLListTests: XCTestCase {
    var list = DLList<Int>()

    override func setUp() {
    }

    override func tearDown() {
    }

    func testListAdd() {
        list.add(at: 0, value: 10)
        list.add(at: 0, value: 20)
        XCTAssertEqual(list.size(), 2)
        XCTAssertEqual(list.get(at: 0), 20)
        XCTAssertEqual(list.get(at: 1), 10)
    }

    func testListRemove() {
        list.add(at: 0, value: 10)
        list.add(at: 1, value: 20)
        list.add(at: 2, value: 30)
        list.add(at: 3, value: 40)
        let x = list.remove(at: 1)
        XCTAssertEqual(x, 20)
        XCTAssertEqual(list.get(at: 1), 30)
    }

    func testTruncate() {
        list.add(at: 0, value: 10)
        list.add(at: 1, value: 20)
        list.add(at: 2, value: 30)
        list.add(at: 3, value: 40)
        list.truncate(i: 1)
        XCTAssertEqual(list.size(), 2)
        XCTAssertEqual(list.get(at: 0), 10)
        XCTAssertEqual(list.get(at: 1), 20)
    }

    func testIsPalindrome() {
        list.add(at: 0, value: 10)
        list.add(at: 1, value: 20)
        XCTAssertEqual(list.isPalindrome(), false)
        list.add(at: 2, value: 20)
        list.add(at: 3, value: 10)
        XCTAssertEqual(list.isPalindrome(), true)
    }

    func testRotate() {
        list.add(at: 0, value: 10)
        list.add(at: 1, value: 20)
        list.add(at: 2, value: 30)
        list.add(at: 3, value: 40)

        list.rotate(r: 0)
        XCTAssertEqual(list.get(at: 0), 10)
        XCTAssertEqual(list.get(at: 3), 40)

        list.rotate(r: 1)
        XCTAssertEqual(list.get(at: 0), 20)
        XCTAssertEqual(list.get(at: 3), 10)

        list.rotate(r: 2)
        XCTAssertEqual(list.get(at: 0), 40)
        XCTAssertEqual(list.get(at: 3), 30)
    }

    func testAbsorbe() {
        let list2 = DLList<Int>()

        list.add(at: 0, value: 10)
        list.add(at: 1, value: 20)
        list.add(at: 2, value: 30)
        list.add(at: 3, value: 40)

        list2.add(at: 0, value: 100)
        list2.add(at: 1, value: 200)

        list.absorb(l: list2)
        XCTAssertEqual(list.size(), 6)
        XCTAssertEqual(list2.size(), 0)
        XCTAssertEqual(list.get(at: 4), 100)
        XCTAssertEqual(list.get(at: 5), 200)
    }

    func testTakeFirst() {
        let list2 = DLList<Int>()

        list.add(at: 0, value: 10)
        list.add(at: 1, value: 20)
        list.add(at: 2, value: 30)

        list2.add(at: 0, value: 100)
        list2.add(at: 1, value: 200)

        list.takeFirst(l: list2)

        XCTAssertEqual(list.size(), 4)
        XCTAssertEqual(list.get(at: 3), 100)
    }
}
