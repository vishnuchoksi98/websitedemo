package com.DAO;

import java.sql.Timestamp;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.bean.cartbean;
import com.bean.dashboardbean;
import com.bean.productbean;
import com.bean.purchasebean;
import com.bean.userbean;
import com.sun.org.apache.xalan.internal.xsltc.runtime.Parameter;

public class productdao {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public int imagetry(MultipartFile photo,String name) throws IOException
	{
		byte[] photoBytes = photo.getBytes();
		String sql = "UPDATE productdetail set data='"+photoBytes+"' where name='"+name+"'";
		return template.update(sql);
	}

	public int save(productbean p,MultipartFile file) throws IOException {
		 System.out.println("pdata length:"+file.getSize());
		 //System.out.println("file name: "+photoBytes);
		String sql = "insert into productdetail(name,price,category,color,gweight,noofdiamond,dtype,dcolor,dweight,quality,description,filename,stock) values('"
				+ p.getName() + "'," + p.getPrice() + ",'" + p.getCategory() + "','" + p.getGcolor() + "','"
				+ p.getGweight() + "','" + p.getNoofdiamond() + "','" + p.getDtype() + "','" + p.getDcolor() + "','"
				+ p.getDweight() + "','" + p.getQuality() + "','" + p.getDescription() + "','" + p.getFilename()+ "','"+p.getStock()+"')";
		template.update(sql);
		byte[] photoBytes = file.getBytes();
		String name=p.getName();
		String sql1 = "update productdetail set data=? where name=?";

		return template.update(sql1, new Object[] { photoBytes,name });
	}

	public int purchaseentry(List<cartbean> p, userbean u,int counter) {
		// System.out.println(p.getName());
		java.util.Date date=new java.util.Date();
		//System.out.println("date:"+date.getYear());
		System.out.println("date:"+date.getTime());
		java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
		System.out.println("name:"+p.get(counter).getPbean().getName());
		String sql = "insert into orderdata(productid,customerid,productprice,quantity,ordertime,total) values"
				+ "('"+ p.get(counter).getPbean().getProId() + "','"+u.getCustomerid()+"','" + p.get(counter).getPbean().getPrice() + "','" + p.get(counter).getQuantity() + "','"+sqlTime+"','"+p.get(counter).getFinalprice()+"')";
		template.update(sql);
		int stock=p.get(counter).getPbean().getStock()-p.get(counter).getQuantity();
		int id=p.get(counter).getPbean().getProId();
		System.out.println("stock: "+stock+" id:"+id);
		String sql2 = "update productdetail set stock='"+stock +"'where proid='"+id+"'";
		System.out.println("sql 2 query :"+sql2);
		return template.update(sql2);
	}

	public int update(productbean p) {
		// System.out.println("in bean method "+p.getCategory());
		String sql = "update productdetail set name='" + p.getName() + "', price='" + p.getPrice() + "', category='"
				+ p.getCategory() + "',color='" + p.getGcolor() + "',gweight='" + p.getGweight() + "',noofdiamond='"
				+ p.getNoofdiamond() + "',dtype='" + p.getDtype() + "',dcolor='" + p.getDcolor() + "',dweight='"
				+ p.getDweight() + "',quality='" + p.getQuality() + "',description='" + p.getDescription()
				+ "' where proid='" + p.getProId() + "'";
		return template.update(sql);
	}

	public int delete(int id) {
		String sql = "delete from productdetail where proid=" + id + "";
		return template.update(sql);
	}

	public productbean getEmpById(int id) {
		System.out.println("sfter id:"+id);
		String sql = "select * from productdetail where proid=?";
		productbean p = (productbean) template.queryForObject(sql,new Object[] { id },
				new BeanPropertyRowMapper<productbean>(productbean.class));
		System.out.println("after one :"+p.getName());
		return p;
	}

	public userbean getcust(String name) {
		String sql = "select * from customer where email=?";
		userbean u = (userbean) template.queryForObject(sql, new Object[] { name },
				new BeanPropertyRowMapper<userbean>(userbean.class));
		return u;
	}

