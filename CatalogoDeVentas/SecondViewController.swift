//
//  SecondViewController.swift
//  CatalogoDeVentas
//
//  Created by Óscar Zamora on 9/30/18.
//  Copyright © 2018 mpoo03. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var nombreProductoDetalle: String = ""
    var precioProductoDetalle: Double = 0.0
    var nombreImagen: String = ""
    var descripcionProductoDetalle: String = ""
    var precioTotal: Double = 0.0
    var productoCantidad: Int = 1
    var productoDetalle = productoCarrito(nombreProdCarrito: "", precioProdCarrito: 0.0, cantidadEnCarrito: 0, descripcion: "", imagen: "")
    
    @IBOutlet weak var nombreDetalle: UILabel!
    @IBOutlet weak var precioDetalle: UILabel!
    @IBOutlet weak var imagenDetalle: UIImageView!
    @IBOutlet weak var descripcionDetalle: UITextView!
    @IBOutlet weak var etiquetaCantidad: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var agregar: UIButton!
    
    var carrito: [productoCarrito] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        precioTotal = precioProductoDetalle
        nombreDetalle.text = nombreProductoDetalle
        precioDetalle.text = String(format: "$%.2f", (precioProductoDetalle))
        imagenDetalle.image = UIImage(named: nombreImagen)
        descripcionDetalle.text = descripcionProductoDetalle
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.minimumValue = 1
        stepper.maximumValue = 10
    }
    
    @IBAction func cambiarCantidad(_ sender: UIStepper) {
        etiquetaCantidad.text = Int(sender.value).description
        precioTotal = precioProductoDetalle * Double(sender.value)
        precioDetalle.text = String(format: "$%.2f", (precioTotal))
        productoCantidad = Int(sender.value)
    }
    
    @IBAction func agregarAlCarrito(_ sender: UIButton) {
        productoDetalle.nombreProdCarrito = nombreProductoDetalle
        productoDetalle.precioProdCarrito = precioTotal
        productoDetalle.cantidadEnCarrito = productoCantidad
        carrito.append(productoDetalle)
        performSegue(withIdentifier: "unwindSegueToSecondView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindSegueToSecondView"{
            let regreso = segue.destination as! ViewController
            regreso.carritoGuardado = carrito
        }
    }
    
}
