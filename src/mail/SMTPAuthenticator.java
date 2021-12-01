package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator{
	@Override
	protected PasswordAuthentication getPasswordAuthentication(){
		return new PasswordAuthentication("ijuyun83@gmail.com","1q2w3e4r1!");
	}
}