<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import ="hmjm.bean.member.*" %>
<%@ page import ="hmjm.bean.member.memberVO" %>

<html>
<head><title> 탈잉 ID 중복확인</title>


<% request.setCharacterEncoding("utf-8");%>

<%
    String m_email = request.getParameter("m_email");
	memberDAO manager = memberDAO.getInstance();
    int check = manager.confirmId(m_email);
 %>
 

<body>
<%
    if(check == 1){
%>
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr bgcolor="yellow"> 
    <td height="39"><%=m_email%>사용중인 아이디(이메일)입니다.</td>
  </tr>
</table>
<form name="checkForm" method="post" action="confirmId.jsp">

<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="center"> 
       <p>다른 이메일을 선택하세요.<p>
       <input type="text" size="10" maxlength="12" name="m_email"> 
       <input type="submit" value="이메일 중복확인">
    </td>
  </tr>
</table>
</form>
<%
    } else {
%>

<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr bgcolor="yellow"> 
    <td align="center"> 
      <p>입력하신 <%=m_email%>는 사용하실 수 있는 이메일입니다.</p>
	  <input type="button" value="닫기" onclick="setid()">
    </td>
  </tr>
</table>

<%
    }
%>
</body>
</html>
<script language="javascript">

  function setid(){		
    	opener.document.member.m_email.value="<%=m_email%>"; 
		self.close();
		}
		
</script>
