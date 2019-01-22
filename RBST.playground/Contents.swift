//: Playground - noun: a place where people can play

import UIKit

class Node {
    var value: Int
    var size = 1
    var leftNode: Node?
    var rightNode: Node?
    
    init (value: Int) {
        self.value = value
    }
    
    
    func find (value: Int) -> Node? {
        if value < self.value {
            return leftNode?.find(value: value)
        }
        if value > self.value {
            return rightNode?.find(value: value)
        } else {
            return self
        }
    }
    
    func addToNode(value: Int) {
        if value < self.value {
            if let leftNode = leftNode {
                leftNode.addToNode(value: value)
            } else {
                leftNode = Node(value: value)
            }
        } else {
            if let rightNode = rightNode {
                rightNode.addToNode(value: value)
            } else {
                rightNode = Node(value: value)
            }
        }
    }
    
    func addToRoot(value: Int) {
        if value < self.value {
            leftNode?.addToRoot(value: value)
            rightTurn(node: leftNode!)
        }
    }
    
    func nodeSize(node: Node) -> Int {
        return node.size
    }
    
    func updateSize(node: Node) {
        node.size = (leftNode?.size)! + (rightNode?.size)! + 1
    }
    
    func leftTurn(node: Node) -> Node {
        let bufferNode = node.rightNode
        bufferNode?.rightNode = node.leftNode
        bufferNode?.leftNode = node
        bufferNode?.size = node.size
        updateSize(node: node)
        return bufferNode!
    }
    
    func rightTurn(node: Node) -> Node {
        let bufferNode = node.leftNode
        bufferNode?.leftNode = node.rightNode
        bufferNode?.rightNode = node
        bufferNode?.size = node.size
        updateSize(node: node)
        return bufferNode!
    }
}
