import Foundation

var dateFormatter = NSDateFormatter()

class Chat {
    let user: User
    var lastMessageText: String
    var lastMessageSentDate: NSDate
    var lastMessageSentDateString: String {
    return formatDate(lastMessageSentDate)
    }
    var loadedMessages = [[Message]]()
    var unreadMessageCount: Int = 0 // subtacted from total when read
    var hasUnloadedMessages = false
    var draft = ""

    init(user: User, lastMessageText: String, lastMessageSentDate: NSDate) {
        self.user = user
        self.lastMessageText = lastMessageText
        self.lastMessageSentDate = lastMessageSentDate
    }
    
    func isDateInToday(date: NSDate) -> Bool {
        let units = NSCalendarUnit.CalendarUnitEra|NSCalendarUnit.YearCalendarUnit|NSCalendarUnit.MonthCalendarUnit|NSCalendarUnit.DayCalendarUnit
        let cal = NSCalendar.currentCalendar()
        
        var components = cal.components(units, fromDate: date)
        let aDate = cal.dateFromComponents(components)!
        
        components = cal.components(units, fromDate: NSDate())
        let today = cal.dateFromComponents(components)!
        
        return aDate.isEqualToDate(today)
    }
    
    func dayOccuredDuringLast7Days(date : NSDate) -> Bool {
        let now = NSDate()
        var today : NSDate?
        NSCalendar.currentCalendar().rangeOfUnit(.DayCalendarUnit, startDate: &today, interval: nil, forDate: now)
        let comp = NSDateComponents()
        comp.day = -7
        let oneWeekBefore = NSCalendar.currentCalendar().dateByAddingComponents(comp, toDate: today!, options: nil)
        if date.compare(oneWeekBefore!) == NSComparisonResult.OrderedDescending {
            if date.compare(today!) == NSComparisonResult.OrderedAscending {
                return true
            }
        }
        return false
    }

    func formatDate(date: NSDate) -> String {
        let calendar = NSCalendar.currentCalendar()

        let last18hours = (-18*60*60 < date.timeIntervalSinceNow)
        let isToday = isDateInToday(date)
        let isLast7Days = dayOccuredDuringLast7Days(date)

        if last18hours || isToday {
            dateFormatter.dateStyle = .NoStyle
            dateFormatter.timeStyle = .ShortStyle
        } else if isLast7Days {
            dateFormatter.dateFormat = "ccc"
        } else {
            dateFormatter.dateStyle = .ShortStyle
            dateFormatter.timeStyle = .NoStyle
        }
        return dateFormatter.stringFromDate(date)
    }
}