	public List<productbean> getEmployees() {
		return template.query("select * from productdetail ", new RowMapper<productbean>() {
			public productbean mapRow(ResultSet rs, int row) throws SQLException {
				productbean e = new productbean();
				e.setProId(rs.getInt(1));
				//System.out.println("1 is :"+e.getProId());
				e.setName(rs.getString(2));
				//System.out.println("1 is :"+e.getId());
				e.setPrice(rs.getInt(3));
				e.setGcolor(rs.getString(4));
				e.setGweight(rs.getFloat(5));
				e.setNoofdiamond(rs.getInt(6));
				//System.out.println("4 is" + rs.getString(4));
				e.setDtype(rs.getString(7));
				e.setDcolor(rs.getString(8));
				e.setDweight(rs.getFloat(9));
				e.setQuality(rs.getString(10));
				e.setDescription(rs.getString(11));
				e.setCategory(rs.getString(12));
				e.setFilename(rs.getString(13));
				e.setStock(rs.getInt(15));
				//e.setData(rs.getBytes(15));
				//System.out.println("14 is" + rs.getBytes(15));
				return e;
			}
		});
	}
	public Blob getPhotoById(int id) throws SQLException {

		String query = "select data from productdetail where proid=?";
		System.out.println("id"+id);
		Blob photo = template.queryForObject(query, new Object[] { id }, Blob.class);
		//System.out.println("main length:"+photo.getBytes(1,(int)photo.length()));
		return photo;
	}
	public List<productbean> getSelectedData(String category1) {
		System.out.println("in" + category1);
		return template.query("select * from productdetail where category='" + category1 + "';",
				new RowMapper<productbean>() {
					public productbean mapRow(ResultSet rs, int row) throws SQLException {
						productbean e = new productbean();
						e.setProId(rs.getInt(1));
						e.setName(rs.getString(2));
						e.setPrice(rs.getInt(3));
						e.setGcolor(rs.getString(4));
						e.setGweight(rs.getFloat(5));
						e.setNoofdiamond(rs.getInt(6));
						//System.out.println("4 is " + rs.getString(4));
						e.setDtype(rs.getString(7));
						e.setDcolor(rs.getString(8));
						e.setDweight(rs.getFloat(9));
						e.setQuality(rs.getString(10));
						e.setDescription(rs.getString(11));
						e.setCategory(rs.getString(12));
						e.setFilename(rs.getString(13));
						e.setStock(rs.getInt(15));
						return e;
					}
				});
	}
	
	public List<purchasebean> getPurchasedata() {		
		return template.query("select * from orderdata",
				new RowMapper<purchasebean>() {
					public purchasebean mapRow(ResultSet rs, int row) throws SQLException {
						purchasebean e = new purchasebean();
						e.setOrderid(rs.getInt(1));
						e.setProductid(rs.getInt(2));
						e.setCustomerid(rs.getInt(3));
						e.setOrdertime(rs.getString(4));
						e.setProductprice(rs.getInt(6));
						//System.out.println("4 is " + rs.getString(4));
						return e;
					}
				});
	}
	
		public List<dashboardbean> getTotalbills() {		
			return template.query("select fullname,sum(price),count(price),c.customerid  from student.orderdata o\r\n" + 
					"inner join  student.productdetail p  on p.proid=o.productid\r\n" + 
					"inner join student.customer c on o.customerid=c.customerid where usertype='user' group by fullname ;",
					new RowMapper<dashboardbean>() {
						public dashboardbean mapRow(ResultSet rs, int row) throws SQLException {
							dashboardbean e = new dashboardbean();
							e.setFullname(rs.getString(1));
							e.setTotal(rs.getInt(2));
							e.setTotalnoofproduct(rs.getInt(3));
							e.setCustomerid(rs.getInt(4));
							//System.out.println("4 is " + rs.getString(4));
							return e;
						}
					});
		}
	
//	public List<cartbean> getSelectedPurchasedata(String use,productbean pbean) {		
//		return template.query("select * from purchase where customeremail='"+use+"'",
//				new RowMapper<cartbean>() {
//					public cartbean mapRow(ResultSet rs, int row) throws SQLException {
//						cartbean e = new cartbean();
//						productbean p=new productbean();
//						e.setPbean(rs.getArray(pbean));
////						e.setId(rs.getInt(1));
////						e.setProductname(rs.getString(2));
////						e.setProductid(rs.getInt(3));
////						e.setProductprice(rs.getInt(4));
////						e.setCustomername(rs.getString(5));
////						e.setCustomeremail(rs.getString(6));
////						//System.out.println("4 is " + rs.getString(4));
////						e.setPurchasetime(rs.getString(7));
//						return e;
//					}
//				});
//	}
	
//	public List<productbean> findAll() {
//		String sql = "SELECT * FROM CUSTOMER";
//		List<purchase> customers = template.query(sql, new purchase());
//		return customers;
//	}


public List<productbean> getSelectedEmployee(int pageid,int total) {
	return template.query("select * from productdetail limit "+pageid+","+total, new RowMapper<productbean>() {
		public productbean mapRow(ResultSet rs, int row) throws SQLException {
			productbean e = new productbean();
			e.setProId(rs.getInt(1));
			//System.out.println("1 is :"+e.getProId());
			e.setName(rs.getString(2));
			//System.out.println("1 is :"+e.getId());
			e.setPrice(rs.getInt(3));
			e.setGcolor(rs.getString(4));
			e.setGweight(rs.getFloat(5));
			e.setNoofdiamond(rs.getInt(6));
			//System.out.println("4 is" + rs.getString(4));
			e.setDtype(rs.getString(7));
			e.setDcolor(rs.getString(8));
			e.setDweight(rs.getFloat(9));
			e.setQuality(rs.getString(10));
			e.setDescription(rs.getString(11));
			e.setCategory(rs.getString(12));
			e.setFilename(rs.getString(13));
			e.setStock(rs.getInt(15));
			//e.setData(rs.getBytes(15));
			//System.out.println("14 is" + rs.getBytes(15));
			return e;
		}
	});
}

}
