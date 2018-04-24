
import UIKit
import GoogleMaps
import GooglePlaces
import SwiftyJSON
import Alamofire
import MapKit
import CoreLocation


enum Location {
	case startLocation
	case destinationLocation
}

class ViewController: UIViewController , GMSMapViewDelegate ,  CLLocationManagerDelegate {
	
	@IBOutlet weak var googleMaps: GMSMapView!
	@IBOutlet weak var startLocation: UITextField!
	@IBOutlet weak var destinationLocation: UITextField!

	var locationManager = CLLocationManager()
	var locationSelected = Location.startLocation

	var locationStart = CLLocation()
	var locationEnd = CLLocation()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
        googleMaps.isMyLocationEnabled = true
        googleMaps.selectedMarker = nil
       
        
		locationManager = CLLocationManager()
		locationManager.delegate = self
		locationManager.requestWhenInUseAuthorization()
		locationManager.startUpdatingLocation()
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.startMonitoringSignificantLocationChanges()
		
		//Your map initiation code
        self.googleMaps.delegate = self
		self.googleMaps?.isMyLocationEnabled = true
		self.googleMaps.settings.myLocationButton = true
		self.googleMaps.settings.compassButton = true
		self.googleMaps.settings.zoomGestures = true
        
        drawPath();
	}
	
    
    func createMarker(titleMarker: String, iconMarker: UIImage, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
		let marker = GMSMarker()
		marker.position = CLLocationCoordinate2DMake(latitude, longitude)
		marker.title = titleMarker
		marker.icon = iconMarker
		marker.map = googleMaps
	}
	
	
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("Error to get location : \(error)")
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let center = location.coordinate
        sourceLatitude = center.latitude
        sourceLongitude = center.longitude
        self.locationManager.stopUpdatingLocation()
	}
		
	func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
		googleMaps.isMyLocationEnabled = true
	}
	
	func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
		googleMaps.isMyLocationEnabled = true
		
		if (gesture) {
			mapView.selectedMarker = nil
		}
	}
	
	func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
		googleMaps.isMyLocationEnabled = true
		return false
	}
	
	func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
	}
	
	func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
		googleMaps.isMyLocationEnabled = true
		googleMaps.selectedMarker = nil
		return false
	}

	
	func drawPath()
	{
        
        destinationLocation.text = DesitnationName
        
        startLocation.text = "University Of Illinois at Chicago"
        
        createMarker(titleMarker: DesitnationName, iconMarker: #imageLiteral(resourceName: "mapspin") , latitude: destinationLatitude, longitude: destinationLongitude)
        createMarker(titleMarker: "Your Location", iconMarker: #imageLiteral(resourceName: "mapspin") , latitude: sourceLatitude, longitude: sourceLongitude)
    
        let origin = "\(sourceLatitude),\(sourceLongitude)"
        let destination = "\(destinationLatitude),\(destinationLongitude)"
		
		let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving"
		
		Alamofire.request(url).responseJSON { response in
			let json = JSON(data: response.data!)
			let routes = json["routes"].arrayValue
        
            for route in routes
			{
				let routeOverviewPolyline = route["overview_polyline"].dictionary
				let points = routeOverviewPolyline?["points"]?.stringValue
				let path = GMSPath.init(fromEncodedPath: points!)
				let polyline = GMSPolyline.init(path: path)
				polyline.strokeWidth = 4
				polyline.strokeColor = UIColor.red
				polyline.map = self.googleMaps
			}
		}
    
    
        let camera = GMSCameraPosition.camera(withLatitude: sourceLatitude, longitude: sourceLongitude, zoom: 14.0)
        
        self.googleMaps.camera = camera
        self.dismiss(animated: true, completion: nil)
	}
	
    @IBAction func showDirection(_ sender: UIButton) {

        let la:CLLocationDegrees = destinationLatitude
        let lo:CLLocationDegrees = destinationLongitude
        
        let regionDistance:CLLocationDistance = 1000
        let coordinates = CLLocationCoordinate2D(latitude: la,longitude: lo)
        
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey : NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey : NSValue(mkCoordinateSpan : regionSpan.span)]
        
        
        let placemarker = MKPlacemark(coordinate : coordinates)
        
        let mapItem = MKMapItem(placemark : placemarker)
        mapItem.name = DesitnationName
        mapItem.openInMaps(launchOptions: options)
    
	}

}


extension ViewController: GMSAutocompleteViewControllerDelegate {
	
	func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
		print("Error \(error)")
	}
	
	func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
		
        let camera = GMSCameraPosition.camera(withLatitude: place.coordinate.latitude, longitude: place.coordinate.longitude, zoom: 16.0)
		
		if locationSelected == .startLocation {
			startLocation.text = "\(place.coordinate.latitude), \(place.coordinate.longitude)"
			locationStart = CLLocation(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
			createMarker(titleMarker: "Location Start", iconMarker: #imageLiteral(resourceName: "mapspin"), latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
		} else {
			destinationLocation.text = "\(place.coordinate.latitude), \(place.coordinate.longitude)"
			locationEnd = CLLocation(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
			createMarker(titleMarker: "Location End", iconMarker: #imageLiteral(resourceName: "mapspin"), latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
		}
		
		
		self.googleMaps.camera = camera
		self.dismiss(animated: true, completion: nil)
	}
	
	func wasCancelled(_ viewController: GMSAutocompleteViewController) {
		self.dismiss(animated: true, completion: nil)
	}
	
	func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
		UIApplication.shared.isNetworkActivityIndicatorVisible = true
	}
	
	func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
		UIApplication.shared.isNetworkActivityIndicatorVisible = false
	}
}

