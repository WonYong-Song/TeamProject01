package App;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import dto.MembersDTO;

public class AppDAO {

	//JDBC를 위한 멤버변수
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	//기본생성자
	public AppDAO() {}
	//인자생성자
	public AppDAO(String driver, String url) {
		try {
			Class.forName(driver);
			String id="kosmo";
			String pw="1234";
			con=DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결성공^^*");
		}
		catch(Exception e) {
			System.out.println("DB 연결실패ㅜㅜ");
			e.printStackTrace();
		}
	}
	
	public List<MembersDTO> acaList(String search_column, String search_contents, String button_name){
		
		List<MembersDTO> list = new Vector<MembersDTO>();
		
		String query = "";
		if((search_contents.equals("")||search_contents==null)&&(!button_name.equals("전체"))) {
			query=" select m.*,(select avg(score) from reviewwrite where acaidx=m.idx group by m.idx) score " + 
					" from  " + 
					"    ( " + 
					"    select a.idx,a.acaname,a.address,a.detailaddress,b.category,b.acaintrophoto " + 
					"    from members a inner join acaintroduce b on a.id=b.id " + 
					"    where b.category is not null and b.category='"+button_name+"' " + 
					"    ) m ";
		}
		else if ((search_contents.equals("")||search_contents==null)&&(button_name.equals("전체"))) {
			query=" select m.*,(select avg(score) from reviewwrite where acaidx=m.idx group by m.idx) score " + 
					" from  " + 
					"    ( " + 
					"    select a.idx,a.acaname,a.address,a.detailaddress,b.category,b.acaintrophoto " + 
					"    from members a inner join acaintroduce b on a.id=b.id " + 
					"    where b.category is not null " + 
					"    ) m ";
		}
		else {
			if(search_column.equals("이름")) {
				query=" select m.*,(select avg(score) from reviewwrite where acaidx=m.idx group by m.idx) score " + 
						" from  " + 
						"    ( " + 
						"    select a.idx,a.acaname,a.address,a.detailaddress,b.category,b.acaintrophoto " + 
						"    from members a inner join acaintroduce b on a.id=b.id " + 
						"    where b.category is not null and b.category='"+button_name+"' and a.acaname like '%"+search_contents+"%'" + 
						"    ) m ";
			}
			else if (search_column.equals("위치")) {
				query=" select m.*,(select avg(score) from reviewwrite where acaidx=m.idx group by m.idx) score " + 
						" from  " + 
						"    ( " + 
						"    select a.idx,a.acaname,a.address,a.detailaddress,b.category,b.acaintrophoto " + 
						"    from members a inner join acaintroduce b on a.id=b.id " + 
						"    where b.category is not null and b.category='"+button_name+"' and a.address like '%"+search_contents+"%'" + 
						"    ) m ";
			}
			else {
				query=" select m.*,(select avg(score) from reviewwrite where acaidx=m.idx group by m.idx) score " + 
						" from  " + 
						"    ( " + 
						"    select a.idx,a.acaname,a.address,a.detailaddress,b.category,b.acaintrophoto " + 
						"    from members a inner join acaintroduce b on a.id=b.id " + 
						"    where b.category is not null and b.category='"+button_name+"' and( a.acaname like '%"+search_contents+"%'or a.address like '%"+search_contents+"%')" + 
						"    ) m ";
			}
			
			try {
				psmt = con.prepareStatement(query);
				rs=psmt.executeQuery();
				while(rs.next()) {
					MembersDTO dto = new MembersDTO();
					dto.setAcaName(rs.getString(2));
					dto.setAddress(rs.getString(3));
					dto.setDetailAddress(rs.getString(4));
					dto.setCategory(rs.getString(5));
					dto.setAcaIntroPhoto(rs.getString(6));
					dto.setScore(rs.getDouble(7));
					
					list.add(dto);
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	
}
