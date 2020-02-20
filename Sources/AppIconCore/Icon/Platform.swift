import Foundation

public enum Platform: String {
    case iphone = "iphone"
    case marketing = "ios-marketing"
    case ipad = "ipad"
    case mac = "mac"
    case imessage = "imessage"

    var scales: [Scale] {
        switch self {
        case .iphone, .imessage:
            return [.twice, .triple]
        case .marketing:
            return [.single]
        case .ipad, .mac:
            return [.single, .twice]
        }
    }

    var appIcons: [AppIcons] {
        switch self {
        case .iphone:
            return [.notification, .settings, .spotlight, .iphoneApp]
        case .marketing:
            return [.marketing]
        case .ipad:
            return [.notification, .settings, .spotlight, .iPadApp, .iPadProApp]
        case .mac:
            return [.macSmall2, .macSmall, .macMedium, .macLarge, .macLarge2]
        case .imessage:
            return [.marketing, .marketingImessage, .settings, .iPadMessage, .iPhoneMessage, .iPadProMessage, .message1, .message2]
        }
    }

    public static func platforms(ipad: Bool, mac: Bool, imessage: Bool) -> [Platform] {
        if imessage {
            return [.imessage]
        }
        switch (ipad, mac) {
        case (true, true):
            return [.iphone, .ipad, .marketing, .mac]
        case (true, false):
            return [.iphone, .ipad, .marketing]
        case (false, true):
            return [.mac]
        case (false, false):
            return [.iphone, .marketing]
        }
    }
}
