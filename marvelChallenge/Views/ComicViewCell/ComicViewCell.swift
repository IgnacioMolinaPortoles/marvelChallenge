//
//  ComicViewCell.swift
//  marvelChallenge
//
//  Created by Nicolas Daniel Laugas on 06/02/2021.
//

import UIKit

class ComicViewCell: UITableViewCell {

    @IBOutlet weak var comicNameLabel: UILabel!
    @IBOutlet weak var comicYearLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    func setup(comic: Comic){
        comicNameLabel.text = comic.name
        comicYearLabel.text = getYearFromName(comic.name!)
    }
    
    func setupWithNext(comic: Next){
        comicNameLabel.text = comic.name
        comicYearLabel.text = getYearFromName(comic.name!)
    }
    
    private func getYearFromName(_ name: String) -> String {
        let firstParentesis = getIndexOf(string: name, char: "(")
        let secondParentesis = getIndexOf(string: name, char: ")")
        let year = name.substring(with: firstParentesis+1..<secondParentesis)
        if year.count == 4 {
            return year
        } else {
            return "Year not found."
        }
        
    }
    
    private func getIndexOf(string: String, char: Character) -> Int {

        if let idx = string.firstIndex(of: char) {
            let pos = string.distance(from: string.startIndex, to: idx)
            return pos
        }
        else {
            return -1
        }
    }
    
}

// Preguntar donde ubicar extensiones como estas

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }

    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }

    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}
