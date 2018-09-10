//
//  ViewController.swift
//  iOSUIFontTextStyle
//
//  Created by kazumi hayashida on 2018/08/30.
//  Copyright © 2018年 kazumi hayashida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.allowsSelection = false
  }
}

extension ViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return FontTextStyle.string.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    cell.textLabel?.text = FontTextStyle.string[indexPath.row]
    let descripter = UIFontDescriptor.preferredFontDescriptor(withTextStyle: FontTextStyle.textStyle[indexPath.row])
    cell.textLabel?.font = UIFont(descriptor: descripter, size: descripter.pointSize)
    if let pointSize = cell.textLabel?.font.pointSize {
      cell.detailTextLabel?.text = String(format: "Point size = %.1f", pointSize);
    }
    return cell
  }
}

