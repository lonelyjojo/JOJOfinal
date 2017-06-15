package com.jojofinal.po;

import java.io.Serializable;

public class Dish implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int did;
	private int rid;
	private int gnum;
	private int bnum;
	private String dname;
	private String dpic;

	public Dish() {
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getGnum() {
		return gnum;
	}

	public void setGnum(int gnum) {
		this.gnum = gnum;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getDpic() {
		return dpic;
	}

	public void setDpic(String dpic) {
		this.dpic = dpic;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "id:"+did+"菜名："+dname+"dpic:"+dpic;
	}

}
