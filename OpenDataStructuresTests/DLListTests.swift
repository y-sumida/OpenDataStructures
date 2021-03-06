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
        let l = list.truncate(i: 1)
        XCTAssertEqual(l.size(), 3)
        XCTAssertEqual(l.get(at: 0), 20)
        XCTAssertEqual(l.get(at: 1), 30)
        XCTAssertEqual(l.get(at: 2), 40)
        XCTAssertEqual(list.size(), 1)
        XCTAssertEqual(list.get(at: 0), 10)
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
        XCTAssertEqual(list2.size(), 1)
        XCTAssertEqual(list.get(at: 3), 100)
    }

    func testMerge() {
        let list2 = DLList<Int>()

        list.add(at: 0, value: 10)
        list.add(at: 1, value: 20)
        list.add(at: 2, value: 30)

        list2.add(at: 0, value: 11)
        list2.add(at: 1, value: 21)

        let list3 = DLList.merge(l1: list, l2: list2)
        XCTAssertEqual(list.size(), 0)
        XCTAssertEqual(list2.size(), 0)
        XCTAssertEqual(list3.size(), 5)
        XCTAssertEqual(list3.get(at: 0), 10)
        XCTAssertEqual(list3.get(at: 1), 11)
        XCTAssertEqual(list3.get(at: 2), 20)
        XCTAssertEqual(list3.get(at: 3), 21)
        XCTAssertEqual(list3.get(at: 4), 30)
    }
}
