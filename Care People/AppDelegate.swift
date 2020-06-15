//
//  AppDelegate.swift
//  Care People
//
//  Created by Pawan kumar on 10/06/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit
import NMAKit

//https://randomuser.me/api

let credentials = (
    appId: "ATxlCCHaUmxfwO9U9p34",
    appCode: "p23hmZVjGaOVzVcwm6I5ZA",
    licenseKey: "W6mWBNfQlwKzFfsJOEu9L0ML4ltfL1HofASHWluJhYWe27qtDTnJec8MFkEbKCPZrFQZZ2iMzserNwUht/KUCRDFIBSISkGUyX51efZvCdoFggLulik2H8XpeApii5HE+r9H5gtK+/ahEt4dAScnrtYHl+le1ZhmaOdph8Ob7RV2TboQXVuHPKFmSSWQQOMzRbHfkUOVVpclz6fzhWU05W8aGQEz00hW+KlEG2w37/NuEd1Iv/fLiPif/ljSdUflB3QfjkwY4C+qHx0JA8Xe9PNhaYTz/ebzMSdFYgTWWtUaZinGecgxtGTr89CqUofc2x8mkriedVrkvkgNW6w2HY0oybMFZQZQhajCXhtN0E/nRUyPS+oDi2owmukRpybjb1Lnu82GsV8rkzhXehhFgaUGKic9TbCdYQ9rLkAnRCdAk4ey7wGxUVKUUVlMjh22n6oKxylgQHsEHe1cRJWihuZKlPpM7l9qH3X5qA2U5w3cqxDY6ow37yQE0rlA9P0JGSPALN3gljNOKoftQnfyx/jOIcW3DSsGjhm/WiXqqzMyzt4BXq17VxsstcaFTb6+mKiI2Gv3myQKz1iB76RIc6vP6t1H44nN/uq0GwqUOm1RCZNZVpoz4n6mwFTmYUAkNOjYvdnm54Tl0sIB5YhhrLTSHUM+9WyRmUbMorVrto4="
)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //#error ("Please enter an app id, app code and license key!")
        // An app id, app code and license key may be obtained from https://developer.here.com/develop/mobile-sdks
        // IMPORTANT: A license key is linked to a specific app bundle identifier. The bundle identifier
        // for this app is "com.yourcompany.SwiftHelloMap". Change the bundle identifier of this app to your
        // identifier if using your own license key.

        //Check Internet Connection
        NetworkManager.shared.startMonitoring()
        
        let error =  NMAApplicationContext.setAppId(credentials.appId, appCode: credentials.appCode, licenseKey: credentials.licenseKey)
        assert(error == NMAApplicationContextError.none)
        
        return true
    }
}

