//
//  ViewController.swift
//  IssueReport
//
//  Created by raj on 17/09/20.
//

import UIKit
import IBAnimatable
import CLImageEditor


class ViewController: UIViewController {
    
    // MARK: Variables
    var editor = CLImageEditor()
    
    private var imagePicker = UIImagePickerController()
    @IBOutlet var imgReport: UIImageView!
    @IBOutlet var txtReport: AnimatableTextView!
    @IBOutlet var btnAdd: AnimatableButton!
    @IBOutlet var btnEdit: AnimatableButton!
    var isImageChanged : Bool = false
    var project_id = String()
    private var bwfeedbackModel: BWFeedbackModel = BWFeedbackModel()
    
    // MARK: Setup
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setup() {
        title = "Report a Problem"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Send", style: .plain, target: self, action: #selector(send))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleDismiss))
        
    }
    
    @objc private func handleDismiss() {
        self.dismiss(animated: true) {
            
        }
    }
    
    @objc private func send() {
        let info = "Device: \(bwfeedbackModel.deviceModel)\n" + "iOS: \(bwfeedbackModel.deviceOs)\n" + "App Name: \(bwfeedbackModel.appName)\n" + "App Version: \(bwfeedbackModel.appVersion)\n" + "App Build: \(bwfeedbackModel.appBuild)\n"
        print(info)
        print(self.txtReport.text as Any)
        print(self.imgReport.image as Any)
        
    }
    
    @IBAction func btnAddimageAction(_ sender: Any) {
        self.openPhotos()
    }
    
    @IBAction func btnEditimageAction(_ sender: Any) {
        
             self.editor = CLImageEditor(image: self.imgReport.image)
            
            self.editor.theme.backgroundColor = .black
            self.editor.theme.toolbarColor = .white
            self.editor.theme.toolIconColor = "white"
            self.editor.theme.toolbarTextColor = .white
            self.editor.theme.toolbarSelectedButtonColor = UIColor.white
            
            let resizeTool = self.editor.toolInfo.subToolInfo(withToolName: "CLResizeTool", recursive: true)
            resizeTool?.available = false
            
            let cropTool = self.editor.toolInfo.subToolInfo(withToolName: "CLClippingTool", recursive: true)
            cropTool?.available = true
            
            self.editor.delegate = self
            self.editor.modalPresentationStyle = .fullScreen
            if #available(iOS 13.0, *) {
                self.editor.isModalInPresentation = true
            } else {
                // Fallback on earlier versions
            }
            
            self.present(self.editor, animated: true) {
                
            }
 
    }
}


extension ViewController :CLImageEditorDelegate{
    func imageEditor(_ editor: CLImageEditor!, didFinishEditingWith image: UIImage!) {
        print("Did finish CLImage")
        
        self.dismiss(animated: true) {
            self.isImageChanged = true

            self.imgReport.image = image
        }
    }
    
    
    func imageEditorDidCancel(_ editor: CLImageEditor!) {
        print("cancel")
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated:true, completion: nil) //5
    }
}

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    public func openPhotos() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as? UIImage else {
            return
        }
        self.imgReport.image = image
        
        self.dismiss(animated: true) {
        }
    }
    
}
