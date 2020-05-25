package com.mulani.java_aws_lambda

import com.amazonaws.services.lambda.runtime.Context
import com.amazonaws.services.lambda.runtime.RequestHandler

class LambdaRequestHandler : RequestHandler<String, String>{
    override fun handleRequest(input: String?, context: Context?): String {
        context?.logger?.log("Input : $input")
        return "Hello World : $input"
    }
}

fun main() {
    print(LambdaRequestHandler().handleRequest("Mulani", null))
}