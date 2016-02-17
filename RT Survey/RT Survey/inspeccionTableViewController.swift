//
//  inspeccionTableViewController.swift
//  RTSurvey
//
//  Created by Idapps on 2/13/16.
//  Copyright © 2016 Idapps. All rights reserved.
//

import UIKit

class inspeccionTableViewController: UITableViewController {
 
    let contador = ["Tiempo estimado para la instalación"]
    let seleccion = ["Se necesitan llaves?", "Se necesita escolta", "Requerimientos especiales o permisos", "Existe algun incoveniente con la linea de vista?", "Existen receptores de RF?"]
    let segmentado = [
        ["Acceso a la Azote",["Interno","Externo"]],
        ["Tipo de Acceso",["Escalera","Ascensor"]],
    ]
    let input = ["Facilidad de Acceso", "Coordenadas WGS", "Linea de vista hacia la(s) Celda(s)"]
    
    var lista:[[AnyObject]] = []
    let x = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = g.aux.UIColorFromRGB("f2f2f2", alpha: 1)
        
        lista = [contador,seleccion,segmentado,input]
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "actualizarCelda:", name:"actualizarCelda", object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func actualizarCelda(notification: NSNotification){
        self.tableView.reloadData()
    }
    
   
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        print("Secciones",lista.count)
        return lista.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell :UITableViewCell!
        var cc: celdaContadorTableViewCell!
        var csl: celdaSeleccionTableViewCell!
        var csg: celdaSegmentadaTableViewCell!
        var ci: celdaInputTableViewCell!
        
        switch (indexPath.section) {
        case 0:
            cc = tableView.dequeueReusableCellWithIdentifier("celdaContador", forIndexPath: indexPath) as! celdaContadorTableViewCell

            cc.titulo.text = contador[indexPath.row]
            cc.index = indexPath
            cell = cc
            
        case 1:
            csl = tableView.dequeueReusableCellWithIdentifier("celdaSeleccion", forIndexPath: indexPath) as! celdaSeleccionTableViewCell
            csl.titulo.text = seleccion[indexPath.row]
            print(indexPath.row)
            cell = csl
            break;
        
        case 2:
            csg = tableView.dequeueReusableCellWithIdentifier("celdaSegmentada", forIndexPath: indexPath) as! celdaSegmentadaTableViewCell
            print(indexPath.row)
            csg.titulo.text = segmentado[indexPath.row][0] as? String
            csg.segmento.setTitle(segmentado[indexPath.row][1][0] as? String, forSegmentAtIndex: 0)
            csg.segmento.setTitle(segmentado[indexPath.row][1][1] as? String, forSegmentAtIndex: 1)
            cell = csg
            break;
        
        case 3:
            ci = tableView.dequeueReusableCellWithIdentifier("celdaInput", forIndexPath: indexPath) as! celdaInputTableViewCell
            print(indexPath.row)
            ci.titulo.text = input[indexPath.row]
            cell = ci
            break;
            
        default:
            break;
        }
        
        return cell

    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
       
        switch indexPath.section {
        case 0: return 90
        case 1: return 50
        case 2: return 90
        case 3: return 90
        default: return 50
        }
    }


}
