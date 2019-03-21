package impl;

import java.util.List;

import dto.MembersDTO;

public interface AppImpl {

	//리스트1
	public List<MembersDTO> acalist1();
	//리스트2
	public List<MembersDTO> acalist2(String button_name);
	//리스트3
	public List<MembersDTO> acalist3(String search_contents);
	//리스트4
	public List<MembersDTO> acalist4(String search_contents);
	//리스트5
	public List<MembersDTO> acalist5(String search_contents);
	//리스트6
	public List<MembersDTO> acalist6(String search_contents,String button_name);
	//리스트7
	public List<MembersDTO> acalist7(String search_contents,String button_name);
	//리스트8
	public List<MembersDTO> acalist8(String search_contents,String button_name);
}
