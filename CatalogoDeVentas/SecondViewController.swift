//
//  SecondViewController.swift
//  CatalogoDeVentas
//
//  Created by Óscar Zamora on 9/30/18.
//  Copyright © 2018 mpoo03. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nombreDetalle: UILabel!
    @IBOutlet weak var precioDetalle: UILabel!
    @IBOutlet weak var etiquetaCantidad: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var nombreProductoDetalle: String = ""
    var precioProductoDetalle: Double = 0
    var precioTotal: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombreDetalle.text = nombreProductoDetalle
        precioDetalle.text = String(format: "$%.2f", (precioProductoDetalle))
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.minimumValue = 1
        stepper.maximumValue = 10
    }
    
    @IBAction func cambiarCantidad(_ sender: UIStepper) {
        etiquetaCantidad.text = Int(sender.value).description
        precioTotal = precioProductoDetalle * Double(sender.value)
        precioDetalle.text = String(format: "$%.2f", (precioTotal))
    }
    
}
