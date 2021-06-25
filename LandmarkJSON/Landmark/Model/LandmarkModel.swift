//
//  Created by Artur Lutfullin on 25/06/2021.
//

/// Модель данных, описывающая ...
struct LandmarkModel: UniqueIdentifiable {
    // Example
    let uid: UniqueIdentifier
    let name: String
}

extension LandmarkModel: Equatable {
    static func == (lhs: LandmarkModel, rhs: LandmarkModel) -> Bool {
        return lhs.uid == rhs.uid
    }
}
