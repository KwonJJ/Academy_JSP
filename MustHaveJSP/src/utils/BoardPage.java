package utils;

public class BoardPage {
	
	public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
		String pagingStr = "";
		
		int totalPages = (int)(Math.ceil(((double)totalCount/pageSize))); // 전체 페이지 수
		
		int pageTemp = (((pageNum - 1)/ blockPage) * blockPage) + 1;
		
		// 1 ~ 5 페이지일 때 pageTemp는 1
		// 6 ~ 10 페이지일 때 pageTemp는 6
		// 11 ~ 15페이지일 때 pageTemp는 11
		// 첫 페이지와 이전 블록 출력
		if(pageTemp != 1) {
			pagingStr += "<a href = '" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href = '" + reqUrl + "?pageNum=" + (pageTemp - 1) + "'>[이전 블록]</a>";
		}
		//"?pageNum="(정상) -> "?pageNum = "(오류) : 이렇게 띄어쓰기 하면 숫자로 인식을 못함
		
		// 하단 중앙에 각 페이지 번호를 5개씩 출력
		int blockCount = 1;
		while(blockCount <= blockPage && pageTemp <= totalPages) {
			if(pageTemp == pageNum) {
				pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
			} else {
				pagingStr += "&nbsp; <a href = '" + reqUrl + "?pageNum=" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}
		
		// 다음 블록, 마지막 페이지 출력
		if(pageTemp <= totalPages) {
			pagingStr += "<a href = '" + reqUrl + "?pageNum=" + pageTemp + "'>[다음 블록]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href = '" + reqUrl + "?pageNum=" + totalPages + "'>[마지막 페이지]</a>";
		}
		
		return pagingStr;
	}
}
