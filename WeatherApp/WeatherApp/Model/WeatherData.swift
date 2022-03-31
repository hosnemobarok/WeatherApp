//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Md Hosne Mobarok on 31/3/22.
//

import Foundation

// MARK: - Welcome
class Weather: Codable {
    let forecast: Forecast?
    let current: Current?
    let location: Location?

    init(forecast: Forecast?, current: Current?, location: Location?) {
        self.forecast = forecast
        self.current = current
        self.location = location
    }
}

// MARK: - Current
class Current: Codable {
    let precipMm: Double?
    let isDay: Int?
    let windMph: Double?
    let windDegree: Int?
    let windKph: Double?
    let uv: Int?
    let tempF: Double?
    let visKM: Int?
    let feelslikeF, tempC, gustMph: Double?
    let condition: Condition?
    let feelslikeC: Double?
    let windDir: String?
    let precipIn: Double?
    let visMiles, cloud: Int?
    let lastUpdated: String?
    let gustKph: Double?
    let lastUpdatedEpoch, humidity, pressureMB: Int?
    let pressureIn: Double?

    enum CodingKeys: String, CodingKey {
        case precipMm = "precip_mm"
        case isDay = "is_day"
        case windMph = "wind_mph"
        case windDegree = "wind_degree"
        case windKph = "wind_kph"
        case uv
        case tempF = "temp_f"
        case visKM = "vis_km"
        case feelslikeF = "feelslike_f"
        case tempC = "temp_c"
        case gustMph = "gust_mph"
        case condition
        case feelslikeC = "feelslike_c"
        case windDir = "wind_dir"
        case precipIn = "precip_in"
        case visMiles = "vis_miles"
        case cloud
        case lastUpdated = "last_updated"
        case gustKph = "gust_kph"
        case lastUpdatedEpoch = "last_updated_epoch"
        case humidity
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
    }

    init(precipMm: Double?, isDay: Int?, windMph: Double?, windDegree: Int?, windKph: Double?, uv: Int?, tempF: Double?, visKM: Int?, feelslikeF: Double?, tempC: Double?, gustMph: Double?, condition: Condition?, feelslikeC: Double?, windDir: String?, precipIn: Double?, visMiles: Int?, cloud: Int?, lastUpdated: String?, gustKph: Double?, lastUpdatedEpoch: Int?, humidity: Int?, pressureMB: Int?, pressureIn: Double?) {
        self.precipMm = precipMm
        self.isDay = isDay
        self.windMph = windMph
        self.windDegree = windDegree
        self.windKph = windKph
        self.uv = uv
        self.tempF = tempF
        self.visKM = visKM
        self.feelslikeF = feelslikeF
        self.tempC = tempC
        self.gustMph = gustMph
        self.condition = condition
        self.feelslikeC = feelslikeC
        self.windDir = windDir
        self.precipIn = precipIn
        self.visMiles = visMiles
        self.cloud = cloud
        self.lastUpdated = lastUpdated
        self.gustKph = gustKph
        self.lastUpdatedEpoch = lastUpdatedEpoch
        self.humidity = humidity
        self.pressureMB = pressureMB
        self.pressureIn = pressureIn
    }
}

// MARK: - Condition
class Condition: Codable {
    let code: Int?
    let text, icon: String?

    init(code: Int?, text: String?, icon: String?) {
        self.code = code
        self.text = text
        self.icon = icon
    }
}

// MARK: - Forecast
class Forecast: Codable {
    let forecastday: [Forecastday]?

    init(forecastday: [Forecastday]?) {
        self.forecastday = forecastday
    }
}

// MARK: - Forecastday
class Forecastday: Codable {
    let dateEpoch: Int?
    let hour: [Hour]?
    let astro: Astro?
    let date: String?
    let day: Day?

    enum CodingKeys: String, CodingKey {
        case dateEpoch = "date_epoch"
        case hour, astro, date, day
    }

