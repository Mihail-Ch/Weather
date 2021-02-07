//
//  WeatherService.swift
//  Weather
//
//  Created by Михаил Чертов on 07.02.2021.
//

import Foundation
import Alamofire

class WeatherService {
    let baseUrl = "http://api.openweathermap.org"
    // ключ для доступа к сервису
    let apiKey =  "d86496b67dfb6a70d0e2a10123dcceab"
    
    // метод для загрузки данных, в качестве аргументов получает город
    func loadWeatherData(city: String) {
        // путь для получения погоды за 5 дней
        let path = "/data/2.5/forecast"
        // параметры, город, единицы измерения градусы, ключ для доступа к сервису
        let parameters: Parameters = [
            "q": city,
            "units": "metric",
            "appid": apiKey
        ]
        
        // составляем URL из базового адреса сервиса и конкретного пути к ресурсу
        let url = baseUrl + path
        
        // делаем запрос
        AF.request(url, parameters: parameters).responseJSON { (response) in
            print(response.value as Any)
        }

        

        

    }

    

    
}
// базовый URL сервиса
