package com.hk.jsp.vo;

public class MemberVo {
private String id;
private String passwd;
private String name;
private String resinum;
private String address;
private String address2;
private String phn;
private String email;
private int point;


public int getPoint() {
   return point;
}
public void setPoint(int point) {
   this.point = point;
}
private String zipcode;

public String getAddress2() {
   return address2;
}
public void setAddress2(String address2) {
   this.address2 = address2;
}

public String getZipcode() {
   return zipcode;
}
public void setZipcode(String zipcode) {
   this.zipcode = zipcode;
}

public String getId() {
   return id;
}
public void setId(String id) {
   this.id = id;
}
public String getPasswd() {
   return passwd;
}
public void setPasswd(String passwd) {
   this.passwd = passwd;
}
public String getName() {
   return name;
}
public void setName(String name) {
   this.name = name;
}
public String getResinum() {
   return resinum;
}
public void setResinum(String resinum) {
   this.resinum = resinum;
}
public String getAddress() {
   return address;
}
public void setAddress(String address) {
   this.address = address;
}

public String getPhn() {
   return phn;
}
public void setPhn(String phn) {
   this.phn = phn;
}
public String getEmail() {
   return email;
}
public void setEmail(String email) {
   this.email = email;
}

}
