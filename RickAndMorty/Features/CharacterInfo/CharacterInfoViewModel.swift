//
//  CharacterInfoViewModel.swift
//  RickAndMorty
//
//  Created by Peterses on 17/03/2021.
//

import Foundation

protocol CharacterInfoViewModelDelegate: AnyObject {
    func didLoadCharacterModel()
}

protocol CharacterInfoViewModelProtocol {
    var delegate: CharacterInfoViewModelDelegate? { get set }
    
    var characterModel: CharacterModel? { get set }
    
    func fetchData()
}

class CharacterInfoViewModel: CharacterInfoViewModelProtocol {
    var delegate: CharacterInfoViewModelDelegate?
    
    private let dataFetcher = DataFetcher()
    private let id: Int
    
    var characterModel: CharacterModel?
    
    init(id: Int) {
        self.id = id
    }
    
    
    func fetchData() {
//        let dispatchGroup = DispatchGroup()
//        dispatchGroup.enter()
//        dispatchGroup.leave()
//
//        dispatchGroup.notify(queue: .main) {
//            print("")
//        }
//
        dataFetcher.fetchCharacterModel(id: id) { [weak self] (characterModel, error) in
            guard let self = self else { return }

            if let characterModel = characterModel {
                self.characterModel = characterModel
                
                self.delegate?.didLoadCharacterModel()
                
                
                // MyUserDefaults.requestReviewCounter = 12
                
               // let cos = MyUserDefaults.requestReviewCounter
            }
        }
    }
}



// USER DEFAULTS

//import Foundation
//
//struct MyUserDefaults {
//    @PropertyStorage(key: .requestReviewCounter, defaultValue: nil)
//    static var requestReviewCounter: Int?
//
//    @PropertyStorage(key: .notificationAllowed, defaultValue: "")
//    static var notificationAllowed: String
//
//    @PropertyStorage(key: .wasAskedForNotidicarion, defaultValue: false)
//    static var wasAskedForNotidicarion: Bool
//
//    @PropertyStorage(key: .breatheDayShownIds, defaultValue: [])
//    static var breatheDayShownIds: [Int]
//
//    @PropertyStorage(key: .didDoneRecommendationTrackAt, defaultValue: nil)
//    static var didDoneRecommendationTrackAt: Date?
//
//}
//
//@propertyWrapper
//struct PropertyStorage<T> {
//
//    private let key: StorageKey
//    private let defaultValue: T
//
//    init(key: StorageKey, defaultValue: T) {
//        self.key = key
//        self.defaultValue = defaultValue
//    }
//
//    var wrappedValue: T {
//        get {
//            return UserDefaults.standard.object(forKey: key.rawValue) as? T ?? defaultValue
//        }
//        set {
//            UserDefaults.standard.set(newValue, forKey: key.rawValue)
//        }
//    }
//}
//
//enum StorageKey: String {
//    case requestReviewCounter = "request_review_counter"
//    case ratingStoreKitWasOpened = "rating_store_kit_was_opened"
//    case notificationAllowed = "notification_allowed"
//    case wasAskedForNotidicarion = "was_asked_for_notidicarion"
//
//    case breatheDayShownIds = "power_up_breathonic_shown_ids"
//    case breatheNightContentShownIds = "power_up_longformContent_shown_ids"
//    case napShownIds = "power_down_breathonic_shown_ids"
//    case cardsClickedIds = "card_clicked_ids"
//    case tracksSuccededCounter = "tracks_succeded_counter"
//
//    case referralUUID = "referralUUID"
//    case referralReferrer = "referral_referrer"
//    case didDoneRecommendationTrackAt = "didDoneRecommendationTrackAt"
//}

