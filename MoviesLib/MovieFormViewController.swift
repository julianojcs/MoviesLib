//
//  MovieFormViewController.swift
//  MoviesLib
//
//  Created by Juliano Costa Silva on 01/08/22.
//

import UIKit

class MovieFormViewController: UIViewController {

    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textFieldRating: UITextField!
    @IBOutlet weak var textFieldDuration: UITextField!
    @IBOutlet weak var textFieldCategories: UITextField!
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var textViewSummary: UITextView!
    @IBOutlet weak var buttonAddEdit: UIButton!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie {
            title = "Edit movie"
            textFieldTitle.text = movie.title
            textFieldRating.text = "\(movie.rating)"
            textFieldDuration.text = movie.duration
            textFieldCategories.text = movie.categories
            textViewSummary.text = movie.summary
            if let image = movie.image {
                imageViewPoster.image = UIImage(data: image)
            }
            imageViewPoster?.contentMode = .scaleAspectFit
            buttonAddEdit.setTitle("Save", for: .normal)
            // or imageViewPoster?.contentMode =  UIViewContentMode.scaleAspectFill
            
        }
    }

    private func selectPicture(_ sourceType: UIImagePickerController.SourceType) {
        view.endEditing(true)
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func selectPoster(_ sender: UIButton) {
        let alert = UIAlertController(title: "Select poster", message: "Select image source.", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
                self.selectPicture(.camera)
            }
            alert.addAction(cameraAction)
        }
        
        let libraryAction = UIAlertAction(title: "Foto Library", style: .default) { _ in
            self.selectPicture(.photoLibrary)
        }
        alert.addAction(libraryAction)
        
        let photosAction = UIAlertAction(title: "Foto Album", style: .default) { _ in
            self.selectPicture(.savedPhotosAlbum)
        }
        alert.addAction(photosAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIButton) {
        if movie == nil {
            movie = Movie(context: context)
        }
        movie?.title = textFieldTitle.text
        movie?.summary = textViewSummary.text
        movie?.categories = textFieldCategories.text
        movie?.rating = Double(textFieldRating.text!) ?? 0.0
        movie?.duration = textFieldDuration.text
        movie?.image = imageViewPoster.image?.jpegData(compressionQuality: 0.9)
        //categories
        
        do {
            try context.save()
            navigationController?.popViewController(animated: true)
        } catch {
            print(error)
        }
    }
}

extension MovieFormViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            imageViewPoster.image = image
        }
        imageViewPoster?.contentMode = .scaleAspectFit
        
        dismiss(animated: true, completion: nil)
    }
}
