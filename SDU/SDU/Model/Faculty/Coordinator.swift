//
//  Coordinator.swift
//  SDU
//
//  Created by Dimash on 10/20/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import Foundation

struct Coordinator {
    var name: String
    var contact: Contact
}

extension Coordinator {
    static let coordinators: [String: Coordinator] = [
        "Ilyas_Imachikov": Coordinator(name: "MSc. Ilyas Imachikov",
                                       contact: Contact(phoneNumber: "",
                                                        email: "ilyas.imachikov@sdu.edu.kz")),
        "Guldana_Rustemkyzy": Coordinator(name: "MSc. Guldana Rustemkyzy",
                                          contact: Contact(phoneNumber: "",
                                                           email: "guldana.rustemkyzy@sdu.edu.kz")),
        "Yerzhan_Syzdykov": Coordinator(name: "MSc. Yerzhan Syzdykov",
                                        contact: Contact(phoneNumber: "",
                                                         email: "yerzhan.syzdykov@sdu.edu.kz")),
        "Dinara_Sarsenova": Coordinator(name: "MSc. Dinara Sarsenova",
                                        contact: Contact(phoneNumber: "",
                                                         email: "dinara.sarsenova@sdu.edu.kz")),
        "Arman Argynbayev": Coordinator(name: "Arman Argynbayev",
                                        contact: Contact(phoneNumber: "",
                                                         email: "arman.argynbayev@sdu.edu.kz")),
        "Madina Ashirimbetova": Coordinator(name: "Madina Ashirimbetova",
                                            contact: Contact(phoneNumber: "",
                                                             email: "madina.ashirimbetova@sdu.edu.kz")),
        "Samat Maxutov": Coordinator(name: "Samat Maxutov",
                                     contact: Contact(phoneNumber: "",
                                                      email: "samat.maxutov@sdu.edu.kz")),
        "Abdullah Almas": Coordinator(name: "Abdullah Almas",
                                      contact: Contact(phoneNumber: "",
                                                       email: "abdullah.almas@sdu.edu.kz")),
        "Bota Zhumakayeva": Coordinator(name: "Bota Zhumakayeva",
                                        contact: Contact(phoneNumber: "",
                                                         email: "bota.zhumakayeva@sdu.edu.kz")),
        "Yusuf Yaylaci": Coordinator(name: "Yusuf Yaylaci",
                                     contact: Contact(phoneNumber: "",
                                                      email: "yusuf.yaylaci@sdu.edu.kz")),
        "Meraryslan Meraliyev": Coordinator(name: "MSc. Meraryslan Meraliyev",
                                            contact: Contact(phoneNumber: "",
                                                             email: "meraryslan.meraliyev@sdu.edu.kz")),
        "Darmen Kariboz": Coordinator(name: "MSc. Darmen Kariboz",
                                      contact: Contact(phoneNumber: "",
                                                       email: "darmen.kariboz@sdu.edu.kz")),
        "Farukh Mashurov": Coordinator(name: "MSc. Farukh Mashurov",
                                       contact: Contact(phoneNumber: "",
                                                        email: "farukh.mashurov@sdu.edu.kz")),
        "Shirali Kadyrov": Coordinator(name: "Dr. Shirali Kadyrov",
                                       contact: Contact(phoneNumber: "",
                                                        email: "shirali.kadyrov@sdu.edu.kz")),
        "Cemil Turan": Coordinator(name: "Dr. Cemil Turan",
                                       contact: Contact(phoneNumber: "",
                                                        email: "cemil.turan@sdu.edu.kz")),
        "Aslan Turlybek": Coordinator(name: "Dr. Aslan Turlybek",
                                      contact: Contact(phoneNumber: "",
                                                       email: "aslan.turlybek@sdu.edu.kz")),
        "Assel Abisheva": Coordinator(name: "Assel Abisheva",
                                      contact: Contact(phoneNumber: "",
                                                       email: "assel.abisheva@sdu.edu.kz")),
        "Aidyn Amankozhayev": Coordinator(name: "Aidyn Amankozhayev",
                                          contact: Contact(phoneNumber: "",
                                                           email: "aidyn.amankozhayev@sdu.edu.kz")),
        "Madiyar Saudbayev": Coordinator(name: "Dr. Madiyar Saudbayev",
                                         contact: Contact(phoneNumber: "",
                                                          email: "madiyar.saudbayev@sdu.edu.kz")),
        "Abay Magauya": Coordinator(name: "Abay Magauya",
                                    contact: Contact(phoneNumber: "",
                                                     email: "abay.magauya@sdu.edu.kz")),
    ]
}
