//
//  List.swift
//  PerfectPitchDrills
//
//  Created by Guest User on 6/7/15.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit

class Node<T:NSObject> {
    var value: T? = nil
    var prev: Node<T>? = nil
    var next: Node<T>? = nil
    
    init() {
    }
    
    init(value: T) {
        self.value = value
    }
}

class List<T:NSObject> {
   
    var count: Int = 0
    var top: Node<T> = Node<T>()
    var bottom: Node<T> = Node<T>()
    
    init()
    {
        
    }
    
    func isEmpty() -> Bool {
        return self.count == 0
    }
    
    func enqueueToTop(value: T) {
        var node = Node<T>(value: value)
        if (self.isEmpty())
        {
            self.top = node
            self.bottom = node
        }
        else
        {
            self.top.prev = node
            node.next = self.top
            self.top = node
        }
        self.count++
    }
    
    func dequeueFromBottom() -> T? {
        if (self.isEmpty())
        {
            return nil
        }
        else if (self.count == 1)
        {
            var temp: Node<T> = self.bottom
            self.count--
            return temp.value
        }
        else
        {
            var temp: Node<T> = self.bottom
            self.bottom = self.bottom.prev!
            self.count--
            return temp.value
        }
    }
    
    func printList()
    {
        print("TOP\n")
        var temp : Node<T>? = self.top
        for i in 0 ..< self.count
        {
            print("\(temp?.value)\n")
            temp = temp?.next
        }
        print("BOTTOM\n")
    }
    
    func percentTrue(last: Int) -> Double
    {
        var temp : Node<T>? = self.top
        if last > self.count
        {
            return -1
        }
        var countTrue = 0
        for i in 0 ..< last
        {
            if temp?.value == true
            {
                countTrue++
            }
            temp = temp?.next
        }
        return (Double(countTrue)/Double(last)) * 100
    }
    
}
