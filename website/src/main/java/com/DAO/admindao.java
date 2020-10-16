package com.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.bean.adduserbean;
import com.bean.dashboardbean;
import com.bean.purchasebean;
import com.bean.userbean;

public class admindao {
	JdbcTemplate template;
	dashboardbean d;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int adduser(adduserbean p) {
		// System.out.println(p.getName());
		String sql = "insert into customer (fullname,email,phoneno,password,usertype,status) values('" + p.getUserfullname()
				+ "','" + p.getUseremail() + "','" + p.getUserphoneno() + "','" + p.getUserpassword() + "','"
				+ p.getUsercategory() + "','"+0+"')";
		return template.update(sql);
	}

	public adduserbean getcustomer(int id) {
		// System.out.println(p.getName());
		String sql = "select * from customer where customerid=?";
		adduserbean u = (adduserbean) template.queryForObject(sql, new Object[] { id },
				new BeanPropertyRowMapper<adduserbean>(adduserbean.class));
		return u;
	}

	public int gettotalsale() {
		// System.out.println(p.getName());
		String sql = "select sum(price) as total  from student.orderdata o\r\n"
				+ "inner join  student.productdetail p  on p.proid=o.productid\r\n"
				+ "inner join student.customer c on o.customerid=c.customerid  ";
		int i = template.queryForObject(sql, Integer.class);
		System.out.println("i:" + i);
		return i;
		// return template.query(sql,);

	}

	public void statechange(int id) {
		// TODO Auto-generated method stub
		String sql = "select status from customer where customerid='" + id + "'";
		int i = template.queryForObject(sql, Integer.class);
		if (i == 1) {
			String sql1 = "update customer set status=0 where customerid='" + id + "'";
			template.update(sql1);
		} else {
			String sql1 = "update customer set status=1 where customerid='" + id + "'";
			template.update(sql1);
		}
	}
	
	/*public void salesdata() {
		String sql = "select fullname,price,c.customerid,p.name from student.orderdata o\r\n" + 
				"inner join  student.productdetail p  on p.proid=o.productid\r\n" + 
				"inner join student.customer c on o.customerid=c.customerid limit 10;";
		int i = template.queryForObject(sql,);

	}*/
	public List<Object> salesdata() {		
		return template.query("select fullname,price,c.customerid,p.name from orderdata o inner join  productdetail p  on p.proid=o.productid inner join customer c on o.customerid=c.customerid limit 10;",
				new RowMapper<Object>() {
					public List<Object> mapRow(ResultSet rs, int row) throws SQLException {
						List<Object> s=new ArrayList<Object>();
						s.add(rs.getString(1));
						s.add(rs.getInt(2));
						s.add(rs.getInt(3));
						s.add(rs.getString(4));
						//System.out.println("4 is " + rs.getString(4));
						return s;
					}
				});
	}
}
