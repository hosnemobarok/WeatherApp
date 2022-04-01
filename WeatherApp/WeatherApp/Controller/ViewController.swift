//
//  ViewController.swift
//  WeatherApp
//
//  Created by Md Hosne Mobarok on 31/3/22.
//
//Temperature

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var highTemperature: UILabel!
    @IBOutlet weak var lowTemperature: UILabel!
    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cvBackgroundView: UIView!
    @IBOutlet weak var tvBackgroundView: UIView!
        
    var rest = RestManager()
    
    var forecastday = [Forecastday]()
    var hour = [Hour]()
    var days = ["Fri", "Sat", "Sun", "Mon", "Tue", "Web", "Thu"]
    var selectedDays = [String]()
    var todayIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        setupCollectionView()
        
        loadData()
    }
    
    func handleDays() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE"
        let dayInWeek = dateFormatter.string(from: date)
        
        if let index = days.firstIndex(of: dayInWeek) {
            todayIndex = index
        }
        
        for i in 0..<days.count {
            selectedDays.append(days[(todayIndex+i)/7])
        }

        print(dayInWeek)
    }

    // MARK: - Private Methods.
    func setupUI(){
        cvBackgroundView.layer.cornerRadius = 10
        tvBackgroundView.layer.cornerRadius = 10
    }
    
    func setupTableView() {
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.separatorColor = UIColor.black
    }
    
    func setupCollectionView() {
        let cvNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(cvNib, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
    }
    
    private func loadData() {
        
        guard let url = URL(string: Api.weatherApiUrl) else { return }
        rest.makeRequest(toURL: url, withHttpMethod: .get) { result in
            
            if result.error != nil {
                print("Got error with \(String(describing: result.error))")
                return
            }
            
            if let data = result.data {
                print("successful")
                print(data)
                
                do {
                    
                    let decoder = JSONDecoder()
                    let weather = try? decoder.decode(Weather.self, from: data)
                    
                    if let forecastday = weather?.forecast?.forecastday {
                        self.forecastday = forecastday
                        if let hour = forecastday[0].hour {
                            self.hour = hour
                        }
                    }
                    
                    DispatchQueue.main.async { [self] in
                        locationName.text = weather?.location?.name
            
                        guard let rainTemperature = weather?.forecast?.forecastday![0].day?.dailyChanceOfRain else { return}
                        temperature.text = "\(Int(rainTemperature))°"
                        
                        countryName.text = weather?.location?.country
                        guard let highTemp = weather?.current?.tempC else { return }
                        highTemperature.text = "H: \(Int(highTemp))°"
                        guard let lowTemp = weather?.current?.tempF else { return }
                        lowTemperature.text = "L: \(Int(lowTemp))°"
                        
                        self.collectionView.reloadData()
                        self.tableView.reloadData()

//                        locationName.text = data["location"]["name"].stringValue
//                        temperature.text = "\(String(data["location"]["lon"].intValue) + "°")"
//                        countryName.text = data["location"]["country"].stringValue
//                        highTemperature.text = "H: \(data["current"]["temp_c"].stringValue)°"
//                        lowTemperature.text = "L: \(data["current"]["temp_c"].stringValue)°"
                    }
                    
                }catch{
                    print("erroMsg", error)
                }
            }
        }
    }

}

// MARK: - CollectionView DataSource Methods.
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hour.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.timeLabel.text = hour[indexPath.row].time
        cell.temperatureLabel.text = String(Int(hour[indexPath.row].tempF!)) + "°"
        return cell
    }
}


// MARK: - TableView DataSource Methods.
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastday.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//        cell.dayName.text = forecastday[indexPath.row].day
        
        
//        cell.dayName.text = selectedDays[indexPath.row/7]
        
        cell.minimumTempF.text = (forecastday[indexPath.row].day?.mintempF?.toString())! + "°"
        cell.maximumTempF.text = (forecastday[indexPath.row].day?.maxtempF?.toString())! + "°"
        
        let progValue = forecastday[indexPath.row].day?.mintempF
        cell.progressBar.setProgress(Float(progValue!)/100, animated: true)
        return cell
    }
}

extension Double {
    func toString() -> String {
        return String(format: "%.0f",self)
    }
}
