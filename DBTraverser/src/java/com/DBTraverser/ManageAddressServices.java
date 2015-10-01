/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DBTraverser;


import com.bean.ManageStateBean;
import com.bean.ManageCountryBean;
import com.bean.ManageCityBean;
import com.common.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author student
 */
public class ManageAddressServices {

    public ArrayList getAllCountryList() {
        Connection con = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        Statement stmt = null;
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            rs = stmt.executeQuery("select Country_Id,Country_Name,if(Is_Active is null,'Inactive',if(Is_Active=1,'Active','Inactive')) as status from countrymaster ");

            while (rs.next()) {
                ManageCountryBean obj = new ManageCountryBean();
                obj.setTxtCountryId(rs.getInt("Country_Id"));
                obj.setTxtCountryName(rs.getString("Country_Name"));
                obj.setRbStatus(rs.getString("status"));
                al.add(obj);
            }
        } catch (Exception e) {
            System.out.println("getAllCountryList() " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("getAllCountryList()" + e);
            }
        }
        return al;
    }

    public void changeStatusOfCountry(String status, String id) {
        Connection con = null;
        Statement stmt = null;
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            if (status.equalsIgnoreCase("Active")) {
                int i = stmt.executeUpdate("update countrymaster set Is_Active=0 where Country_Id='" + id + "';");
            } else {
                int i = stmt.executeUpdate("update countrymaster set Is_Active=1 where Country_Id='" + id + "';");
            }

        } catch (Exception e) {
            System.out.println("changeStatusOfCountry() " + e);
        } finally {
            try {
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("changeStatusOfCountry()" + e);
            }
        }
    }

    public String addCountryDetail(ManageCountryBean obj) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String result = "record not added";
        try {
            con = ConnectDB.connect();
            pstmt = con.prepareStatement("insert into countrymaster(Country_Name,Is_Active) values(?,?)");
            pstmt.setString(1, obj.getTxtCountryName());
            pstmt.setString(2, obj.getRbStatus());
            System.out.println("1  " + pstmt);
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "added";
            }
        } catch (Exception e) {
            System.out.print("Exception in addCountryDetail()" + e);
        } finally {
            try {
                con.close();
                pstmt.close();
            } catch (Exception e) {
                System.out.print("Exception in finally of addCountryDetail()" + e);
            }
        }
        return result;
    }

    public ManageCountryBean viewCountryDetail(String countryid) {
        Connection con = null;
        ResultSet rs = null;
        Statement stmt = null;
        ManageCountryBean obj = new ManageCountryBean();
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            rs = stmt.executeQuery("select Country_Id,Country_Name,if(Is_Active is null,'Inactive',if(Is_Active=1,'Active','Inactive')) as status from countrymaster where Country_Id='" + countryid + "'");
            while (rs.next()) {
                obj.setTxtCountryId(rs.getInt("Country_Id"));
                obj.setTxtCountryName(rs.getString("Country_Name"));
                obj.setRbStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            System.out.println("viewCountryDetail() " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("in finally of viewCountryDetail()" + e);
            }
        }
        return obj;
    }

    public String updateCountryDetail(ManageCountryBean obj) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String result = "record not updated";
        try {
            con = ConnectDB.connect();
            pstmt = con.prepareStatement("update countrymaster set Country_Name=?,Is_Active=?,Update_Date=sysdate() where Country_Id=?");
            pstmt.setString(1, obj.getTxtCountryName());
            pstmt.setString(2, obj.getRbStatus());
            pstmt.setInt(3, obj.getTxtCountryId());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "updated";
            }
        } catch (Exception e) {
            System.out.print("Exception in updateCountryDetail()" + e);
        } finally {
            try {
                con.close();
                pstmt.close();
            } catch (Exception e) {
                System.out.print("Exception in finally of updateCountryDetail()" + e);
            }
        }
        return result;
    }

    public ArrayList getAllStateList(int id) {
        Connection con = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        Statement stmt = null;
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            rs = stmt.executeQuery("select State_Id,State_Name,if(Is_Active is null,'Active',if(Is_Active=1,'Active','Inactive')) as status from statemaster where Country_Id='" + id + "'");
            while (rs.next()) {
                ManageStateBean obj = new ManageStateBean();
                obj.setTxtStateId(rs.getInt("State_Id"));
                obj.setTxtStateName(rs.getString("State_Name"));
                obj.setRbStatus(rs.getString("status"));
                al.add(obj);
            }
        } catch (Exception e) {
            System.out.println("getAllStateList() " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("getAllStateList()" + e);
            }
        }
        return al;
    }

    public void changeStatusOfState(String status, String id) {
        Connection con = null;
        Statement stmt = null;
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            if (status.equalsIgnoreCase("Active")) {
                int i = stmt.executeUpdate("update statemaster set Is_Active=0 where State_Id='" + id + "';");
            } else {
                int i = stmt.executeUpdate("update statemaster set Is_Active=1 where State_Id='" + id + "';");
            }

        } catch (Exception e) {
            System.out.println("changeStatusOfState() " + e);
        } finally {
            try {
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("changeStatusOfState()" + e);
            }
        }
    }

    public String addStateDetail(ManageStateBean obj) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String result = "record not added";
        try {
            con = ConnectDB.connect();
            pstmt = con.prepareStatement("insert into statemaster(State_Name,Is_Active,Country_Id) values(?,?,?)");
            pstmt.setString(1, obj.getTxtStateName());
            pstmt.setString(2, obj.getRbStatus());
            pstmt.setInt(3, obj.getTxtCountryId());
            System.out.println("1  " + pstmt);
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "added";
            }
        } catch (Exception e) {
            System.out.print("Exception in addStateDetail()" + e);
        } finally {
            try {
                con.close();
                pstmt.close();
            } catch (Exception e) {
                System.out.print("Exception in finally of addStateDetail()" + e);
            }
        }
        return result;
    }

    public ManageStateBean viewStateDetail(String stateid) {
        Connection con = null;
        ResultSet rs = null;
        Statement stmt = null;
        ManageStateBean obj = new ManageStateBean();
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            rs = stmt.executeQuery("select State_Name,if(Is_Active is null,'Inactive',if(Is_Active=1,'Active','Inactive')) as status from statemaster where State_Id='" + stateid + "'");
            while (rs.next()) {
                obj.setTxtStateName(rs.getString("State_Name"));
                obj.setRbStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            System.out.println("viewStateDetail() " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("in finally of viewStateDetail()" + e);
            }
        }
        return obj;
    }

    public String updateStateDetail(ManageStateBean obj) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String result = "record not updated";
        try {
            con = ConnectDB.connect();
            pstmt = con.prepareStatement("update statemaster set State_Name=?,Is_Active=?,Update_Date=sysdate() where State_Id=?");
            pstmt.setString(1, obj.getTxtStateName());
            pstmt.setString(2, obj.getRbStatus());
            pstmt.setInt(3, obj.getTxtStateId());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "updated";
            }
        } catch (Exception e) {
            System.out.print("Exception in updateStateDetail()" + e);
        } finally {
            try {
                con.close();
                pstmt.close();
            } catch (Exception e) {
                System.out.print("Exception in finally of updateStateDetail()" + e);
            }
        }
        return result;
    }

    public ArrayList getAllCityList(int id) {
        Connection con = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        Statement stmt = null;
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            rs = stmt.executeQuery("select City_Id,City_Name,if(Is_Active is null,'Active',if(Is_Active=1,'Active','Inactive')) as status from citymaster where State_Id='" + id + "'");
            while (rs.next()) {
                ManageCityBean obj = new ManageCityBean();
                obj.setTxtCityId(rs.getInt("City_Id"));
                obj.setTxtCityName(rs.getString("City_Name"));
                obj.setRbStatus(rs.getString("status"));
                al.add(obj);
            }
        } catch (Exception e) {
            System.out.println("getAllCityList() " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("getAllCityList()" + e);
            }
        }
        return al;
    }

    public void changeStatusOfCity(String status, String id) {
        Connection con = null;
        Statement stmt = null;
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            if (status.equalsIgnoreCase("Active")) {
                int i = stmt.executeUpdate("update citymaster set Is_Active=0 where City_Id='" + id + "';");
            } else {
                int i = stmt.executeUpdate("update citymaster set Is_Active=1 where City_Id='" + id + "';");
            }

        } catch (Exception e) {
            System.out.println("changeStatusOfCity() " + e);
        } finally {
            try {
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("in finally of changeStatusOfCity()" + e);
            }
        }
    }

    public String addCityDetail(ManageCityBean obj) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String result = "record not added";
        try {
            con = ConnectDB.connect();
            pstmt = con.prepareStatement("insert into citymaster(City_Name,Is_Active,State_Id) values(?,?,?)");
            pstmt.setString(1, obj.getTxtCityName());
            pstmt.setString(2, obj.getRbStatus());
            pstmt.setInt(3, obj.getTxtStateId());
            System.out.println("1  " + pstmt);
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "added";
            }
        } catch (Exception e) {
            System.out.print("Exception in addCityDetail()" + e);
        } finally {
            try {
                con.close();
                pstmt.close();
            } catch (Exception e) {
                System.out.print("Exception in finally of addCityDetail()" + e);
            }
        }
        return result;
    }

    public ManageCityBean viewCityDetail(String cityid) {
        Connection con = null;
        ResultSet rs = null;
        Statement stmt = null;
        ManageCityBean obj = new ManageCityBean();
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            rs = stmt.executeQuery("select City_Name,if(Is_Active is null,'Inactive',if(Is_Active=1,'Active','Inactive')) as status from citymaster where City_Id='" + cityid + "'");
            while (rs.next()) {
                obj.setTxtCityName(rs.getString("City_Name"));
                obj.setRbStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            System.out.println("viewCityeDetail() " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("in finally of viewCityDetail()" + e);
            }
        }
        return obj;
    }

    public String updateCityDetail(ManageCityBean obj) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String result = "record not updated";
        try {
            con = ConnectDB.connect();
            pstmt = con.prepareStatement("update citymaster set City_Name=?,Is_Active=?,Update_Date=sysdate() where City_Id=?");
            pstmt.setString(1, obj.getTxtCityName());
            pstmt.setString(2, obj.getRbStatus());
            pstmt.setInt(3, obj.getTxtCityId());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "updated";
            }
        } catch (Exception e) {
            System.out.print("Exception in updateCityDetail()" + e);
        } finally {
            try {
                con.close();
                pstmt.close();
            } catch (Exception e) {
                System.out.print("Exception in finally of updateCityDetail()" + e);
            }
        }
        return result;
    }
}
