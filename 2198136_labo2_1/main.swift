//
//  main.swift
//  2198136_labo2_1
//
//  Created by Andreea Draghici on 2022-03-23.
//
//MARK: Étape-1
//aussi integrée dans partie 2 - mais je l'ai laissée ici aussi
//import Foundation
//var str = "Bienvenue au jeu!"
//let borneMin = 1
//let borneMax = 100
//// Écrire la formule qui permet de calculer un chiffre entre borneMin et borneMax
//let chiffreMystère = Int(arc4random_uniform(UInt32(borneMax)) + 1)
//let nbCoupsMax = 10
//
//print("\(str)")
//print("DB 1: \(chiffreMystère)")
//
//for i in 1...nbCoupsMax {
//    print("Entrez un nombre:")
//
//if let nb = Int(readLine()!) {
//    print("DB 2: \(nb)")
//
//    if  i >= nbCoupsMax {
//        print("Perdu")
//        print("La chiffre mystère était \(chiffreMystère)")
//
//    }else if nb == chiffreMystère {
//        print("Gagné")
//        break
//    } else if nb < chiffreMystère {
//        print("Le nombre à deviner est plus grand.")
//
//    } else if nb > chiffreMystère {
//        print("Le nombre à deviner est plus petit.")
//        }
//    }
//}
//print("Bye")

import Foundation

//MARK: Étape-2

var borneMin = 0
var borneMax = 0
var chiffreMystère = 0
var nbCoupsMax = 0

//valide si le numéro est entre min et max et redemande à l'utilisateur de rentrer un numéro
//jusqu'au ce qu'on aura un numéro valide
func validerNumeroRange(min:Int , max:Int, nb:Int) -> Int {
    var numero = 0
    //verifier si le numéro nb est dans l'interval [min , max]
    if min...max ~= nb{
        numero = nb
    } else {
        repeat {
        print("Entrez un nombre entre \(min) et \(max):")
            if let nouveauNumero = Int(readLine()!){
                numero = nouveauNumero
            }
       } while (numero < min || numero > max)
    }
    return numero
}

//fonction pout jouer le jeu avec des numéros entre min et max , nbCoups fois
func devinerChiffreEntreBornes(min:Int , max:Int, nbMystère:Int , nbCoups:Int) {

  for i in 1...nbCoups {
    print("Entrez un nombre:")

   if var nb = Int(readLine()!) {
    nb = validerNumeroRange(min: min, max: max, nb: nb)

    if nb == nbMystère {
        print("🎉 Vous avez gagné 🎉")
        break
    }else if i >= nbCoups {
        print("Vous avez perdu 💥")
        print("La chiffre mystère était \(nbMystère)")
    } else if nb < nbMystère {
        print("Le nombre à deviner est plus grand ↗️")

    } else if nb > nbMystère {
        print("Le nombre à deviner est plus petit ↙️")
        }
    print("Essais restants: \(nbCoups-i)\n")
    }
  }
}

func presenterMenu() {
    print("\nQue voulez vous faire ?"
        + "\n1. 🆑 Partie classique"
        + "\n2. ⚡️ Partie rapide"
        + "\n3. 📉 Entrer une partie manuellement 📈"
        + "\n"
        + "\n0. ❌ Fermer le jeu")

    // On récupère la réponse de l'utilisateur
    if let choice = readLine() {

        switch choice {
        case "1": // Partier clasique
             borneMin = 1
             borneMax = 100
             nbCoupsMax = 10
             chiffreMystère = Int.random(in:borneMin...borneMax)
            print("\(chiffreMystère)")

            devinerChiffreEntreBornes(min: borneMin , max: borneMax, nbMystère: chiffreMystère, nbCoups: nbCoupsMax)

        case "2": // Partie rapide
            borneMin = 21
            borneMax = 42
            nbCoupsMax = 3
            chiffreMystère = Int.random(in:borneMin...borneMax)
            print("\(chiffreMystère)")

            devinerChiffreEntreBornes(min: borneMin , max: borneMax, nbMystère: chiffreMystère, nbCoups: nbCoupsMax)

        case "3": // Entrer une partie manuellement
            print("Entrez la borne inférieure:")
            if let min = Int(readLine()!) {
                borneMin = min
                print("Entrez la borne supérieure:")
                if let max = Int(readLine()!) {
                    borneMax = max
                    print("Entrez le nombre de coups:")
                    if let nbCoups = Int(readLine()!) {
                        nbCoupsMax = nbCoups
                        chiffreMystère = Int.random(in:borneMin...borneMax)

                        devinerChiffreEntreBornes(min: borneMin , max: borneMax, nbMystère: chiffreMystère, nbCoups: nbCoupsMax)
                    }
                }
            }
        case "0":
            print("Bye")
            exit(0)

        default:
            print("\n Je ne comprends pas")
        }
    }
}
// La boucle du programme
while true {
    presenterMenu()
}

//MARK: Dans la librairie d’objets de Xcode 13.2.1 il y a 75 élements

