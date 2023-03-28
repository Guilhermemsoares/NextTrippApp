import UIKit

class ViewController: UIViewController {

    let nameLabel = UILabel()
    let destinationLabel = UILabel()
    let durationLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let trip = Trip(name: "Próxima Viagem", destination: "Cancun", startDate: Date(), endDate: Date().addingTimeInterval(7 * 24 * 60 * 60))
        let viewModel = TripViewModel(trip: trip)
        
        nameLabel.text = viewModel.tripName
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nameLabel)
        
        destinationLabel.text = viewModel.tripDestination
        destinationLabel.font = UIFont.systemFont(ofSize: 20)
        destinationLabel.textAlignment = .left
        destinationLabel.numberOfLines = 0
        destinationLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(destinationLabel)
        
        durationLabel.text = viewModel.tripDuration
        durationLabel.font = UIFont.systemFont(ofSize: 10)
        durationLabel.textAlignment = .left
        durationLabel.numberOfLines = 0
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(durationLabel)
        
        
        
        
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            destinationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            destinationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            
            durationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            durationLabel.topAnchor.constraint(equalTo: destinationLabel.bottomAnchor, constant: 20),
        ])
    }

}




