//
//  BWFeedbackModel.swift
//  BWReportProblem
//
//  Created by raj on 16/09/20.
//  Copyright © 2020 Bluewhale. All rights reserved.
//

import Foundation
import UIKit

public class BWFeedbackModel {
    
    var subject: String = ""
    var details: String = ""
    var attachments: UIImage?
    
    var deviceModel: String = UIDevice.modelName
    var deviceOs: String = UIDevice.current.systemVersion
    
    var appName: String = Bundle.main.name
    var appVersion: String = Bundle.main.releaseVersionNumber
    var appBuild: String = Bundle.main.buildVersionNumber
}
