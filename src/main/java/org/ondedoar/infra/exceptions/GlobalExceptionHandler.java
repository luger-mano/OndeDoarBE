package org.ondedoar.infra.exceptions;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ProblemDetail;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

import java.nio.file.AccessDeniedException;
import java.security.SignatureException;

@RestControllerAdvice
public class GlobalExceptionHandler extends RuntimeException {

    @ExceptionHandler(Exception.class)
    public ProblemDetail handlerSecurityException(Exception exception) {

        ProblemDetail errorDetail;

        exception.getStackTrace();

        if (exception instanceof NullPointerException) {

            errorDetail = ProblemDetail.forStatusAndDetail(
                    HttpStatusCode.valueOf(500),
                    exception.getMessage()
            );

            errorDetail.setProperty("description", "Null object.");

            return errorDetail;
        }

        if (exception instanceof DataIntegrityViolationException) {

            errorDetail = ProblemDetail.forStatusAndDetail(
                    HttpStatusCode.valueOf(409),
                    exception.getMessage()
            );

            errorDetail.setProperty("description", "Data breach, duplicate data.");

            return errorDetail;
        }

        if (exception instanceof HttpRequestMethodNotSupportedException) {

            errorDetail = ProblemDetail.forStatusAndDetail(
                    HttpStatusCode.valueOf(405),
                    exception.getMessage()
            );

            errorDetail.setProperty("description", "Wrong HTTP method.");

            return errorDetail;
        }

        if (exception instanceof AccessDeniedException) {

            errorDetail = ProblemDetail.forStatusAndDetail(
                    HttpStatusCode.valueOf(403),
                    exception.getMessage()
            );

            errorDetail.setProperty("description", "You are not authorized to access this resource.");

            return errorDetail;
        }

        if (exception instanceof SignatureException) {

            errorDetail = ProblemDetail.forStatusAndDetail(
                    HttpStatusCode.valueOf(401),
                    exception.getMessage()
            );

            errorDetail.setProperty("description", "The JWT signature is invalid.");

            return errorDetail;
        }

        if (exception instanceof MethodArgumentNotValidException) {

            errorDetail = ProblemDetail.forStatusAndDetail(
                    HttpStatusCode.valueOf(400),
                    exception.getMessage()
            );

            errorDetail.setProperty("description", "Input data failed or invalid.");

            return errorDetail;
        }

        if (exception instanceof HttpMessageNotReadableException) {

            errorDetail = ProblemDetail.forStatusAndDetail(
                    HttpStatusCode.valueOf(400),
                    exception.getMessage()
            );

            errorDetail.setProperty("description", "Request body is inconsistent.");

            return errorDetail;
        }

        if (exception instanceof MethodArgumentTypeMismatchException) {

            errorDetail = ProblemDetail.forStatusAndDetail(
                    HttpStatusCode.valueOf(400),
                    exception.getMessage()
            );

            errorDetail.setProperty("description", "Invalid argument type.");

            return errorDetail;
        }

        errorDetail = ProblemDetail.forStatusAndDetail(
                HttpStatusCode.valueOf(500),
                "Unexpected internal server error."
        );

        errorDetail.setProperty("description", "Unexpected error.");

        return errorDetail;
    }
}
