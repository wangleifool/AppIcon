import Foundation

public enum Platform {
    case iphone(imessage: Bool = false)
    case marketing(imessage: Bool = false)
    case ipad(imessage: Bool = false)
    case mac
    case universal(imessage: Bool = true)

    var idiom: String {
        switch self {
        case .iphone:
            return "iphone"
        case .marketing:
            return "ios-marketing"
        case .ipad:
            return "ipad"
        case .mac:
            return "mac"
        case .universal:
            return "universal"
        }
    }
    var scales: [Scale] {
        switch self {
        case .iphone, .universal:
            return [.twice, .triple]
        case .marketing:
            return [.single]
        case .ipad, .mac:
            return [.single, .twice]
        }
    }

    var appIcons: [AppIcons] {
        switch self {
        case .iphone(let imessage):
            return imessage ? [.iPhoneMessage, .settings] : [.notification, .settings, .spotlight, .iphoneApp]
        case .marketing(let imessage):
            return imessage ? [.marketingImessage, .marketing] : [.marketing]
        case .ipad(let imessage):
            return imessage ? [.iPadMessage, .iPadProMessage] : [.notification, .settings, .spotlight, .iPadApp, .iPadProApp]
        case .universal(let imessage):
            return imessage ? [.message1, .message2] : []
        case .mac:
            return [.macSmall2, .macSmall, .macMedium, .macLarge, .macLarge2]
        }
    }

    public static func platforms(ipad: Bool, mac: Bool, imessage: Bool) -> [Platform] {
        var platforms = [Platform]()
        switch (ipad, mac) {
        case (true, true):
            platforms = [.iphone(imessage: imessage),
                         .ipad(imessage: imessage),
                         .marketing(imessage: imessage),
                         .mac]
        case (true, false):
            platforms = [.iphone(imessage: imessage),
                         .ipad(imessage: imessage),
                         .marketing(imessage: imessage)]
        case (false, true):
            return [.mac]
        case (false, false):
            platforms = [.iphone(imessage: imessage),
                         .marketing(imessage: imessage)]
        }
        
        if imessage {
            platforms.append(.universal(imessage: true))
            if !ipad {
                platforms.append(.ipad(imessage: true))
            }
        }
        return platforms
    }
}

extension Platform: Equatable {
    public static func == (lhs: Platform, rhs: Platform) -> Bool {
        switch (lhs, rhs) {
        case (.iphone(let a), .iphone(let b)):
            return a == b
        case (.ipad(let a), .ipad(let b)):
            return a == b
        case (.marketing(let a), .marketing(let b)):
            return a == b
        case (.universal(let a), .universal(let b)):
            return a == b
        case (.mac, .mac):
            return true
        default:
            return false
        }
    }
}
