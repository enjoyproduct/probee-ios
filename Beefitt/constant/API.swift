//
//  API.swift
//  Heyoe
//
//  Created by Admin on 8/23/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
class API: NSObject {

    static let BASE_URL = "http://hhqtouch.com.my/"

    static let BASE_API_URL = BASE_URL + "api/v1/"
    static let BASE_IMAGE_URL = BASE_URL + "upload/avatars/"
    static let BASE_FILE_URL = BASE_URL + "api/v1/files/documents/"
    static let EMPOWER_URL = "https://hhq.com.my/empower/"
    
    static let REGISTER = BASE_URL + "register"
    static let TERMS_AND_POLICY = "https://hhq.com.my/terms-of-use-for-hhq-touch/"
    static let LOGIN = BASE_API_URL + "users/me"
    static let FORGOT_PASSWORD = BASE_API_URL + "users/me/password"
    static let LOGOUT = BASE_API_URL + "users/me/logout";
    static let GET_FILES = BASE_API_URL + "files?per_page=20";
    
}
