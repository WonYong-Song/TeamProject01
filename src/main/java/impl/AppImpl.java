package impl;

import java.util.List;

import dto.MembersDTO;

public interface AppImpl {
	public List<MembersDTO> acaList1(String button_name);
	public List<MembersDTO> acaList2();
	public List<MembersDTO> acaList3(String column_name,String button_name,String search_contents);
	public List<MembersDTO> acaList4(String button_name,String search_contents);

}
