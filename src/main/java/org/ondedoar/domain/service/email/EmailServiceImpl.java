package org.ondedoar.domain.service.email;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class EmailServiceImpl implements EmailService {

    private final JavaMailSender mailSender;

    @Value("${spring.app.frontend.url}")
    private String frontendUrl;

    @Override
    public void sendVerificationEmail(String mail, String name, String token) throws MessagingException {

        String link = frontendUrl + "/?token=" + token;

        MimeMessage message = mailSender.createMimeMessage();

        String html = """
                <!DOCTYPE html>
                
                <html lang="pt-BR">
                <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Confirme seu e-mail - Onde Doar</title>
                </head>
                
                <body style="margin:0;padding:0;background:#f4f7fb;font-family:Arial,Helvetica,sans-serif;">
                
                <table width="100%" cellpadding="0" cellspacing="0" style="background:#f4f7fb;padding:40px 20px;">
                <tr>
                <td align="center">
                
                <table width="600" cellpadding="0" cellspacing="0" style="background:#ffffff;border-radius:24px;overflow:hidden;box-shadow:0 10px 40px rgba(0,0,0,0.08);">
                
                <!-- Header -->
                
                <tr>
                <td style="background:linear-gradient(135deg,#D62828,#B71C1C);padding:50px 40px;text-align:center;">
                
                <div style="
                width:80px;
                height:80px;
                background:white;
                border-radius:50%;
                margin:0 auto 20px auto;
                line-height:80px;
                font-size:40px;">
                🩸
                </div>
                
                <h1 style="
                margin:0;
                color:#ffffff;
                font-size:32px;
                font-weight:700;">
                Onde Doar
                </h1>
                
                <p style="
                margin:12px 0 0;
                color:#ffeaea;
                font-size:16px;">
                Conectando doadores e hemocentros
                </p>
                
                </td>
                </tr>
                
                <!-- Content -->
                
                <tr>
                <td style="padding:50px 40px;">
                
                <h2 style="
                margin-top:0;
                font-size:28px;
                color:#1f2937;
                text-align:center;">
                Confirme seu e-mail
                </h2>
                
                <p style="
                font-size:16px;
                line-height:28px;
                color:#4b5563;
                text-align:center;">
                Olá, <strong>{{NOME_USUARIO}}</strong>!
                </p>
                
                <p style="
                font-size:16px;
                line-height:28px;
                color:#4b5563;
                text-align:center;">
                Obrigado por se cadastrar na plataforma <strong>Onde Doar</strong>.
                Para ativar sua conta e começar a localizar hemocentros e oportunidades de doação, confirme seu endereço de e-mail.
                </p>
                
                <div style="text-align:center;margin:40px 0;">
                
                <a href="{{LINK_CONFIRMACAO}}"
                style="
                display:inline-block;
                padding:18px 40px;
                background:#D62828;
                color:#ffffff;
                text-decoration:none;
                font-size:16px;
                font-weight:bold;
                border-radius:14px;">
                Confirmar E-mail </a>
                
                </div>
                
                <p style="
                font-size:14px;
                line-height:24px;
                color:#6b7280;
                text-align:center;">
                Caso o botão não funcione, copie e cole o link abaixo no navegador:
                </p>
                
                <p style="
                font-size:13px;
                line-height:22px;
                text-align:center;
                word-break:break-all;
                color:#2563eb;">
                {{LINK_CONFIRMACAO}}
                </p>
                
                </td>
                </tr>
                
                <!-- Info Card -->
                
                <tr>
                <td style="padding:0 40px 40px;">
                
                <div style="
                background:#fff5f5;
                border-left:4px solid #D62828;
                padding:20px;
                border-radius:12px;">
                
                <p style="
                margin:0;
                font-size:14px;
                line-height:24px;
                color:#4b5563;">
                🔒 Este link expira em 24 horas por motivos de segurança.
                Se você não criou uma conta no Onde Doar, ignore este e-mail.
                </p>
                
                </div>
                
                </td>
                </tr>
                
                <!-- Footer -->
                
                <tr>
                <td style="
                background:#fafafa;
                padding:30px;
                text-align:center;
                border-top:1px solid #eeeeee;">
                
                <p style="
                margin:0;
                font-size:14px;
                color:#6b7280;">
                © 2026 Onde Doar
                </p>
                
                <p style="
                margin:10px 0 0;
                font-size:13px;
                color:#9ca3af;">
                Doe sangue. Transforme vidas.
                </p>
                
                <div style="margin-top:20px;">
                <span style="
                display:inline-block;
                width:10px;
                height:10px;
                background:#D62828;
                border-radius:50%;
                margin:0 4px;"></span>
                
                <span style="
                display:inline-block;
                width:10px;
                height:10px;
                background:#2563eb;
                border-radius:50%;
                margin:0 4px;"></span>
                
                <span style="
                display:inline-block;
                width:10px;
                height:10px;
                background:#D62828;
                border-radius:50%;
                margin:0 4px;"></span>
                
                </div>
                
                </td>
                </tr>
                
                </table>
                
                </td>
                </tr>
                </table>
                
                </body>
                </html>
                
                """;

        html = html.replace("{{NOME_USUARIO}}", name);
        html = html.replace("{{LINK_CONFIRMACAO}}", link);

        MimeMessageHelper helper =
                new MimeMessageHelper(message, true, "UTF-8");

        helper.setFrom("ondedoar@outlook.com.br");
        helper.setTo(mail);
        helper.setSubject("Onde Doar - Verificação de E-mail");

        helper.setText(html, true);

        mailSender.send(message);
    }

    @Override
    public void sendVerificationPasswordViaMail(String mail, String name, String token) throws MessagingException {

        String link = frontendUrl + "/?token=" + token;

        MimeMessage message = mailSender.createMimeMessage();

        String html = """
                <!DOCTYPE html>
                <html lang="pt-BR">
                <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Redefinir Senha - Onde Doar</title>
                </head>
                <body style="margin:0;padding:0;background:#f4f7fb;font-family:Arial,Helvetica,sans-serif;">
                <table width="100%" cellpadding="0" cellspacing="0" style="background:#f4f7fb;padding:40px 20px;">
                <tr>
                <td align="center">
                <table width="600" cellpadding="0" cellspacing="0" style="background:#ffffff;border-radius:24px;overflow:hidden;box-shadow:0 10px 40px rgba(0,0,0,0.08);">
                <tr>
                <td style="background:linear-gradient(135deg,#D62828,#B71C1C);padding:50px 40px;text-align:center;">
                <div style="width:80px;height:80px;background:white;border-radius:50%;margin:0 auto 20px auto;line-height:80px;font-size:40px;">🔐</div>
                <h1 style="margin:0;color:#ffffff;font-size:32px;font-weight:700;">Onde Doar</h1>
                <p style="margin:12px 0 0;color:#ffeaea;font-size:16px;">Recuperação de acesso</p>
                </td>
                </tr>
                <tr>
                <td style="padding:50px 40px;">
                <h2 style="margin-top:0;font-size:28px;color:#1f2937;text-align:center;">Redefina sua senha</h2>
                <p style="font-size:16px;line-height:28px;color:#4b5563;text-align:center;">Olá, <strong>{{NOME_USUARIO}}</strong>!</p>
                <p style="font-size:16px;line-height:28px;color:#4b5563;text-align:center;">Recebemos uma solicitação para redefinir a senha da sua conta no <strong>Onde Doar</strong>.</p>
                <p style="font-size:16px;line-height:28px;color:#4b5563;text-align:center;">Se foi você quem solicitou a alteração, clique no botão abaixo para criar uma nova senha.</p>
                <div style="text-align:center;margin:40px 0;">
                <a href="{{LINK_REDEFINICAO}}" style="display:inline-block;padding:18px 40px;background:#D62828;color:#ffffff;text-decoration:none;font-size:16px;font-weight:bold;border-radius:14px;">Redefinir Senha</a>
                </div>
                </td>
                </tr>
                <tr>
                <td style="padding:0 40px 40px;">
                <div style="background:#fff5f5;border-left:4px solid #D62828;padding:20px;border-radius:12px;">
                <p style="margin:0;font-size:14px;line-height:24px;color:#4b5563;">⚠️ Este link expira em 5 minutos por motivos de segurança.</p>
                <p style="margin-top:10px;font-size:14px;line-height:24px;color:#4b5563;">Caso você não tenha solicitado a redefinição de senha, ignore este e-mail. Sua conta permanecerá segura e nenhuma alteração será realizada.</p>
                </div>
                </td>
                </tr>
                <tr>
                <td style="background:#fafafa;padding:30px;text-align:center;border-top:1px solid #eeeeee;">
                <p style="margin:0;font-size:14px;color:#6b7280;">© 2026 Onde Doar</p>
                <p style="margin:10px 0 0;font-size:13px;color:#9ca3af;">Doe sangue. Transforme vidas.</p>
                </td>
                </tr>
                </table>
                </td>
                </tr>
                </table>
                </body>
                </html>
                """;

        html = html.replace("{{NOME_USUARIO}}", name);
        html = html.replace("{{LINK_REDEFINICAO}}", link);


        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setFrom("ondedoar@outlook.com.br");
        helper.setTo(mail);
        helper.setSubject("Onde Doar - Restauração da Senha");
        helper.setText(html, true);

        mailSender.send(message);
    }

}
