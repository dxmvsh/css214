//
//  DataManager.swift
//  SDU
//
//  Created by Dimash on 10/15/19.
//  Copyright © 2019 Dimash. All rights reserved.
//

import Foundation
import UIKit

class DataManager {
    static let contacts = [
        Contact(phoneNumber: "+7 (727) 307 95 65",
                email: "info@sdu.edu.kz​"),
    ]
    
    static let socialNetworks = [
        SocialNetwork(name: "Facebook",
                      url: URL(string: "https://www.facebook.com/sdukz/")!),
        SocialNetwork(name: "VK",
                      url: URL(string: "https://vk.com/sdukz")!),
        SocialNetwork(name: "Instagram",
                      url: URL(string: "https://www.instagram.com/sdukz/")!),
    ]
    
    static let clubs = [
        Club(name: Strings.ACADEMIC_CLUB_NAME,
             description: Strings.ACADEMIC_CLUB_DESCRIPTION,
             image: UIImage(named: "academic-club")!),
        Club(name: Strings.VISION_CLUB_NAME,
             description: Strings.VISION_CLUB_DESCRIPTION,
             image: UIImage(named: "vision")!),
        Club(name: Strings.RED_CRESCENT_CLUB_NAME,
             description: Strings.RED_CRESCENT_CLUB_DESCRIPTION,
             image: UIImage(named: "red-crescent")!),
    ]
    
