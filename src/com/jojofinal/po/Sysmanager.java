package com.jojofinal.po;

import java.io.Serializable;

public class Sysmanager implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sname;
	private String spassword;

	public Sysmanager() {
		// TODO Auto-generated constructor stub
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSpassword() {
		return spassword;
	}

	public void setSpassword(String spassword) {
		this.spassword = spassword;
	}

}
