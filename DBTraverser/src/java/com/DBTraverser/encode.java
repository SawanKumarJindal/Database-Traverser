/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DBTraverser;


public class encode {

    public String encoder(String query) {
        String a = query;
        String d = "";
        char b[] = query.toCharArray();
        for (int i = 0; i < b.length; i++) {
            b[i] = (char) ((int) (b[i] + 5));

        }
        for (int j = 0; j < b.length; j++) {
            d = d + b[j];

        }

        return d;
    }

    public String decoder(String query) {
        String a = query;
        String d = "";
        char b[] = query.toCharArray();
        for (int i = 0; i < b.length; i++) {
            b[i] = (char) ((int) (b[i] - 5));

        }
        for (int j = 0; j < b.length; j++) {
            d = d + b[j];

        }

        return d;
    }
}
