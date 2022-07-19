//
//  ProfileViewModel.swift
//  Navigation
//
//  Created by Suharik on 17.07.2022.
//

import Foundation
import StorageService
import UIKit

final class ProfileViewModel {
    public var posts = [Post (author: "Finn",
                              description: "Super cool post p.1",
                              image: UIImage(named: "Finn")!,
                              likes: 200,
                              views: 4000),
                        Post (author: "Jake",
                              description: "Super cool post p.2",
                              image: UIImage(named: "Jake")!,
                              likes: 1000,
                              views: 5000),
                        Post (author: "Princess",
                              description: "Super cool post p.3",
                              image: UIImage(named: "Princess")!,
                              likes: 150,
                              views: 6000),
                        Post (author: "BMO",
                              description: "Super cool post p.4",
                              image: UIImage(named: "BMO")!,
                              likes: 10,
                              views: 300)]
    
    func numberOfRows() -> Int {
        return posts.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> PostTableViewCellViewModel? {
        let post = posts[indexPath.row]
        return PostTableViewCellViewModel(post: post)
    }
}
