/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import com.sendgrid.Content;
import com.sendgrid.Method;
import com.sendgrid.Request;
import com.sendgrid.Response;
import com.sendgrid.SendGrid;
import com.sendgrid.Email;
import com.sendgrid.Mail;

/**
 *
 * @author ACER
 */
public class SendEmail {

    public static boolean sendEmail(String email, String message) {
        Email from = new Email("noreply@heaty566.com");
        Email to = new Email(email);
        Content content = new Content("text/plain", message);
        Mail mail = new Mail(from, "Confirm your order", to, content);
        SendGrid sg = new SendGrid("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");
        Request req = new Request();
        try {
            req.setMethod(Method.POST);
            req.setEndpoint("mail/send");
            req.setBody(mail.build());
            Response res = sg.api(req);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
