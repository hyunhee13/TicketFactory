<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>




<script type="text/javascript">

	function sendItQnaReply(boardNum,groupNum,showId){
		
		
		f = document.qnaForm;
		
		str = f.name.value;
		str = str.trim();
		if(!str){
			alert("\n작성자를 입력하세요.");
			f.name.focus();
			return;
		}			
			
		str = f.content.value;
		str = str.trim();
		if(!str){
			alert("\n내용을 입력하세요.");
			f.content.focus();
			return;
		}
		f.content.value = str;
		
		alert(groupNum);
		alert(showId);
		alert(boardNum);
		
		f.action = "created_okQnaReply.action?showId="+showId+"&groupNum="+groupNum+"&boardNum="+boardNum;
		
		f.submit();
	
	}
</script>


</head>
<body>

<div >
	
	<form action="" name="qnaForm" method="POST">
	<div >
		<div>
			<dl>
				<dt>작성자</dt>
				<dd>
					<input type="text" name="name" size="35" maxlength="20" class="boxTF"
					value="${sessionScope.loginDto}"/>
				</dd>							
			</dl>		
		</div>
		
		<div >
			<dl>
				<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
				<dd>
					<textarea rows="12" cols="63" name="content" class="boxTA"></textarea>
				</dd>							
			</dl>		
		</div> 
	
	</div>	
	
	<div id="bbsCreated_footer">
	<input type="button" value=" 얍얍 " class="btn2" 
	onclick="sendItQnaReply();"/>
	<input type="reset" value=" 다시입력 " class="btn2" 
	onclick="document.qnaForm.content.focus();"/>
	<input type="button" value=" 작성취소 " class="btn2" 
	onclick="javascript:location.href='<%=cp%>/layout.action?showId=${sessionScope.showId}&showName=${show.showName}';"/>	
	</div>
	
	<input type="hidden" name="groupNum" value="${groupNum }"/>
	<input type="hidden" name="parent" value="${boardNum }"/>
	
	</form>
	
</div>

</body>
</html>




































