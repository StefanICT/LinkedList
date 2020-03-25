import XCTest
@testable import LinkedList

final class LinkedListTests: XCTestCase {
    func testIsEmpty() {
        let list = LinkedList<Int>()

        XCTAssert(list.isEmpty, "On instantiate the list should be empty")

        for i in 0..<100 {
            list.append(i)

            XCTAssert(!list.isEmpty)
        }
    }

    func testAppendElement() {
        let list = LinkedList<Int>()

        for i in 0..<100 {
            XCTAssertEqual(list.append(i).element, i)
        }
    }

    func testAppendNode() {
        let list = LinkedList<Int>()
        for i in 0..<100 {
            let node = LinkedList<Int>.Node(element: i)
            list.append(node)

            XCTAssert(list.last === node)
        }
    }

    func testInsertElement() {
        let list = LinkedList<Int>()
        for i in 0..<100 {
            XCTAssertEqual(list.insert(i).element, i)
        }
    }

    func testInsertNode() {
        let list = LinkedList<Int>()
        for i in 0..<100 {
            let node = LinkedList<Int>.Node(element: i)
            list.insert(node)

            XCTAssert(list.first === node)
        }
    }

    func testFirst() {
        let list = LinkedList<Int>()

        XCTAssertNil(list.first)

        for i in 0..<100 {
            list.insert(i)
            XCTAssertEqual(list.first?.element, i)
        }
    }

    func testLast() {
        let list = LinkedList<Int>()

        XCTAssertNil(list.last)

        for i in 0..<100 {
            list.append(i)
            XCTAssertEqual(list.last?.element, i)
        }
    }

    func testRemoveNodeInOneElementList() {
        let list = LinkedList<Int>()
        let element1 = 1
        let node1 = LinkedList<Int>.Node(element: element1)

        list.append(node1)
        XCTAssertEqual(list.first?.element, element1)
        XCTAssertEqual(list.last?.element, element1)
        list.remove(node1)
        XCTAssertNil(list.first?.element)
        XCTAssertNil(list.last?.element)
    }

    func testRemoveFirstNodeInTwoElementList() {
        let list = LinkedList<Int>()
        let element1 = 1
        let element2 = 2
        let node1 = LinkedList<Int>.Node(element: element1)
        let node2 = LinkedList<Int>.Node(element: element2)

        list.append(node1)
        list.append(node2)
        XCTAssertEqual(list.first?.element, element1)
        XCTAssertEqual(list.last?.element, element2)
        list.remove(node1)
        XCTAssertEqual(list.first?.element, element2)
        XCTAssertEqual(list.last?.element, element2)
    }

    func testRemoveLastNodeInTwoElementList() {
        let list = LinkedList<Int>()
        let element1 = 1
        let element2 = 2
        let node1 = LinkedList<Int>.Node(element: element1)
        let node2 = LinkedList<Int>.Node(element: element2)

        list.append(node1)
        list.append(node2)
        XCTAssertEqual(list.first?.element, element1)
        XCTAssertEqual(list.last?.element, element2)
        list.remove(node2)
        XCTAssertEqual(list.first?.element, element1)
        XCTAssertEqual(list.last?.element, element1)
    }

    func testRemoveMiddleNode() {
        let list = LinkedList<Int>()
        let element1 = 1
        let element2 = 2
        let element3 = 3
        let node1 = LinkedList<Int>.Node(element: element1)
        let node2 = LinkedList<Int>.Node(element: element2)
        let node3 = LinkedList<Int>.Node(element: element3)

        list.append(node1)
        list.append(node2)
        list.append(node3)
        XCTAssertEqual(list.first?.element, element1)
        XCTAssertEqual(list.last?.element, element3)
        list.remove(node2)
        XCTAssertEqual(list.first?.element, element1)
        XCTAssertEqual(list.last?.element, element3)
    }

    func testRemoveAll() {
        let list = LinkedList<Int>()
        list.append(LinkedList<Int>.Node(element: 1))
        list.append(LinkedList<Int>.Node(element: 2))
        list.append(LinkedList<Int>.Node(element: 3))

        list.removeAll()

        XCTAssertNil(list.first?.element)
        XCTAssertNil(list.last?.element)
    }

    static var allTests = [
        ("testIsEmpty", testIsEmpty),
        ("testAppendElement", testAppendElement),
        ("testAppendNode", testAppendNode),
        ("testInsertElement", testInsertElement),
        ("testInsertNode", testInsertNode),
        ("testFirst", testFirst),
        ("testLast", testLast),
        ("testRemoveNodeInOneElementList", testRemoveNodeInOneElementList),
        ("testRemoveFirstNodeInTwoElementList", testRemoveFirstNodeInTwoElementList),
        ("testRemoveLastNodeInTwoElementList", testRemoveLastNodeInTwoElementList),
        ("testRemoveMiddleNode", testRemoveMiddleNode),
        ("testRemoveAll", testRemoveAll)
    ]
}
