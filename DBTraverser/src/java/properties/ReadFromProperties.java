/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package properties;

import java.io.InputStream;
import java.util.Properties;

/**
 *
 * @author sumit
 */
public class ReadFromProperties {

    Properties p = null;
    InputStream is = null;

    public ReadFromProperties() {
        try {
            p = new Properties();
            is = getClass().getResourceAsStream("RootProperties.properties");
        } catch (Exception e) {
            System.out.println("in constructor of ReadFromProperties: " + e);
        }
    }

    public String getuploadPath() {
        String path = null;
        try {
            p.load(is);
            path = p.getProperty("path");
        } catch (Exception e) {
            System.out.println(e);
        }
        return path;
    }


    public String getEmailId() {
        String emailid = null;
        try {
            p.load(is);
            emailid = p.getProperty("emailid");
        } catch (Exception e) {
            System.out.println("in getEmailId of ReadFromProperties: " + e);
        }
        return emailid;
    }

    public String getPassword() {
        String password = null;
        try {
            p.load(is);
            password = p.getProperty("password");
        } catch (Exception e) {
            System.out.println("in getPassword of ReadFromProperties: " + e);
        }
        return password;
    }
}
