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

}
