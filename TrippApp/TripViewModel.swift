import Foundation
import UIKit

class TripViewModel {
    
    let trip: Trip
    
    init(trip: Trip) {
        self.trip = trip
    }
    
    var tripName: String {
        return trip.name
    }
    
    var tripDestination: String {
        return trip.destination
    }
    
    var tripDuration: String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.day, .hour, .minute]
        formatter.zeroFormattingBehavior = .dropAll
        let duration = trip.endDate.timeIntervalSince(trip.startDate)
        return formatter.string(from: duration) ?? "Unknown duration"
    }
}


