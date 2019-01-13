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
}
