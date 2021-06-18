<%@ page language="java" contentType="text/html; charset=UTF-8"
    %>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<!DOCTYPE html>
<html>
<%
	MemberVo mem = new MemberVo();
%>


<head>
<meta charset="UTF-8">
<style>

</style>
</head>
<body>
		<form id="reg" action="reg_control.jsp" method="GET">
		<input type="text" id="regid" name="regid" placeholder="회원아1이디">
		<input type="button" id="checkid" value="중복확인" onclick="chkid()"><p>
		<input type="password" id="regpw" name="regpw" placeholder="회원비밀번호"><p>
		<input type="text" name="name" placeholder="이름"><p>
		<input type="text" name="regi" placeholder="주민번호"><p>
		<input type="email" name="email" placeholder="이메일"><p>
		<input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호" value="<%=mem.getZipcode()%>"><p>
		<input type="button" id="zipsearch" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" name="address" placeholder="주소" value="<%=mem.getAddress() %>"><p>
		<input type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소" value="<%=mem.getAddress2() %>"><p>	
		<input type="text" name="phn" placeholder="전화번호"><p>
		<button type="button" onclick="register();">회원가입</button>
		</form>
</body>


	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    // document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    // document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }


function register() {
	regform = document.getElementById("reg");
	regform.submit();
}

function chkid() {
	var userid = document.getElementById("regid").value;
	if(userid) {
		url = "checkid.jsp?id="+userid;
		window.open(url, "중복 체크", "width=400,height=250");
	}else{
		alert("아이디를 입력하시오!");
	}
}

</script>
</html>