    static let news = [
        News(title: Strings.NEWS1_TITLE,
             description: Strings.NEWS1_DESCRIPTION,
             image: UIImage(named: "news1-image")!),
        News(title: Strings.NEWS2_TITLE,
             description: Strings.NEWS2_DESCRIPTION,
             image: UIImage(named: "news2-image")!),
        News(title: Strings.NEWS3_TITLE,
             description: Strings.NEWS3_DESCRIPTION,
             image: UIImage(named: "news3-image")!),
    ]
    static let faculties = [
        Faculty(name: "Business School",
                description: Strings.BUSINESS_SCHOOL_DESCRIPTION,
                programs: [
                    Program(type: .bachelors,
                            specialities: [
                                Speciality(name: Strings.ACCOUNTING_NAME,
                                           degree: Strings.BUSINESS_SCHOOL_BACHELORS_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.ACCOUNTING_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Ilyas_Imachikov"]!),
                                Speciality(name: Strings.DIGITAL_MARKETING_NAME,
                                           degree: Strings.BUSINESS_SCHOOL_BACHELORS_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.DIGITAL_MARKETING_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Guldana_Rustemkyzy"]!),
                                Speciality(name: Strings.ECONOMICS_NAME,
                                           degree: Strings.BUSINESS_SCHOOL_BACHELORS_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.ECONOMICS_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Yerzhan_Syzdykov"]!),
                                Speciality(name: Strings.FINANCE_NAME,
                                           degree: Strings.BUSINESS_SCHOOL_BACHELORS_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.FINANCE_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Ilyas_Imachikov"]!),
                                Speciality(name: Strings.MANAGEMENT_NAME,
                                           degree: Strings.BUSINESS_SCHOOL_BACHELORS_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.MANAGEMENT_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Yerzhan_Syzdykov"]!)
                                                ]),
                    Program(type: .masters,
                            specialities: [
                                Speciality(name: Strings.ECONOMICS_NAME,
                                           degree: Strings.BUSINESS_SCHOOL_MSC_DEGREE,
                                           programLength: Strings.BUSINESS_SCHOOL_MSC_PROGRAM_LENGTH,
                                           description: Strings.ECONOMICS_MSC_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Dinara_Sarsenova"]!),
                                Speciality(name: Strings.MANAGEMENT_NAME,
                                           degree: Strings.MANAGEMENT_MSC_DEGREE,
                                           programLength: Strings.BUSINESS_SCHOOL_MSC_PROGRAM_LENGTH,
                                           description: Strings.MANAGEMENT_MSC_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Dinara_Sarsenova"]!)
                            
                            ]),
                    Program(type: .phd,
                            specialities: [
                                Speciality(name: Strings.MANAGEMENT_NAME,
                                           degree: Strings.MANAGEMENT_PHD_DEGREE,
                                           programLength: Strings.THREE_YEARS_PROGRAM_LENGTH,
                                           description: Strings.MANAGEMENT_PHD_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Dinara_Sarsenova"]!)
                            ])
                        ]),
        Faculty(name: "Education & Humanities",
                description: Strings.EDUCATION_HUMANITIES_DESCRIPTION,
                programs: [
                    Program(type: .bachelors,
                            specialities: [
                                Speciality(name: Strings.CHEMISTRY_BIOLOGY_NAME,
                                           degree: Strings.EDUCATION_HUMANITIES_BACHELORS_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.CB_PM_PI_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Bota Zhumakayeva"]!),
                                Speciality(name: Strings.PEDAGOGICAL_MATHEMATICS_NAME,
                                           degree: Strings.EDUCATION_HUMANITIES_BACHELORS_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.CB_PM_PI_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Abdullah Almas"]!),
                                Speciality(name: Strings.PHILOLOGY_NAME,
                                           degree: Strings.EDUCATION_HUMANITIES_BACHELORS_DEGREE2,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.PHILOLOGY_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Arman Argynbayev"]!),
                                Speciality(name: Strings.PHYSICS_INFORMATICS_NAME,
                                           degree: Strings.EDUCATION_HUMANITIES_BACHELORS_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.CB_PM_PI_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Samat Maxutov"]!),
                                Speciality(name: Strings.TRANSLATION_STUDIES_NAME,
                                           degree: Strings.EDUCATION_HUMANITIES_BACHELORS_DEGREE2,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.TRANSLATION_STUDIES_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Madina Ashirimbetova"]!),
                                Speciality(name: Strings.TFL_NAME,
                                           degree: Strings.EDUCATION_HUMANITIES_BACHELORS_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.TFL_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Arman Argynbayev"]!),
                        ]),
                    Program(type: .masters,
                            specialities: [
                                Speciality(name: Strings.TFL_NAME,
                                           degree: Strings.EDUCATION_HUMANITIES_MSC_DEGREE,
                                           programLength: Strings.TWO_YEARS_PROGRAM_LENGTH,
                                           description: Strings.TFL_MSC_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Yusuf Yaylaci"]!),
                                Speciality(name: Strings.PEDAGOGICAL_MATHEMATICS_NAME,
                                           degree: Strings.EDUCATION_HUMANITIES_MSC_DEGREE,
                                           programLength: Strings.TWO_YEARS_PROGRAM_LENGTH,
                                           description: Strings.PEDAGOGICAL_MATHEMATICS_MSC_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Abdullah Almas"]!),
                        ]),
                    Program(type: .phd,
                            specialities: [
                                Speciality(name: Strings.PEDAGOGICAL_MATHEMATICS_NAME,
                                           degree: Strings.PEDAGOGICAL_MATHEMATICS_PHD_DEGREE,
                                           programLength: Strings.THREE_YEARS_PROGRAM_LENGTH,
                                           description: Strings.PEDAGOGICAL_MATHEMATICS_PHD_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Abdullah Almas"]!),
                                Speciality(name: Strings.TFL_NAME,
                                           degree: Strings.TFL_PHD_DEGREE,
                                           programLength: Strings.TWO_YEARS_PROGRAM_LENGTH,
                                           description: Strings.TFL_PHD_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Yusuf Yaylaci"]!),
                        ])
            ]),
        Faculty(name: "Engineering & Natural Sciences",
                description: Strings.ENG_DESCRIPTION,
                programs: [
                    Program(type: .bachelors,
                            specialities: [
                                Speciality(name: Strings.CS_NAME,
                                           degree: Strings.BACHELOR_ICT_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.CS_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Meraryslan Meraliyev"]!),
                                Speciality(name: Strings.IS_NAME,
                                           degree: Strings.BACHELOR_ICT_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.IS_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Darmen Kariboz"]!),
                                Speciality(name: Strings.MCM_NAME,
                                           degree: Strings.BACHELOR_MCM_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.NO_CONTENT,
                                           coordinator: Coordinator(name: "",
                                                                    contact: Contact(phoneNumber: "",
                                                                                     email: ""))),
                                Speciality(name: Strings.MATH_NAME,
                                           degree: Strings.BACHELOR_NAT_SCI_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.NO_CONTENT,
                                           coordinator: Coordinator.coordinators["Farukh Mashurov"]!)
                        ]),
                    Program(type: .masters,
                            specialities: [
                                Speciality(name: Strings.CS_NAME,
                                           degree: Strings.CS_MSC_DEGREE,
                                           programLength: Strings.TWO_YEARS_PROGRAM_LENGTH,
                                           description: Strings.CS_MSC_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Cemil Turan"]!),
                                Speciality(name: Strings.MATH_NAME,
                                           degree: Strings.MATH_MSC_DEGREE,
                                           programLength: Strings.TWO_YEARS_PROGRAM_LENGTH,
                                           description: Strings.MATH_MSC_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Shirali Kadyrov"]!)
                        ]),
                    Program(type: .phd,
                            specialities: [
                                Speciality(name: Strings.CS_NAME,
                                           degree: Strings.CS_PHD_DEGREE,
                                           programLength: Strings.THREE_YEARS_PROGRAM_LENGTH,
                                           description: Strings.NO_CONTENT,
                                           coordinator: Coordinator.coordinators["Cemil Turan"]!),
                                Speciality(name: Strings.MATH_NAME,
                                           degree: Strings.MATH_PHD_DEGREE,
                                           programLength: Strings.THREE_YEARS_PROGRAM_LENGTH,
                                           description: Strings.NO_CONTENT,
                                           coordinator: Coordinator.coordinators["Shirali Kadyrov"]!)
                        ])
            ]),
        Faculty(name: Strings.LSS_NAME,
                description: Strings.LSS_DESCRIPTION,
                programs: [
                    Program(type: .bachelors,
                            specialities: [
                                Speciality(name: Strings.HPA_NAME,
                                           degree: Strings.HPA_BACHELORS_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.HPA_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Aslan Turlybek"]!),
                                Speciality(name: Strings.ISP_NAME,
                                           degree: Strings.ISP_BACHELORS_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.ISP_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Assel Abisheva"]!),
                                Speciality(name: Strings.ML_NAME,
                                           degree: Strings.ML_BACHELORS_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.ML_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Aidyn Amankozhayev"]!),
                                Speciality(name: Strings.MTVJ_NAME,
                                           degree: Strings.MTVJ_BACHELORS_DEGREE,
                                           programLength: Strings.BACHELORS_PROGRAM_LENGTH,
                                           description: Strings.MTVJ_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Madiyar Saudbayev"]!),
                        ]),
                    Program(type: .masters,
                            specialities: [
                                Speciality(name: Strings.ITL_NAME,
                                           degree: Strings.ITL_DEGREE,
                                           programLength: Strings.ITL_PROGRAM_LENGTH,
                                           description: Strings.ITL_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Abay Magauya"]!),
                                Speciality(name: Strings.J_MSC_NAME,
                                           degree: Strings.J_MSC_DEGREE,
                                           programLength: Strings.TWO_YEARS_PROGRAM_LENGTH,
                                           description: Strings.J_MSC_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Madiyar Saudbayev"]!),
                                Speciality(name: Strings.PRIVATE_LAW_MSC_NAME,
                                           degree: Strings.LAW_MSC_DEGREE,
                                           programLength: Strings.TWO_YEARS_PROGRAM_LENGTH,
                                           description: Strings.PRIVATE_LAW_MSC_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Aidyn Amankozhayev"]!),
                                Speciality(name: Strings.PUBLIC_LAW_MSC_NAME,
                                           degree: Strings.LAW_MSC_DEGREE,
                                           programLength: Strings.TWO_YEARS_PROGRAM_LENGTH,
                                           description: Strings.PUBLIC_LAW_MSC_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Aidyn Amankozhayev"]!),
                                
                        ]),
                    Program(type: .phd,
                            specialities: [
                                Speciality(name: Strings.JURISPRUDENCE_NAME,
                                           degree: Strings.JURISPRUDENCE_DEGREE,
                                           programLength: Strings.THREE_YEARS_PROGRAM_LENGTH,
                                           description: Strings.JURISPRUDENCE_DESCRIPTION,
                                           coordinator: Coordinator.coordinators["Abay Magauya"]!)
                        ])
            ])
    ]
    
}
