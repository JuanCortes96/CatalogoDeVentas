//
//  ThirdViewController.swift
//  CatalogoDeVentas
//
//  Created by Óscar Zamora on 10/2/18.
//  Copyright © 2018 mpoo03. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tablaCarrito: UITableView!
    @IBOutlet weak var precioTotalCarrito: UILabel!
    
    var carritoEnPantalla: [productoCarrito] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var precioTotalValor = 0.0
        for valor in carritoEnPantalla{
            precioTotalValor += Double(valor.precioProdCarrito)
        }
        precioTotalCarrito.text = String(format: "$%.2f", precioTotalValor)
        return carritoEnPantalla.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celdaProducto = tableView.dequeueReusableCell(withIdentifier: "prodAgregado", for: indexPath)
        celdaProducto.textLabel?.text = "(\(String(carritoEnPantalla[indexPath.row].cantidadEnCarrito)))  \(carritoEnPantalla[indexPath.row].nombreProdCarrito)"
        celdaProducto.detailTextLabel?.text = String(format: "$%.2f", carritoEnPantalla[indexPath.row].precioProdCarrito)
        return celdaProducto
    }

}
