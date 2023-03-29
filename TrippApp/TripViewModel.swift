import UIKit

class TripViewModel {
    
    let tripName: String
    let tripDestination: String
    var tripDuration: String
    
    init(trip: Trip) {
        self.tripName = trip.name
        self.tripDestination = trip.destination
        self.tripDuration = ""
        
        let duration = generateRandomDuration()
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day]
        formatter.unitsStyle = .full
        self.tripDuration = formatter.string(from: duration) ?? "Unknown duration"
    }
    
    func generateRandomDuration() -> TimeInterval {
        let minDuration = 3 * 24 * 60 * 60 // 3 dias em segundos
        let maxDuration = 30 * 24 * 60 * 60 // 30 dias em segundos
        let randomDuration = TimeInterval(arc4random_uniform(UInt32(maxDuration - minDuration))) + TimeInterval(minDuration)
        return randomDuration
    }
    
}

