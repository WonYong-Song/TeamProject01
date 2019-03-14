package Util;

public class RatingUtil {
	public static String ratingImg(int score) {
		String pagingStr="";
		
		if(score ==1) {
			pagingStr+="<span class='fa fa-star checked' ></span>" + 
		"					<span class='fa fa-star '></span>" + 
		"					<span class='fa fa-star '></span>" + 
		"					<span class='fa fa-star '></span>" + 
		"					<span class='fa fa-star'></span>";
		}
		if(score ==2) {
			pagingStr+="<span class='fa fa-star checked' ></span>" + 
		"					<span class='fa fa-star checked'></span>" + 
		"					<span class='fa fa-star '></span>" + 
		"					<span class='fa fa-star '></span>" + 
		"					<span class='fa fa-star'></span>";
		}
		if(score ==3) {
			pagingStr+="<span class='fa fa-star checked' ></span>" + 
		"					<span class='fa fa-star checked'></span>" + 
		"					<span class='fa fa-star checked'></span>" + 
		"					<span class='fa fa-star '></span>" + 
		"					<span class='fa fa-star'></span>";
		}
		if(score ==4) {
			pagingStr+="<span class='fa fa-star checked' ></span>" + 
		"					<span class='fa fa-star checked'></span>" + 
		"					<span class='fa fa-star checked'></span>" + 
		"					<span class='fa fa-star checked'></span>" + 
		"					<span class='fa fa-star'></span>";
		}
		if(score ==5) {
			pagingStr+="<span class='fa fa-star checked' ></span>" + 
		"					<span class='fa fa-star checked'></span>" + 
		"					<span class='fa fa-star checked'></span>" + 
		"					<span class='fa fa-star checked'></span>" + 
		"					<span class='fa fa-star checked'></span>";
		}
		
		return pagingStr;
	}	
}
