import Foundation

class User {
    let ID: String
    var firstName: String?
    var lastName: String?
    var name: String? {
    if firstName != nil && lastName != nil {
        return firstName! + " " + lastName!
    } else if firstName != nil {
        return firstName
    } else {
        return lastName
    }
    }
    var initials: String? {
    var initials: String?
        for name in [firstName, lastName] {
            if let definiteName = name {
                var initial = definiteName.substringToIndex(advance(definiteName.startIndex, 1))
                if initial.lengthOfBytesUsingEncoding(NSNEXTSTEPStringEncoding) > 0 {
                    initials = (initials == nil ? initial : initials! + initial)
                }
            }
        }
        return initials
    }

    init(ID: String) {
        self.ID = ID
    }

    convenience init(ID: String, firstName: String?, lastName: String?) {
        self.init(ID: ID)
        self.firstName = firstName
        self.lastName = lastName
    }

    var picture : UIImage?
}
