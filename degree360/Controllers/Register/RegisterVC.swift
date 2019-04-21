//
//  RegisterVC.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit
import JJHUD

class RegisterVC : UIViewController, RegisterInteractorProtocol {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UITextField!
    var imagePicker: UIImagePickerController!
    @IBOutlet weak var startBtn: UIButton!
    
    @IBAction func clickRegister(_ sender: Any) {
        
        guard !name.text!.isEmpty else {
            alert("Please type your name");
            return
        }
        
        guard let image = photo.image else {
            alert("Please check your sex");
            return
        }
        
        self.interactor.register(name.text!, image)
    }
    
    func showMessage(_ message: String) {
        alert(message)
    }
    
    func startLoading() {
        JJHUD.showLoading()
    }
    
    func hideLoading() {
        JJHUD.hide()
    }
    
    func successRegister() {
        dismiss(animated: true, completion: nil)
    }
    
    var interactor : RegisterInteractor!
    
    override func viewDidLoad() {
        self.interactor = RegisterInteractor(self)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.takePhoto))
        photo.addGestureRecognizer(tap)
        photo.isUserInteractionEnabled = true
        startBtn.layer.cornerRadius = 25
        self.addLineToView(view: name, position:.LINE_POSITION_BOTTOM, color: UIColor.white, width: 1)
        
        name.delegate = self
    }
    
    static func getVC() -> RegisterVC{
        return RegisterVC.init(nibName: "RegisterVC", bundle: nil)
    }
    
    @objc func takePhoto(_ sender: Any) {

        
        let alert = UIAlertController(title: "Choose variant", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "From camera", style: .default, handler: { [weak self] _ in
            self?.chooseImage(true)
        }))
        alert.addAction(UIAlertAction(title: "From gallery", style: .default, handler: { [weak self] _ in
            self?.chooseImage(false)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
        
    }
    
    func chooseImage(_ fromCamera : Bool) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = fromCamera ? .camera : .photoLibrary

        present(imagePicker, animated: true, completion: nil)
    }
    
    enum LINE_POSITION {
        case LINE_POSITION_TOP
        case LINE_POSITION_BOTTOM
    }
    
    func addLineToView(view : UIView, position : LINE_POSITION, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        view.addSubview(lineView)
        
        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
        
        switch position {
        case .LINE_POSITION_TOP:
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .LINE_POSITION_BOTTOM:
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        default:
            break
        }
    }
}


extension RegisterVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        //photo.image = info[.originalImage] as? UIImage
        guard let image = info[.originalImage] as? UIImage else {
            print("No image found")
            return
        }
        
        // print out the image size as a test
        print(image.size)
        photo.image = image
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
}
