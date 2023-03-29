import UIKit

class ViewController: UIViewController {
    
    let nameLabel = UILabel()
    let destinationLabel = UILabel()
    let durationLabel = UILabel()
    let button = UIButton(type: .system)
    var viewModel: TripViewModel?
    let backgroundImageView = UIImageView()
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = UIColor.black
        
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundImageView, at: 0)
        
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backgroundImageView.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let darkOverlay = UIView(frame: view.bounds)
        darkOverlay.backgroundColor = UIColor.black.withAlphaComponent(0.5) // ajuste a opacidade aqui
        backgroundImageView.addSubview(darkOverlay)

        
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        destinationLabel.font = UIFont.systemFont(ofSize: 40)
        destinationLabel.textAlignment = .center
        destinationLabel.numberOfLines = 0
        destinationLabel.textColor = .white
        destinationLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(destinationLabel)
        
        durationLabel.font = UIFont.systemFont(ofSize: 40)
        durationLabel.textAlignment = .center
        durationLabel.textColor = .white
        durationLabel.numberOfLines = 0
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(durationLabel)
        
        button.setTitle("Descubra sua próxima viagem!", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.sizeToFit()
        button.addTarget(self, action: #selector(generateRandomTrip(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowRadius = 3
        view.addSubview(button)
        
    
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            
            destinationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            destinationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            
            durationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            durationLabel.topAnchor.constraint(equalTo: destinationLabel.bottomAnchor, constant: 20),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 50),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    @objc func generateRandomTrip(_ sender: UIButton) {
        let trip = Trip(name: "Você vai para...", destination: generateRandomDestination(), startDate: Date(), endDate: Date().addingTimeInterval(7 * 24 * 60 * 60))
        viewModel = TripViewModel(trip: trip)
        updateUI()
    }
    
    private func updateUI() {
        guard let viewModel = viewModel else { return }
        nameLabel.text = viewModel.tripName
        destinationLabel.text = viewModel.tripDestination
        durationLabel.text = "Durante " + viewModel.tripDuration
        
        setBackgroundImageForDestination(destination: viewModel.tripDestination)
    }


    private func generateRandomDestination() -> String {
        let destinations = ["Paris", "New York", "Sydney", "Tokyo", "Rio de Janeiro", "Cape Town", "Salvador", "Ibiza"]
        return destinations.randomElement() ?? "Unknown destination"
    }
    
    private func setBackgroundImageForDestination(destination: String) {
        if destination == "Paris", let image = UIImage(named: "Paris") {
            backgroundImageView.image = image
        } else if destination == "New York", let image = UIImage(named: "Ny") {
            backgroundImageView.image = image
        } else if destination == "Sydney", let image = UIImage(named: "Sidney") {
            backgroundImageView.image = image
        } else if destination == "Cape Town", let image = UIImage(named: "Cape") {
            backgroundImageView.image = image
        } else if destination == "Ibiza", let image = UIImage(named: "Ibiza") {
            backgroundImageView.image = image
        } else if destination == "Salvador", let image = UIImage(named: "Salvador") {
            backgroundImageView.image = image
        } else if destination == "Tokyo", let image = UIImage(named: "Tokyo") {
            backgroundImageView.image = image
        } else if destination == "Rio de Janeiro", let image = UIImage(named: "Rio") {
            backgroundImageView.image = image
        } else {
            backgroundImageView.image = nil // remove a imagem de fundo
        }
    }
    
    }

