// Install the Java helper library from twilio.com/docs/java/install
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Application;

public class Example {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  public static final String AUTH_TOKEN = "your_auth_token";

  public static void main(String[] args) {
    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    // Get an object from its sid. If you do not have a sid,
    // check out the list resource examples on this page
    Application app = Application.updater("AP2a0747eba6abf96b7e3c3ff0b4530f6e")
        .setVoiceUrl("http://demo.twilio.com/docs/voice.xml")
        .setSmsUrl("http://demo.twilio.com/docs/sms.xml").update();

    System.out.println(app.getDateUpdated());
  }
}
