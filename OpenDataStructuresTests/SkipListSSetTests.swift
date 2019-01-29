import XCTest
@testable import OpenDataStructures

class SkipListSSetTests: XCTestCase {
    var list = SkipListSSet<Int>()

    override func setUp() {
    }

    override func tearDown() {
    }

    func testAdd() {
        XCTAssertEqual(list.add(x: 10), true)
        let x = list.find(x: 10)
        XCTAssertEqual(x, 10)
    }
}
