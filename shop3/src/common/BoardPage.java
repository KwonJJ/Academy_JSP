package common;

public class BoardPage {

	public static String pagingStr(int totalCount, int postPage, int blockCount, int pageNum, int totalPage) {
		
		String pagingStr="";
		
		
		int pageTemp = (((pageNum - 1) / blockCount) * blockCount) + 1;
		// pageTemp 결과는 -> 1, 11, 21, 31, 41, 51....
		
		pagingStr += "<a href='boardmain.jsp?pageNum=1'>[처음으로]</a>";
		pagingStr += "&nbsp;";
		pagingStr += "<a href='boardmain.jsp?pageNum=" + (pageNum-1) + "'>[이전]</a>";
		
		int block=1;
		while(block <= blockCount && pageTemp <= totalPage) {
			if(pageTemp == pageNum) {
				pagingStr += "&nbsp;<a style='color:red' href='boardmain.jsp?pageNum=" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
			} else {
				pagingStr += "&nbsp;<a href='boardmain.jsp?pageNum=" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			block++;
		}
		
		pagingStr += "<a href='boardmain.jsp?pageNum=" + (pageNum+1) + "'>[다음]</a>";
		pagingStr += "&nbsp;";
		pagingStr += "<a href='boardmain.jsp?pageNum=" + totalPage + "'>[마지막으로]</a>";
		
		
		return pagingStr;
	}
	
	
}
