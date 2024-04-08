//
//  Array+String+extensions.swift
//  effectmob
//
//  Created by Дмитрий Гусев on 08.04.24.
//

extension Array where Element == String {
    func capitalizedSentence() -> String {
        self.map{
            sentence in
            var words = sentence.split(separator: " ")
            if let firstWord = words.first {
                words[0] = Substring(firstWord.capitalized)
            }
            return words.joined(separator: " ")
        }.joined(separator: ", ")
    }
}