    init(dateEpoch: Int?, hour: [Hour]?, astro: Astro?, date: String?, day: Day?) {
        self.dateEpoch = dateEpoch
        self.hour = hour
        self.astro = astro
        self.date = date
        self.day = day
    }
}

// MARK: - Astro
class Astro: Codable {
    let sunrise, moonset, moonPhase, sunset: String?
    let moonIllumination, moonrise: String?

    enum CodingKeys: String, CodingKey {
        case sunrise, moonset
        case moonPhase = "moon_phase"
        case sunset
        case moonIllumination = "moon_illumination"
        case moonrise
    }

    init(sunrise: String?, moonset: String?, moonPhase: String?, sunset: String?, moonIllumination: String?, moonrise: String?) {
        self.sunrise = sunrise
        self.moonset = moonset
        self.moonPhase = moonPhase
        self.sunset = sunset
        self.moonIllumination = moonIllumination
        self.moonrise = moonrise
    }
}

// MARK: - Day
class Day: Codable {
    let maxtempF, totalprecipMm, mintempF: Double?
    let uv: Int?
    let avgtempF: Double?
    let dailyChanceOfSnow: Int?
    let mintempC, maxtempC, maxwindKph: Double?
    let dailyWillItRain, avgvisMiles, dailyChanceOfRain: Int?
    let condition: Condition?
    let avghumidity, dailyWillItSnow: Int?
    let avgtempC, totalprecipIn, maxwindMph, avgvisKM: Double?

    enum CodingKeys: String, CodingKey {
        case maxtempF = "maxtemp_f"
        case totalprecipMm = "totalprecip_mm"
        case mintempF = "mintemp_f"
        case uv
        case avgtempF = "avgtemp_f"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case mintempC = "mintemp_c"
        case maxtempC = "maxtemp_c"
        case maxwindKph = "maxwind_kph"
        case dailyWillItRain = "daily_will_it_rain"
        case avgvisMiles = "avgvis_miles"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case condition, avghumidity
        case dailyWillItSnow = "daily_will_it_snow"
        case avgtempC = "avgtemp_c"
        case totalprecipIn = "totalprecip_in"
        case maxwindMph = "maxwind_mph"
        case avgvisKM = "avgvis_km"
    }

    init(maxtempF: Double?, totalprecipMm: Double?, mintempF: Double?, uv: Int?, avgtempF: Double?, dailyChanceOfSnow: Int?, mintempC: Double?, maxtempC: Double?, maxwindKph: Double?, dailyWillItRain: Int?, avgvisMiles: Int?, dailyChanceOfRain: Int?, condition: Condition?, avghumidity: Int?, dailyWillItSnow: Int?, avgtempC: Double?, totalprecipIn: Double?, maxwindMph: Double?, avgvisKM: Double?) {
        self.maxtempF = maxtempF
        self.totalprecipMm = totalprecipMm
        self.mintempF = mintempF
        self.uv = uv
        self.avgtempF = avgtempF
        self.dailyChanceOfSnow = dailyChanceOfSnow
        self.mintempC = mintempC
        self.maxtempC = maxtempC
        self.maxwindKph = maxwindKph
        self.dailyWillItRain = dailyWillItRain
        self.avgvisMiles = avgvisMiles
        self.dailyChanceOfRain = dailyChanceOfRain
        self.condition = condition
        self.avghumidity = avghumidity
        self.dailyWillItSnow = dailyWillItSnow
        self.avgtempC = avgtempC
        self.totalprecipIn = totalprecipIn
        self.maxwindMph = maxwindMph
        self.avgvisKM = avgvisKM
    }
}

// MARK: - Hour
class Hour: Codable {
    let heatindexC: Double?
    let visKM: Int?
    let feelslikeC, dewpointC: Double?
    let timeEpoch: Int?
    let precipIn: Double?
    let condition: Condition?
    let pressureMB, uv, willItSnow: Int?
    let feelslikeF, windchillC, tempF: Double?
    let humidity, chanceOfSnow: Int?
    let windDir: String?
    let gustKph, pressureIn, tempC: Double?
    let windDegree: Int?
    let dewpointF: Double?
    let isDay, chanceOfRain, cloud: Int?
    let windKph, windMph: Double?
    let willItRain: Int?
    let heatindexF, windchillF, gustMph, precipMm: Double?
    let visMiles: Int?
    let time: String?

