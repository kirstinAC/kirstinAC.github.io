<%-- Import the necessary Java classes --%>
<%@ page import="java.util.*" %>
<jsp:useBean id="pageHelper" scope="page" class="com.clientviews.pagecontrol.AcnRssFeedPageHelper"/>
<%

	List<List> rssList = pageHelper.getRssFeed("https://www.facebook.com/feeds/page.php?format=rss20&id=141620312598387", 4);
	List[] feedList = (List[]) rssList.toArray(new List[0]);

	for (int i = 0; i < feedList.length; i++)
	{
		String[] rssData = (String[]) feedList[i].toArray(new String[0]);

		String pubDate = rssData[0];
		String title = rssData[1];
		String link = rssData[2];
		
		if ((pubDate != null && pubDate.length() > 0) && 
			(title != null && title.length() > 0) &&
			(link != null && link.length() > 0))
		{
			out.println("<a href=\"" + link + "\" target=\"_blank\">");
			out.println("<h3>" + pubDate + "</h3>");
			out.println("<p>" + title + "</p>");
			out.println("</a>");
		}		
	}	
 	
%>
