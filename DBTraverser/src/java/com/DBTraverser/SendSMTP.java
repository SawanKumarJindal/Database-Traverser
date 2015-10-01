/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.DBTraverser;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;
import java.util.Date;
import properties.ReadFromProperties;
/**
 *
 * @author Administrator
 */
public class SendSMTP {
 public static void sendMail(String toEmailId, String text, String subject) {
        try {
             ReadFromProperties objServices=new ReadFromProperties();
        String validEmailId=objServices.getEmailId();
        String validPassword=objServices.getPassword();
//--[ Set up the default parameters
            Properties p = new Properties();
            p.put("mail.smtp.auth", "true");
            p.put("mail.transport.protocol", "smtp");
            p.put("mail.smtp.host", "smtp.gmail.com");
            p.put("mail.smtp.port", "25");
            p.put("mail.smtp.starttls.enable", "true");

//--[ Create the session and create a new mail message
            Authenticator auth = new SMTPAuthenticator(validEmailId, validPassword);
            Session mailSession = Session.getInstance(p, auth);
            Message msg = new MimeMessage(mailSession);

//--[ Set the FROM, TO, DATE and SUBJECT fields
            msg.setFrom(new InternetAddress(validEmailId));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmailId));
            
            msg.setSentDate(new Date());
            msg.setSubject(subject);

//--[ Create the body of the mail
            msg.setText(text);

//--[ Ask the Transport class to send our mail message
            System.out.println("trying to send msg ...........");
            Transport trans = mailSession.getTransport();
            trans.connect();
            Address[] ad = msg.getAllRecipients();
            for (int i = 0; i < ad.length; i++) {
                System.out.println("Sending to .... " + ad[i].toString());
                Address[] ad1 = new Address[1];
                ad1[0] = ad[i];
                System.out.println("sending email to actually useing ad1 and value of ad1 is ............." + ad[i].toString());
                trans.sendMessage(msg, ad1);
                System.out.println("msg sent to......" + ad[i].toString());
            }



        } catch (Exception E) {
            System.out.println("Something gone wrong while sending mail!");
            E.printStackTrace();
        }
    }
}
