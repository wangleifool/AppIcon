import Foundation
import XCTest
@testable import AppIconCore

class AppIconsTests: XCTestCase {
    func testDefaultAll() {
        let target = AppIcons.all(with: [.iphone(imessage: false)])
        XCTAssertEqual(target, [
            AppIconSet(baseSize: CGSize(width: 20.0, height: 20.0), platform: .iphone(imessage: false)),
            AppIconSet(baseSize: CGSize(width: 29.0, height: 29.0), platform: .iphone(imessage: false)),
            AppIconSet(baseSize: CGSize(width: 40.0, height: 40.0), platform: .iphone(imessage: false)),
            AppIconSet(baseSize: CGSize(width: 60.0, height: 60.0), platform: .iphone(imessage: false))
        ])
    }

    func testAllWithIPad() {
        let target = AppIcons.all(with: [.iphone(imessage: false), .ipad(imessage: false)])
        XCTAssertEqual(target, [
            AppIconSet(baseSize: CGSize(width: 20.0, height: 20.0), platform: .iphone(imessage: false)),
            AppIconSet(baseSize: CGSize(width: 29.0, height: 29.0), platform: .iphone(imessage: false)),
            AppIconSet(baseSize: CGSize(width: 40.0, height: 40.0), platform: .iphone(imessage: false)),
            AppIconSet(baseSize: CGSize(width: 60.0, height: 60.0), platform: .iphone(imessage: false)),
            AppIconSet(baseSize: CGSize(width: 20.0, height: 20.0), platform: .ipad(imessage: false)),
            AppIconSet(baseSize: CGSize(width: 29.0, height: 29.0), platform: .ipad(imessage: false)),
            AppIconSet(baseSize: CGSize(width: 40.0, height: 40.0), platform: .ipad(imessage: false)),
            AppIconSet(baseSize: CGSize(width: 76.0, height: 76.0), platform: .ipad(imessage: false)),
            AppIconSet(baseSize: CGSize(width: 83.5, height: 83.5), platform: .ipad(imessage: false), scales: [.twice])
        ])
    }

    func testAllWithMac() {
        let target = AppIcons.all(with: [.mac])
        XCTAssertEqual(target, [
            AppIconSet(baseSize: CGSize(width: 16.0, height: 16.0), platform: .mac),
            AppIconSet(baseSize: CGSize(width: 32.0, height: 32.0), platform: .mac),
            AppIconSet(baseSize: CGSize(width: 128.0, height: 128.0), platform: .mac),
            AppIconSet(baseSize: CGSize(width: 256.0, height: 256.0), platform: .mac),
            AppIconSet(baseSize: CGSize(width: 512.0, height: 512.0), platform: .mac)
        ])
    }
}
