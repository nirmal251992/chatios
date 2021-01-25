//
//  MessageStore.swift
//  ChatSample
//
//  Created by Hafiz on 20/09/2019.
//  Copyright © 2019 Nibs. All rights reserved.
//

import Foundation

struct MessageStore {
    static func getAll() -> [Message] {
        return [
            Message(msg: "Lorem ipsum dolor sit amet", isUser: true),
            Message(msg: "Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",isUser: false),
            Message(msg: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae", isUser: true),
            Message(msg: "Hello", isUser: true)
            
        ]
    }
}
