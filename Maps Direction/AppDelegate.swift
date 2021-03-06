import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	var googleAPIKey = "AIzaSyDOR5PfJg6AuO6EhlSsJMOgtMj4Wh_m6jg"

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		GMSServices.provideAPIKey(googleAPIKey)
		GMSPlacesClient.provideAPIKey(googleAPIKey)
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
	
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
			}

	func applicationWillTerminate(_ application: UIApplication) {
	}


}

