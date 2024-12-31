//
//  ListsViewModel.swift
//  AppCopyCenter
//
//  Created by IGOR on 31/12/2024.
//

import SwiftUI
import CoreData

final class ListsViewModel: ObservableObject {

    @Published var fileTypes: [String] = ["PDF", "EPS", "JPG", "TIFF", "PNG", "ZIP", "PSD", "INDD"]
    @Published var curPFT = ""
    @Published var curDF = ""
    
    @Published var ckeck: [String] = ["Print File", "Check Text", "Check Image", "Add Text", "Add Image"]
    @Published var curCkeck = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false

    @Published var chName: String = ""
    @Published var chPFT: String = ""
    @Published var chDF: String = ""
    @Published var chCL: String = ""
    @Published var chDate: Date = Date()

    @Published var lists: [CheckModel] = []
    @Published var selectedList: CheckModel?

    func addList() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CheckModel", into: context) as! CheckModel

        loan.chName = chName
        loan.chPFT = chPFT
        loan.chDF = chDF
        loan.chCL = chCL
        loan.chDate = chDate

        CoreDataStack.shared.saveContext()
    }

    func fetchLists() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CheckModel>(entityName: "CheckModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.lists = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.lists = []
        }
    }
 
}
