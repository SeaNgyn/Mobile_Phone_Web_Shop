/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.nio.charset.Charset;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Admin
 */
public class emailRegister {

    final static String from = "nguyentheanh2k3@gmail.com";
    final static String password = "fatc pwyz lann kxpk";

    public void sendMailRegister(String to, String user, String pass) {
        // Properties: khai bao cac thuoc tinh
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        // create authenticator 
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }

        };

        // Operation
        Session session = Session.getInstance(props, auth);

        // gui email
        //to = "nguyentheanhvnhn2k3@gmail.com";
        // tao mot tin nhan
        MimeMessage msg = new MimeMessage(session);

        try {
            // kieu noi dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            // nguoi gui
            msg.setFrom(from);
            // nguoi nhan
            msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(to, false));
            // tieu de cua email, them  + System.currentTimeMillis() de tranh lap email ten giong nhau
            msg.setSubject("Your Account");
            // quy dinh ngay gui
            msg.setSentDate(new Date());
            // quy dinh email nhan phan hoi
            // msg.setReplyTo(InternetAddress.parse(from, false));
            // Noi dung text bình thường

            //msg.setText("đây là nội dung", "UTF-8");
            // gửi bằng css html
            msg.setContent("<body>\n"
                    + "    <div>\n"
                    + "        <h2 style=\"color: green;\">Cảm ơn bạn đã đăng ký và đặt hàng!!!</h2>\n"
                    + "        <span style=\"color: red; font-weight: bold;\">Dưới đây là tài khoản của bạn, vui lòng đổi mật khẩu và không cho người lạ biết!!!</span>\n"
                    + "        <h3>Tài khoản: "+user+"</h3>\n"
                    + "        <h3>Mật khẩu: "+pass+"</h3>\n"
                    + "    </div>\n"
                    + "</body>", "text/html; charset=UTF-8");

            // gui email
            Transport.send(msg);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public static void main(String[] args) {

    }

}
