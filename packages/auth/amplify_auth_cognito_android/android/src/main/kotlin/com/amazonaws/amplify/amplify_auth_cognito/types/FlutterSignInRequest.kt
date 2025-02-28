/*
 * Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

package com.amazonaws.amplify.amplify_auth_cognito.types

import com.amplifyframework.auth.AuthUser
import com.amplifyframework.auth.cognito.options.AWSCognitoAuthSignInOptions
import com.amplifyframework.auth.cognito.options.AuthFlowType
import com.amplifyframework.core.Amplify

data class FlutterSignInRequest(val map: HashMap<String, *>) {
  val username: String = map["username"] as String;
  /**
   * Custom Auth requires the ability to support passwordless login backed by Lambda triggers.
   * However, passing null to the amplify-android signIn API results in an NotAuthorizedException.
   * even when the password is not checked by the Lambda function.
   */
  val password: String = map["password"]?.toString() ?: ""
  val options: AWSCognitoAuthSignInOptions = formatOptions(map["options"] as HashMap<String, *>?)

    private fun formatOptions(rawOptions: HashMap<String, *>?): AWSCognitoAuthSignInOptions {
        var options = AWSCognitoAuthSignInOptions.builder()

        if (rawOptions?.get("clientMetadata") != null)
            options.metadata(rawOptions["clientMetadata"] as HashMap<String, String>)

        if (rawOptions?.get("authFlowType") != null) {
            when (rawOptions?.get("authFlowType")) {
                "userSrpAuth" -> options.authFlowType(AuthFlowType.USER_SRP_AUTH)
                "customAuth" -> options.authFlowType(AuthFlowType.CUSTOM_AUTH)
            }
        }

    return options.build();
  }

  companion object {
        fun checkUser() {
            try {
                var user: AuthUser? = Amplify.Auth.currentUser
                if (user != null) {
                    throw FlutterInvalidStateException("There is already a user signed in.", "Sign out before calling sign in.")
                }
            } catch (e: Exception) {
                if (e is FlutterInvalidStateException) {
                    throw e
                }
            }
        }
    }
}
