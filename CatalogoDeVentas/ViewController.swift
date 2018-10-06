//
//  ViewController.swift
//  CatalogoDeVentas
//
//  Created by Óscar Zamora on 9/28/18.
//  Copyright © 2018 mpoo03. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var coleccion: UICollectionView!
    
    var catalogoProductos = [productoCarrito]()
    var carritoGuardado: [productoCarrito] = []
    
    @IBAction func unwindSecondView(segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        catalogoProductos.append(productoCarrito(nombreProdCarrito: "Prodcuto 1", precioProdCarrito: 100.00, cantidadEnCarrito: 0, descripcion: "Descripción del producto 1", imagen: "imagen1"))
        catalogoProductos.append(productoCarrito(nombreProdCarrito: "Prodcuto 2", precioProdCarrito: 150.00, cantidadEnCarrito: 0, descripcion: "Descripción del producto 2", imagen: "imagen2"))
        catalogoProductos.append(productoCarrito(nombreProdCarrito: "Prodcuto 3", precioProdCarrito: 175.00, cantidadEnCarrito: 0, descripcion: "Descripción del producto 3", imagen: "imagen3"))
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catalogoProductos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "objeto", for: indexPath) as! ItemCollectionViewCell
        celda.nombre.text = catalogoProductos[indexPath.row].nombreProdCarrito
        celda.precio.text = String(format: "$%.2f", catalogoProductos[indexPath.row].precioProdCarrito)
        celda.imagen.image = UIImage(named: catalogoProductos[indexPath.row].imagen)
        return celda
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondView"{
            let indexPath = coleccion.indexPathsForSelectedItems?.first
            let destino = segue.destination as! SecondViewController
            destino.nombreProductoDetalle = catalogoProductos[(indexPath?.row)!].nombreProdCarrito
            destino.precioProductoDetalle = catalogoProductos[(indexPath?.row)!].precioProdCarrito
            destino.nombreImagen = catalogoProductos[(indexPath?.row)!].imagen
            destino.descripcionProductoDetalle = catalogoProductos[(indexPath?.row)!].descripcion
            destino.carrito = carritoGuardado
        }
        if segue.identifier == "thirdView"{
            let destino2 = segue.destination as! ThirdViewController
            destino2.carritoEnPantalla = carritoGuardado
        }
    }
    
}
