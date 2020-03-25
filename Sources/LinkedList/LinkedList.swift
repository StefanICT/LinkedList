import Foundation
import UIKit

public class LinkedList<Element> {
    public class Node {
        public let element: Element

        fileprivate var next: Node?
        fileprivate var previous: Node?

        public init(element: Element) {
            self.element = element
            self.next = nil
            self.previous = nil
        }
    }

    deinit {
        removeAll()
    }

    // Internal variables for keeping track of the list.
    private var head: Node?
    private var tail: Node?

    /// A Boolean value indicating whether the list is empty.
    ///
    /// - Complexity: O(1)
    public var isEmpty: Bool {
        return tail == nil
    }

    /// The first element of the list
    ///
    /// If the list is empty, the value of this property is `nil`.
    public var first: Node? {
        head
    }

    /// The last element of the list
    ///
    /// If the list is empty, the value of this property is `nil`.
    public var last: Node? {
        tail
    }

    public init() { }

    /// Adds a new element at the end of the list.
    ///
    /// - Parameter newElement: The element to append to the list.
    ///
    /// - Complexity: O(1).
    ///
    /// - Returns: The new appended node.
    @discardableResult
    public func append(_ newElement: Element) -> Node {
        let node = Node(element: newElement)
        append(node)
        return node
    }

    /// Adds a new node at the end of the list.
    ///
    /// - Parameter newNode: The node to append to the list.
    ///
    /// - Complexity: O(1).
    public func append(_ newNode: Node) {
        if let tail = tail {
            tail.next = newNode
            newNode.previous = tail
            self.tail = newNode
        } else {
            tail = newNode
            head = newNode
        }
    }

    /// Adds a new element at the begin of the list.
    ///
    /// - Parameter newElement: The element to prepended to the list.
    ///
    /// - Complexity: O(1).
    ///
    /// - Returns: The new prepended node.
    @discardableResult
    public func insert(_ newElement: Element) -> Node {
        let node = Node(element: newElement)
        insert(node)
        return node
    }

    /// Adds a new node at the begin of the list.
    ///
    /// - Parameter newElement: The element to prepended to the list.
    ///
    /// - Complexity: O(1).
    public func insert(_ node: Node) {
        if let head = head {
            head.previous = node
            node.next = head
            self.head = node
        } else {
            head = node
            tail = node
        }
    }

    /// Remove a node from the list.
    ///
    /// - Complexity: O(1).
    public func remove(_ node: Node) {
        // Remove from the chain
        node.next?.previous = node.previous
        node.previous?.next = node.next

        // Make sure first or last are correctly set
        if node === head {
            head = node.next
        }

        if node === tail {
            tail = node.previous
        }

        // Cleanup
        node.next = nil
        node.previous = nil
    }

    /// Remove all elements.
    ///
    /// - Complexity: O(n).
    public func removeAll() {
        var node = head
        while let next = node?.next {
            node?.next = nil
            node?.previous = nil

            node = next
        }

        head = nil
        tail = nil
    }
}
