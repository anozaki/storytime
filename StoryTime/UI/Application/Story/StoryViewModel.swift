//
// Created by Akito Nozaki on 3/13/18.
// Copyright (c) 2018 Ikazone. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class StoryViewModel: ViewModelCore {
    public enum Action {
        case close
        case story(Story)
    }
    
    private let _action = PublishSubject<Action>()
    public var action: Observable<Action> {
        get {
            return _action.asObservable()
        }
    }
    
    public let stories = Variable([Story]())
    
    public override init() {
        stories.value = [
            Story(title: "Three Little Pig", image: UIImage(named: "three-little-pig-1")!, print: [
                UIImage(named: "three-little-pig-1")!,
                UIImage(named: "three-little-pig-2")!,
                UIImage(named: "three-little-pig-3")!
            ], assetKey: "ThreeLittlePig", sticker: [
                "mushroom", "three-little-robot", "Big Bad Wolf", "Blowing Wolf", "First Little Pig", "House Of Straws", "house_small", "house", "Last Little Pig", "Middle Little Pig"
            ]),
            Story(title: "", image: UIImage(named: "three-robot-friend")!, print: [
                UIImage(named: "three-robot-friend")!
            ], assetKey: "ThreeLittlePig", sticker: [
                "dragon", "house_small", "house", "tree", "shark", "plain",
            ])
        ]
    }
    
    public func onSelect(_ story: Story) {
        _action.onNext(.story(story))
    }
    
    public func onClose() {
        _action.onNext(.close)
    }
    
}
