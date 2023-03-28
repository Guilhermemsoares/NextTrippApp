import Foundation
import UIKit

class TripViewModel {
    
    let tripName: String
    let tripDestination: String
    let tripDuration: String
    
    init(trip: Trip) {
        tripName = trip.name
        tripDestination = trip.destination
        tripDuration = "\(trip.startDate) - \(trip.endDate)"
    }
    
}

