package com.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.bean.loginbean;
import com.bean.productbean;
import com.bean.purchasebean;
import com.bean.userbean;

public class userdao {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int registration(userbean p) {
		// System.out.println(p.getName());
		String sql = "insert into customer (fullname,email,phoneno,password,status,usertype) values('" + p.getFullname() + "','"
				+ p.getEmail() + "','" + p.getPhoneno() + "','" + p.getPassword() + "','"+1+"','admin')";
		return template.update(sql);
	}

	public boolean loginvalid(loginbean l) {
		String loginsql = "select count(*) as number from customer where email='"+l.getUsername()+"' and password='"+l.getPassword()+"' and status=1";
		// List<User> users = jdbcTemplate.query(sql, new UserMapper());
		int i = template.queryForObject(loginsql, Integer.class);
		System.out.println("no of row fatched is :" + i);

		if(i>=1) {
			String loginsql1 = "select * from customer where email=? and password=?";
		
		loginbean p = (loginbean) template.queryForObject(loginsql1,new Object[] {  l.getUsername(),l.getPassword()  },
				new BeanPropertyRowMapper<loginbean>(loginbean.class));
		System.out.println("no of row fatched is :" + i);
		System.out.println("user type:"+l.getUsertype());
		l.setUsertype(p.getUsertype());
		//System.out.println("l username:");
		System.out.println("l password:"+l.getPassword());
		//System.out.println("p username:"+p.getUsername());
		//System.out.println("p password:"+p.getPassword());
		//if (p.getUsername().equals(l.getUsername()) && p.getPassword().equals(l.getPassword())) {
		//	System.out.println("user type:"+p.getUsertype());
			return true;
		//}
		
		}
		else {
			return false;
		}
	}

//	 
//	 public List<productbean> getSelectedData1(String email) {
//			System.out.println("in"+category1);
//			return template.query("select email from productdetail where email='"+email+"';", new RowMapper<productbean>() {
//				public productbean mapRow(ResultSet rs, int row) throws SQLException {
//					productbean e = new productbean();
//					e.setId(rs.getInt(1));
//					e.setName(rs.getString(2));
//					e.setPrice(rs.getInt(3));
//					e.setGcolor(rs.getString(4));
//					e.setGweight(rs.getFloat(5));
//					e.setNoofdiamond(rs.getInt(6));
//					System.out.println("4 is "+rs.getString(4));
//					e.setDtype(rs.getString(7));
//					e.setDcolor(rs.getString(8));
//					e.setDweight(rs.getFloat(9));
//					e.setQuality(rs.getString(10));
//					e.setDescription(rs.getString(11));
//					e.setCategory(rs.getString(12));
//					e.setFilename(rs.getString(13));
//					return e;
//				}
//			});
//			}
//	 
	public boolean getEmpByemail(String email) {
		String emailcheck = "select count(*) from customer where email='" +email+ "'";
		int i = template.queryForObject(emailcheck, Integer.class);
		System.out.println("no of row fatched is :" + i);
		if (i >= 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public List<userbean> getCustomer() {		
		return template.query("select * from customer where usertype='user' ",
				new RowMapper<userbean>() {
					public userbean mapRow(ResultSet rs, int row) throws SQLException {
						userbean e = new userbean();
						e.setFullname(rs.getString(2));
						e.setEmail(rs.getString(3));
						e.setPhoneno(rs.getString(4));
						e.setCustomerid(rs.getInt(1));
						e.setStatus(rs.getInt(7));
						//System.out.println("4 is " + rs.getString(4));
						return e;
					}
				});
	}
	public String getpassword(String checkuname) {
		String sql="select password from customer where email='"+checkuname+"'";
		//String empName = template.queryForObject(sql ,String.class);
		List<String> certs = template.queryForList(sql, String.class); 
		if(certs.isEmpty()) {
			return null;
		}
		else {
			return certs.get(0);
		}
		
	}
	

}
