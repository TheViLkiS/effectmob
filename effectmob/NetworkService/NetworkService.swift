//
//  NetworkService.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 07.04.24.
//

import Foundation

final class NetworkService {
    static func fetchData() -> JobSearchData? {
                
        if let url = Bundle.main.url(forResource: "dataFromServer", withExtension: "json") {
                    do {
                        let data = try Data(contentsOf: url)
                        let decoder = JSONDecoder()
                        let jsonData = try decoder.decode(JobSearchData.self, from: data)
                        return jsonData
                    } catch {
                        print("Ошибка при загрузке данных: \(error)")
                    }
                } else {
                    print("Не удалось найти файл")
                }
        return nil
    }
}