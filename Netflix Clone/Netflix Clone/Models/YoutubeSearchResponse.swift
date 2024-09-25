//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by constantine Walker on 25.09.24.
//

import Foundation

//items =     (
//            {
//        etag = SOMBRRFgUtYoAYDxgdV0c9ModzU;
//        id =             {
//            kind = "youtube#video";
//            videoId = YgqozibcfwI;
//        };
//        kind = "youtube#searchResult";
//    },


struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
