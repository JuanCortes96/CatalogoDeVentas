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
    
    let nombres: [String] = ["Producto 1", "Producto 2", "Producto 3"]
    let precios: [Double] = [1000.00, 1500.00, 1750.00]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nombres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "objeto", for: indexPath) as! ItemCollectionViewCell
        celda.nombre.text = nombres[indexPath.row]
        celda.precio.text = String(format: "$%.2f", precios[indexPath.row])
        return celda
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondView"{
            let indexPath = coleccion.indexPathsForSelectedItems?.first
            let destino = segue.destination as! SecondViewController
            destino.nombreProductoDetalle = nombres[(indexPath?.row)!]
            destino.precioProductoDetalle = precios[(indexPath?.row)!]
        }
    }
    
}