    enum CodingKeys: String, CodingKey {
        case heatindexC = "heatindex_c"
        case visKM = "vis_km"
        case feelslikeC = "feelslike_c"
        case dewpointC = "dewpoint_c"
        case timeEpoch = "time_epoch"
        case precipIn = "precip_in"
        case condition
        case pressureMB = "pressure_mb"
        case uv
        case willItSnow = "will_it_snow"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case tempF = "temp_f"
        case humidity
        case chanceOfSnow = "chance_of_snow"
        case windDir = "wind_dir"
        case gustKph = "gust_kph"
        case pressureIn = "pressure_in"
        case tempC = "temp_c"
        case windDegree = "wind_degree"
        case dewpointF = "dewpoint_f"
        case isDay = "is_day"
        case chanceOfRain = "chance_of_rain"
        case cloud
        case windKph = "wind_kph"
        case windMph = "wind_mph"
        case willItRain = "will_it_rain"
        case heatindexF = "heatindex_f"
        case windchillF = "windchill_f"
        case gustMph = "gust_mph"
        case precipMm = "precip_mm"
        case visMiles = "vis_miles"
        case time
    }

    init(heatindexC: Double?, visKM: Int?, feelslikeC: Double?, dewpointC: Double?, timeEpoch: Int?, precipIn: Double?, condition: Condition?, pressureMB: Int?, uv: Int?, willItSnow: Int?, feelslikeF: Double?, windchillC: Double?, tempF: Double?, humidity: Int?, chanceOfSnow: Int?, windDir: String?, gustKph: Double?, pressureIn: Double?, tempC: Double?, windDegree: Int?, dewpointF: Double?, isDay: Int?, chanceOfRain: Int?, cloud: Int?, windKph: Double?, windMph: Double?, willItRain: Int?, heatindexF: Double?, windchillF: Double?, gustMph: Double?, precipMm: Double?, visMiles: Int?, time: String?) {
        self.heatindexC = heatindexC
        self.visKM = visKM
        self.feelslikeC = feelslikeC
        self.dewpointC = dewpointC
        self.timeEpoch = timeEpoch
        self.precipIn = precipIn
        self.condition = condition
        self.pressureMB = pressureMB
        self.uv = uv
        self.willItSnow = willItSnow
        self.feelslikeF = feelslikeF
        self.windchillC = windchillC
        self.tempF = tempF
        self.humidity = humidity
        self.chanceOfSnow = chanceOfSnow
        self.windDir = windDir
        self.gustKph = gustKph
        self.pressureIn = pressureIn
        self.tempC = tempC
        self.windDegree = windDegree
        self.dewpointF = dewpointF
        self.isDay = isDay
        self.chanceOfRain = chanceOfRain
        self.cloud = cloud
        self.windKph = windKph
        self.windMph = windMph
        self.willItRain = willItRain
        self.heatindexF = heatindexF
        self.windchillF = windchillF
        self.gustMph = gustMph
        self.precipMm = precipMm
        self.visMiles = visMiles
        self.time = time
    }
}

// MARK: - Location
class Location: Codable {
    let localtimeEpoch: Int?
    let lat: Double?
    let localtime, country: String?
    let lon: Double?
    let tzID, name, region: String?

    enum CodingKeys: String, CodingKey {
        case localtimeEpoch = "localtime_epoch"
        case lat, localtime, country, lon
        case tzID = "tz_id"
        case name, region
    }

    init(localtimeEpoch: Int?, lat: Double?, localtime: String?, country: String?, lon: Double?, tzID: String?, name: String?, region: String?) {
        self.localtimeEpoch = localtimeEpoch
        self.lat = lat
        self.localtime = localtime
        self.country = country
        self.lon = lon
        self.tzID = tzID
        self.name = name
        self.region = region
    }
}
