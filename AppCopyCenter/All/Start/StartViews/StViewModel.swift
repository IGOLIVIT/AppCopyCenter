//
//  StViewModel.swift
//  AppCopyCenter
//
//  Created by IGOR on 31/12/2024.
//

import SwiftUI

final class StViewModel: ObservableObject {
    
    @AppStorage("status") var status: Bool = false
    
    @Published var addName: String = ""

    @Published var typeProf: [String] = ["Yes", "No"]
    @Published var curProf = ""
    
    @Published var typesEntity: [String] = ["Individual", "Legal"]
    @Published var curEnt = ""
    
    @Published var oftenPrints: [String] = ["Once a week", "Once a month", "Once a year", "Other"]
    @Published var curOften = ""
    
    @Published var cameras: [String] = ["Digital camera", "Film camera", "Polaroid", "Other"]
    @Published var curCam = ""
    
    @Published var materials: [String] = ["Postcards", "Posters", "Albums", "Gifts"]
    @Published var curMat = ""
    
    @AppStorage("motoType") var motoType: String = ""
}
