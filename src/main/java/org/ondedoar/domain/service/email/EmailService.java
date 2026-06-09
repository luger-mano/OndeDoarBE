package org.ondedoar.domain.service.email;


import jakarta.mail.MessagingException;

public interface EmailService {

    void sendVerificationEmail(String mail, String name, String token) throws MessagingException;
    void sendVerificationPasswordViaMail(String mail, String name, String token) throws MessagingException;
}
