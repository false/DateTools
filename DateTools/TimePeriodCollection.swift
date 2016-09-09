//
//  TimePeriodCollection.swift
//  DateTools
//
//  Created by Grayson Webster on 8/17/16.
//  Copyright © 2016 Grayson Webster. All rights reserved.
//

import Foundation

/**
    # TimePeriodCollection
    
     Time period collections serve as loose sets of time periods. They are unorganized unless you decide to sort them, and have their own characteristics like a StartDate and EndDate that are extrapolated from the time periods within. Time period collections allow overlaps within their set of time periods.
 
    [Visit our github page](https://github.com/MatthewYork/DateTools#time-period-collections) for more information.
 */
public class TimePeriodCollection: TimePeriodGroup {
    
    // MARK: - Collection Manipulation
    
    // Manipulation will be implemented by overriding CollectionType methods
    
    func remove(at: Int) {
        periods.remove(at: at)
    }
    
    func removeAll() {
        periods.removeAll()
    }
    
    func insert(_ newElement: TimePeriodProtocol, at i: Int) {
        periods.insert(newElement, at: i)
        updateExtremes(period: newElement)
        
    }
    
    // MARK: - Sorting
    
    // In place
    func sort() {
        self.periods.sort { $0.beginning! < $1.beginning! }
    }
    
    func sort(by areInIncreasingOrder: (TimePeriodProtocol, TimePeriodProtocol) -> Bool) {
        self.periods.sort { $0.beginning! < $1.beginning! }
    }
    
    // New collection
    func sorted() -> TimePeriodCollection {
        let array = self.periods.sorted { $0.beginning! < $1.beginning! }
        let collection = TimePeriodCollection()
        collection.periods = array
        collection._beginning = self.beginning
        collection._end = self.end
        return collection
    }
    
    func sorted(by areInIncreasingOrder: (TimePeriodProtocol, TimePeriodProtocol) -> Bool) -> TimePeriodCollection {
        let array = self.periods.sorted { $0.beginning! < $1.beginning! }
        let collection = TimePeriodCollection()
        collection.periods = array
        collection._beginning = self.beginning
        collection._end = self.end
        return collection
    }
    
    
    // MARK: - Collection Relationship
    
    // Potentially use .reduce() instead of these functions
    /**
        Returns from the ```TimePeriodCollection``` a sub-collection of ```TimePeriod```s whose start and end dates fall completely inside the interval of the given ```TimePeriod```
     */
    func allInside(in period: TimePeriodProtocol) -> TimePeriodCollection {
        return TimePeriodCollection()
    }
    
    /**
        Returns from the ```TimePeriodCollection``` a sub-collection of ```TimePeriod```s containing the given date
     */
    func periodsIntersected(by date: Date) -> TimePeriodCollection {
        return TimePeriodCollection()
    }
    
    /**
     Returns from the ```TimePeriodCollection``` a sub-collection of ```TimePeriod```s containing either the start date or the end date--or both--of the given ```TimePeriod```
     */
    func periodsIntersected(by period: TimePeriodProtocol) -> TimePeriodCollection {
        return TimePeriodCollection()
    }
    
    func equals(collection: TimePeriodCollection) -> Bool {
        return false
    }
    
    
    // MARK: - Helper Methods
    
    func copy() -> TimePeriodCollection {
        return TimePeriodCollection()
    }
    
    
    // MARK: - Updates
    
    func updateVariables() {
        
    }
    
    
    // MARK: - Map, Filter, Reduce
    
    func map(_ transform: (TimePeriodProtocol) throws -> TimePeriodProtocol) rethrows -> TimePeriodCollection {
        var mappedArray = [TimePeriodProtocol]()
        mappedArray = try periods.map(transform)
        let mappedCollection = TimePeriodCollection()
        for period in mappedArray {
            mappedCollection.periods.append(period)
            mappedCollection.updateExtremes(period: period)
        }
        return mappedCollection
    }
    
    
    // MARK: - Operator Overloads
    
    static func ==(left: TimePeriodCollection, right: TimePeriodCollection) -> Bool {
        return left.equals(collection: right)
    }
    
}
