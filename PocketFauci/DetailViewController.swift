//
//  DetailViewController.swift
//  PocketFauci
//
//  Created by John Gallaugher on 11/23/20.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var stateImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positiveLabel: UILabel!
    @IBOutlet weak var currentHospLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    
    var stateData: StateData!
    var stateAbbreviations = ["AL": "alabama",
                              "AK": "alaska",
                              "AS": "american-samoa",
                              "AZ": "arizona",
                              "AR": "arkansas",
                              "CA": "california",
                              "CO": "colorado",
                              "CT": "connecticut",
                              "DC": "washington-dc",
                              "DE": "delaware",
                              "FL": "florida",
                              "GA": "georgia",
                              "GU": "guam",
                              "HI": "hawaii",
                              "ID": "idaho",
                              "IL": "illinois",
                              "IN": "indiana",
                              "IA": "iowa",
                              "KS": "kansas",
                              "KY": "kentucky",
                              "LA": "louisiana",
                              "ME": "maine",
                              "MD": "maryland",
                              "MA": "massachusetts",
                              "MI": "michigan",
                              "MN": "minnesota",
                              "MS": "mississippi",
                              "MO": "missouri",
                              "MP": "mariana-islands",
                              "MT": "montana",
                              "NE": "nebraska",
                              "NV": "nevada",
                              "NH": "new-hampshire",
                              "NJ": "new-jersey",
                              "NM": "new-mexico",
                              "NY": "new-york",
                              "NC": "north-carolina",
                              "ND": "north-dakota",
                              "OH": "ohio",
                              "OK": "oklahoma",
                              "OR": "oregon",
                              "PA": "pennsylvania",
                              "RI": "rhode-island",
                              "SC": "south-carolina",
                              "SD": "south-dakota",
                              "TN": "tennessee",
                              "TX": "texas",
                              "UT": "utah",
                              "VT": "vermont",
                              "VA": "virginia",
                              "VI": "us-virgin-islands",
                              "WA": "washington",
                              "WV": "west-virginia",
                              "WI": "wisconsin",
                              "WY": "wyoming"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if stateData == nil {
            stateData = StateData()
        }
        
        var stateName = stateAbbreviations[stateData.state] ?? ""
        stateName = stateName.capitalized
        stateName = stateName.replacingOccurrences(of: "-", with: " ")
        stateName = stateName.replacingOccurrences(of: "Dc", with: "DC")
        
        nameLabel.text = stateName
        positiveLabel.text = formatNumberWithCommas(number: stateData.positive)
        currentHospLabel.text = formatNumberWithCommas(number: stateData.hospitalizedCurrently ?? 0)
        deathsLabel.text = formatNumberWithCommas(number: stateData.death)
        
        let stateString = stateAbbreviations[stateData.state] ?? ""
        let imageURLString = "https://cdn.civil.services/us-states/maps/\(stateString)-large.png"
        print("** imageURLString = \(imageURLString)")
        
        guard let url = URL(string: imageURLString) else {
            print("Couldn't get a valid URL from \(imageURLString)")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            stateImageView.image = UIImage(data: data)
        } catch {
            print("ERROR: error thrown trying to get image from url \(url)")
        }
    }
    
    func formatNumberWithCommas(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: number)) else { return "" }
        return "\(formattedNumber)"
    }

}
