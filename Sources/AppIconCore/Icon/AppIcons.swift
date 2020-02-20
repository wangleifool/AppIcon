import Foundation

struct AppIcon {
    let baseSize: CGSize
    let scale: Scale

    init(baseSize: CGSize, scale: Scale = .single) {
        self.baseSize = baseSize
        self.scale = scale
    }

    func name(iconName: String) -> String {
        return "\(iconName)-\(baseSize)x\(baseSize)@\(scale.rawValue).png"
    }

    var size: CGSize {
        switch scale {
        case .single:
            return baseSize
        case .twice:
            return CGSize(width: baseSize.width * 2.0, height: baseSize.height * 2.0)
        case .triple:
            return CGSize(width: baseSize.width * 3.0, height: baseSize.height * 3.0)
        }
    }

    var baseSizeStr: String {
        let widthStr = (baseSize.width == round(baseSize.width)) ? String(format: "%.f", baseSize.width) : "\(baseSize.width)"
        let heightStr = (baseSize.height == round(baseSize.height)) ? String(format: "%.f", baseSize.height) : "\(baseSize.height)"
        return widthStr + "x" + heightStr
    }
}

struct AppIconSet {
    let baseSize: CGSize
    let platform: Platform
    let scales: [Scale]

    var idiom: String {
        return platform.rawValue
    }

    var all: [AppIcon] {
        return scales.map { AppIcon(baseSize: baseSize, scale: $0) }
    }

    init(baseSize: CGSize, platform: Platform, scales: [Scale]? = nil) {
        self.baseSize = baseSize
        self.platform = platform
        self.scales = scales ?? platform.scales
    }
}

public enum AppIcons {
    
    // iPhone
    case notification
    case settings
    case spotlight
    case iphoneApp

    // iMessage
    case iPhoneMessage
    case iPadMessage
    case iPadProMessage
    case message1
    case message2
    
    // marketing
    case marketing
    case marketingImessage

    // iPad
    case iPadApp
    case iPadProApp

    // Mac
    case macSmall2
    case macSmall
    case macMedium
    case macLarge
    case macLarge2

    var size: CGSize {
        switch self {
        case .notification:
            return CGSize(width: 20, height: 20)
        case .settings:
            return CGSize(width: 29, height: 29)
        case .spotlight:
            return CGSize(width: 40, height: 40)
        case .iphoneApp:
            return CGSize(width: 60, height: 60)
        case .marketing:
            return CGSize(width: 1024, height: 1024)
        case .iPadApp:
            return CGSize(width: 76, height: 76)
        case .iPadProApp:
            return CGSize(width: 83.5, height: 83.5)
        case .macSmall2:
            return CGSize(width: 16, height: 16)
        case .macSmall:
            return CGSize(width: 32, height: 32)
        case .macMedium:
            return CGSize(width: 128, height: 128)
        case .macLarge:
            return CGSize(width: 256, height: 256)
        case .macLarge2:
            return CGSize(width: 512, height: 512)
        case .iPhoneMessage:
            return CGSize(width: 60.0, height: 45.0)
        case .iPadMessage:
            return CGSize(width: 67.0, height: 50.0)
        case .iPadProMessage:
            return CGSize(width: 74.0, height: 55.0)
        case .message1:
            return CGSize(width: 27.0, height: 20.0)
        case .message2:
            return CGSize(width: 32, height: 24)
        case .marketingImessage:
            return CGSize(width: 1024, height: 768)
        }
    }
    
    static func all(with platforms: [Platform]) -> [AppIconSet] {
        return platforms
            .map { platform -> [AppIconSet] in
                platform.appIcons.map { $0.set(with: platform) }
            }
            .reduce([]) { $0 + $1 }
    }

    private func set(with platform: Platform = .iphone) -> AppIconSet {
        let scales = twiceOnly.contains(self) ? [Scale.twice] : nil
        return AppIconSet(baseSize: self.size, platform: platform, scales: scales)
    }

    private var twiceOnly: [AppIcons] {
        return [.iPadProApp]
    }
}
