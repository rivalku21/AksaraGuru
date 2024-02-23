//
//  MainTestViewModel.swift
//  skripsi
//
//  Created by Rival Fauzi on 18/01/24.
//

import Foundation

class MainTestViewModel: ObservableObject {
    var levelOneQuestion: [TestLevelOneModel] = []
//    @Published var specificQuestion: [TestLevelOneModel] = []
    
    init() {
        let jsonData = readLocalJSONFile(forName: "level1")
        
        if let data = jsonData {
            if let record = testLevelOneParse(jsonData: data) {
                levelOneQuestion.append(contentsOf: record)
            }
        }
    }
    
    func generateQuestion(aksara: [String]) -> [TestLevelOneModel] {
        var questions: [TestLevelOneModel] = []
        
        for char in aksara {
            questions.append(contentsOf: levelOneQuestion.filter({ $0.characterString == String(char) }))
        }
        
        var result: [TestLevelOneModel] = []
        
        let shuffledArray = questions.shuffled()
        
        for i in 0..<7 {
            result.append(shuffledArray[i])
        }
        
//        specificQuestion = result
        return result
    }
}
