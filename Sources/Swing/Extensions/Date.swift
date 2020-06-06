//
//  Date.swift
//  
//
//  Created by Minhyuk Kim on 2020/04/26.
//

import Foundation

public extension Date {
    func removeTimeStamp(keeping component: Calendar.Component = .day) -> Date? {
        var calendarComponents: [Calendar.Component] = [ .nanosecond,
                                                         .second,
                                                         .minute,
                                                         .hour,
                                                         .day,
                                                         .month,
                                                         .era,
                                                         .year,
                                                         .timeZone,
                                                         .calendar]
        
        switch component {
        case .nanosecond: break
        case .second:
            calendarComponents.removeFirst(1)
        case .minute:
            calendarComponents.removeFirst(2)
        case .hour:
            calendarComponents.removeFirst(3)
        case .day:
            calendarComponents.removeFirst(4)
        case .month:
            calendarComponents.removeFirst(5)
        case .year:
            calendarComponents.removeFirst(6)
        case .era:
            calendarComponents.removeFirst(7)
        case .timeZone:
            calendarComponents.removeFirst(8)
        case .calendar:
            calendarComponents.removeFirst(9)
        }
        
        return Calendar.current.date(from: Calendar.current.dateComponents(Set(calendarComponents), from: self))
    }
}
