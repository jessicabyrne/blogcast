//
//  BlogParser.swift
//  Landmarks
//
//  Created by Jessica Byrne on 11/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct RSSItem {
    var title: String
    var description: String
    var pubDate: String
}

// download xml from a server
// parse xml to foundation objects

class BlogParser: NSObject, XMLParserDelegate {
    enum Error: Swift.Error {
        case invalidResponse
    }
    
    typealias BlogParserCompletion = (Result<[RSSItem], Swift.Error>) -> Void
    
    private var rssItems: [RSSItem] = []
    private var currentElement = ""

    private var currentTitle: String = "" {
        didSet {
            currentTitle = currentTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    private var currentDescription: String = "" {
        didSet {
            currentDescription = currentDescription.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    private var currentPubDate: String = "" {
        didSet {
            currentPubDate = currentPubDate.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    private var parserCompletionHandler: BlogParserCompletion?

    func parseFeed(url: String, completion: @escaping BlogParserCompletion)
    {
        self.parserCompletionHandler = completion

        let request = URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(.failure(error ?? Error.invalidResponse))
                return
            }

            /// parse our xml data
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
        }

        task.resume()
    }

    // MARK: - XML Parser Delegate

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:])
    {
        currentElement = elementName
        if currentElement == "item" {
            currentTitle = ""
            currentDescription = ""
            currentPubDate = ""
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        switch currentElement {
        case "title": currentTitle += string
        case "description" : currentDescription += string
        case "pubDate" : currentPubDate += string
        default: break
        }
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if elementName == "item" {
            let rssItem = RSSItem(title: currentTitle, description: currentDescription, pubDate: currentPubDate)
            self.rssItems.append(rssItem)
        }
    }

    func parserDidEndDocument(_ parser: XMLParser) {
        parserCompletionHandler?(.success(rssItems))
    }

    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Swift.Error)
    {
        print(parseError.localizedDescription)
        parserCompletionHandler?(.failure(parseError))
    }

}
