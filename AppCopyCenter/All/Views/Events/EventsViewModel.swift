//
//  EventsViewModel.swift
//  AppCopyCenter
//
//  Created by IGOR on 31/12/2024.
//

import SwiftUI
import CoreData

final class EventsViewModel: ObservableObject {
    
    @AppStorage("sumTags") var sumTags: Int = 0
    @AppStorage("sumPosters") var sumPosters: Int = 0
    @AppStorage("sumBanners") var sumBanners: Int = 0
    @AppStorage("sumBooklets") var sumBooklets: Int = 0
    @AppStorage("sumMenus") var sumMenus: Int = 0
    @AppStorage("sumBrochures") var sumBrochures: Int = 0
    @AppStorage("sumNav") var sumNav: Int = 0

    @Published var tags: [String] = ["Posters", "Banners", "Booklet", "Brochure", "Menu", "Navigation signs"]
    @Published var currTag = ""
    
    @Published var checklists: [String] = ["Select size (A2, A3, Custom)", "Check Text", "Add Text", "Add Image"]
    @Published var currCL = ""
    
    @Published var PriceCheckLists: [String] = ["Select size (A2, A3, Custom)", "Check Text", "Add Text", "Add Image"]
    @Published var currPriceCkeckList = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false

    @Published var evName: String = ""
    @Published var evAddress: String = ""
    @Published var evMail: String = ""
    @Published var evDate: String = ""
    @Published var evTag: String = ""
    @Published var evCL: String = ""
    @Published var evPCL: String = ""
    @Published var evChImage: String = ""
    @Published var evAddImage: String = ""
    @Published var evAddText: String = ""
    @Published var evPSelSize: String = ""
    @Published var evPChText: String = ""
    @Published var evPAddText: String = ""
    @Published var evPAddIm: String = ""

    @Published var events: [EventsModel] = []
    @Published var selectedEvent: EventsModel?

    func addEvent() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "EventsModel", into: context) as! EventsModel

        loan.evName = evName
        loan.evAddress = evAddress
        loan.evMail = evMail
        loan.evDate = evDate
        loan.evTag = evTag
        loan.evCL = evCL
        loan.evPCL = evPCL
        loan.evChImage = evChImage
        loan.evAddImage = evAddImage
        loan.evAddText = evAddText
        loan.evPSelSize = evPSelSize
        loan.evPChText = evPChText
        loan.evPAddText = evPAddText
        loan.evPAddIm = evPAddIm

        CoreDataStack.shared.saveContext()
    }

    func fetchEvents() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<EventsModel>(entityName: "EventsModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.events = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.events = []
        }
    }
 
}
