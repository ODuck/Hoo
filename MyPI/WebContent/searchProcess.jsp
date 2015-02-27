<%@page import="java.util.ArrayList"%>
<%@page import="main.ranking.ProgressObserver"%>
<%@page import="main.search.MakeObject"%>
<%@page import="main.ranking.ImageStorage"%>
<%@page import="main.search.SearchResult"%>
<%@page import="java.util.Vector"%>
<%@page import="main.search.SearchDic"%>
<%@page import="main.ranking.ExtendedInfo"%>
<%@page import="main.ranking.Ranking"%>
<%@page import="main.extending.form.ExtendedStorage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<link rel="stylesheet" href="css/result.css" type="text/css">

<body>
	<%
		String memberEmail = (String) session.getAttribute("memEmail");

		if (memberEmail == null) {
	%>
	<script type="text/javascript">
		alert("로그인 정보가 없습니다.");
		location.replace("index.jsp");
	</script>
	<%
		} else {
			String client_str = (String) session.getAttribute("client_num");
			int client_num = Integer.parseInt(client_str);
			ProgressObserver observer = new ProgressObserver();
			Ranking ranking = new Ranking(client_num, observer);
			ExtendedInfo extend = new ExtendedInfo(memberEmail);
			SearchDic searchDic = new SearchDic(memberEmail); // binding 에 전달
			extend.makeKeywordMap();

			searchDic.bindingWord(extend.getKeywordMap());

			Vector<SearchResult> result = ranking.getResult(searchDic
					.getSearchWordList());
	%>
	<br>
	<br>
	<br>
	<br>
	<div id="solution" align="center">
		<!-- Summary -->
		<div class="moduleContainer">
			<!-- Title -->
			<div class="moduleDate describe">
				<span> <%
 	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(
 				"yyyy-MM-dd");
 		String today = formatter.format(new java.util.Date());
 		out.println(today);
 %></span>
			</div>
			<!-- Content -->
			<div class="moduleContent">
				<!-- Copyright -->
				<div class="copyright">
					<span>ⓒ Team Chaser</span>
				</div>
				<!-- Logo -->
				<div class="logo">
					<img src="images/ihfb/main_logo/logo_300x100.png">
				</div>
				<!-- Result Title -->
				<div class="gradeTitle">
					<p>
						<span><%=memberEmail%></span> 님의 MyPI 솔루션 검색 결과
					</p>
				</div>
				<!-- Security Grade -->
				<div class="gradeResult">
					<p>
						회원님의 보안 등급은
						<%=ranking.getGradeText()[0]%>
						입니다.
					</p>
				</div>
				<div class="gradeContent">
					<p>
						<%=ranking.getGradeText()[1]%>
					</p>
				</div>
			</div>
		</div>
		<!-- ↑ Summary End -->
		<!-- Graph -->
		<!-- Removed -->
		<!-- ↑ Graph End -->
		<!-- Images -->
		<div class="moduleContainer">
			<!-- Title -->
			<div class="moduleTitle">Images</div>
			<!-- Content -->
			<div id="image" class="moduleContent">
				<div class="describe">
					<p>MY-Pi 솔루션을 통해 찾아낸<br/> 회원님과 관련된 이미지 검색 결과입니다.</p>
				</div>
				<div class="div-tr">
					<%
						if (ImageStorage.getImgUrlList().size() == 0) {
								out.println("<p'>이미지 결과가 없습니다.</p>");
							} else {
								for (int i = 0; i < ImageStorage.getImgUrlList().size(); i++) {
					%>
					<div class="div-td" align="center"
						style="position: relative; width: 20%; height: 0; float: left; overflow: hidden; padding-bottom: 20%">
						<img src="<%=ImageStorage.getImgUrlList().get(i)%>"
							style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
					</div>
					<%
						if (i + 1 % 5 == 0) {
										out.println("<div style='claer:both;'></div>");
									}
								}
							}
					%>
				</div>
				<div style="clear: both;"></div>
			</div>
		</div>
		<!-- ↑ Images End -->
		<!-- Static Search -->
		<div class="moduleContainer">
			<!-- Title -->
			<div class="moduleTitle">Static Search</div>
			<!-- Content -->
			<div class="moduleContent">
				<div class="describe">
					<p>MY-Pi 솔루션을 통해 찾아낸 회원님의<br/>주요 신상정보 노출사이트 목록입니다.</p>
				</div>
				<div class="div-tr">
					<%
						if (ExtendedStorage.siteInfoList.size() == 0) {
								out.println("<p>주요 노출 사이트 결과가 없습니다.</p>");
							} else {
								for (int i = 0; i < ExtendedStorage.siteInfoList.size(); i++) {
					%>
					<div class="div-static">
						<a href="<%=ExtendedStorage.siteInfoList.get(i).getUrl()%>"
							target="_blank"><img
							src="<%=ExtendedStorage.siteInfoList.get(i)
								.getSiteImage()%>"
							width="100%" align="middle" alt="Image"></a>
					</div>
					<%
						}
							}
					%>
				</div>
				<div style="clear: both"></div>
			</div>
		</div>

		<!-- Dynamic Search -->
		<div class="moduleContainer">
			<div class="devider">
				<!--  Title -->
				<div class="moduleTitle">Dynamic Search</div>
				<!-- Content -->
				<div class="moduleContent">
					<div class="describe">
						MY-Pi 솔루션을 통해 찾아낸<br/>회원님의 개인정보가 담긴 웹 데이터 입니다.<br/> 총
						<%=result.size()%>개의 게시물이 검색되었습니다.<br/> 각 게시물을 클릭하시면, 간략한 내용과
						함께,<br/>해당 게시물을 삭제할 수 있는 솔루션이 제공됩니다.
					</div>
				</div>
			</div>
			<div style="clear: both"></div>
			<!-- Result Item -->
			<div class="moduleResult">
				<div class="list-no describe">
					<span>No.</span>
				</div>
				<div class="list-label describe">
					<span>Search Results</span>
				</div>
				<div style="clear: both"></div>
				<%
					for (int i = 0; i < result.size(); i++) {
				%>
				<div id="title<%=i + 1%>" class="list-head">
					<div class="list-no describe"><%=i + 1%></div>
					<div class="list-exp">
						<%
							double exp = result.get(i).getExposure();
									if (exp >= 120.0) {
										out.println("<img alt='" + exp
												+ "' src='images/ihfb/icons/risk_high.png'>");
									} else if (exp >= 20.0 && exp < 120.0) {
										out.println("<img alt='" + exp
												+ "' src='images/ihfb/icons/risk_mid.png'>");

									} else {
										out.println("<img alt='" + exp
												+ "' src='images/ihfb/icons/risk_low.png'>");
									}
						%>
					</div>
					<div class="list-title">
						<a class="title" href="<%=result.get(i).getURL()%>"
							target="_blank"><%=result.get(i).getTitle()%></a>
					
					
					</div>
					<div class="list-flip">
						<img class="filp ui-button" alt="flip"
							src="images/ihfb/icons/plus.png" onclick="_onFilp(<%=i + 1%>)">
					</div>

					<!-- <div style="clear: both"></div> -->
				</div>
				<!-- Result Content -->
				<div id="content<%=i + 1%>" class="resultContent">
					<!-- Upside -->
					<div class="upside">
						<div class="snippetContainer">
							<div class="snippetTitle listTitle">
								<span>검색된 내용<br/>미리보기</span>
							</div>
							<div class="snippetContent content"><%=result.get(i).getSnippet()%></div>
						</div>
						<div class="engineContainer">
							<div class="engineTitle listTitle">
								<span>이 결과가 검색<br/>되지 않게 하기</span>
							</div>
							<div class="engineContent content" style="float: right; width: 66%;">
								<%
									if (result.get(i).getEngine().matches(".*Naver.*") == true) {
								%>
								<jsp:include page="/Solution/Naver.jsp" flush="false" />
								<%
									} else if (result.get(i).getEngine().matches(".*Daum.*") == true) {
								%>
								<jsp:include page="/Solution/Daum.jsp" flush="false" />
								<%
									} else if (result.get(i).getEngine().matches(".*Google.*") == true) {
								%>
								<jsp:include page="/Solution/Google.jsp" flush="false" />
								<%
									}
								%>
							</div>
						</div>
						<div style="clear: both;"></div>
					</div>

					<!-- ↑ Upside End -->

					<!-- Downside -->
					<div class="downside">
						<div class="deleteTitle listTitle">
							<span>검색된 게시물 삭제하기</span>
						</div>
						<div class="deleteContainer content">
							<%
								if (result.get(i).getURL().matches(".*blog.naver.*") == true) {
							%>
							<jsp:include page="/Solution/NaverBlog.jsp" flush="false" />
							<%
								} else if (result.get(i).getURL().matches(".*kin.naver.*") == true) {
							%>
							<jsp:include page="/Solution/NaverKin.jsp" flush="false" />
							<%
								} else if (result.get(i).getURL()
												.matches(".*blog.cyworld.*") == true) {
							%>
							<jsp:include page="/Solution/CyworldBlog.jsp" flush="false" />
							<%
								} else if (result.get(i).getURL().matches(".*cyworld.*") == true) {
							%>
							<jsp:include page="/Solution/Cyworld.jsp" flush="false" />
							<%
								} else if (result.get(i).getURL().matches(".*blog.daum.*") == true) {
							%>
							<jsp:include page="/Solution/DaumBlog.jsp" flush="false" />
							<%
								} else if (result.get(i).getURL().matches(".*dreamwiz.*") == true) {
							%>
							<jsp:include page="/Solution/Dreamwiz.jsp" flush="false" />
							<%
								} else if (result.get(i).getURL().matches(".*egloos.*") == true) {
							%>
							<jsp:include page="/Solution/Egloos.jsp" flush="false" />
							<%
								} else if (result.get(i).getURL().matches(".*gallog.*") == true) {
							%>
							<jsp:include page="/Solution/Gallog.jsp" flush="false" />
							<%
								} else if (result.get(i).getURL().matches(".*me2day.*") == true) {
							%>
							<jsp:include page="/Solution/NaverMe2day.jsp" flush="false" />
							<%
								} else if (result.get(i).getURL().matches(".*tistory.*") == true) {
							%>
							<jsp:include page="/Solution/Tistory.jsp" flush="false" />
							<%
								} else if (result.get(i).getURL().matches(".*todayhumor.*") == true) {
							%>
							<jsp:include page="/Solution/TodayHumor.jsp" flush="false" />
							<%
								} else if (result.get(i).getURL().matches(".*twitter.*") == true) {
							%>
							<jsp:include page="/Solution/Twitter.jsp" flush="false" />
							<%
								}
							%>
						</div>

						<div style="clear: both;"></div>
					</div>
					<!-- ↑ Downside End -->
				</div>
				<!-- ↑ Result Content End -->
				<div style="clear: both"></div>
				<%
					}
						ImageStorage.getImgUrlList().clear();
						SearchDic.getSearchWordList().clear();
				%>

			</div>
			<!-- ↑ Result Item End -->
		</div>
		<!-- ↑ Dynamic Search End -->
	</div>
	<!-- ↑ Solution End -->
	<%
		}
	%>

</body>
</html>