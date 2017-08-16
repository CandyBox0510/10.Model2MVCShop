<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<html>
<head>
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<!-- <script type="text/javascript">
		 $(function(){
			$('form').attr("method","POST").attr("action", "/purchase/updatePurchase?tranNo="+$(this).find('input').val()).submit();
		 }) 
	</script> 
	
	이거 왜있는거지
	-->
</head>

</head>

<body>

<form name="updatePurchase">

<%-- <input type="hidden" value="${purchase.tranNo }"> 이거 왜있는거지 --%>

다음과 같이 구매가 되었습니다.

<table border=1>
	<tr>
		<td>물품번호</td>
		<td>${purchaseProd.prodNo }</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자아이디</td>
		<td>${buyer.userId }</td>
		<td></td>
	</tr>
	<tr>
		<td>구매방법</td>
		<td>${purchase.paymentOption eq 1 ? '현금구매' : '신용구매' }</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자이름</td>
		<td>${purchase.receiverName }</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자연락처</td>
		<td>${purchase.receiverPhone }</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자주소</td>
		<td>${purchase.dlvyAddr }</td>
		<td></td>
	</tr>
		<tr>
		<td>구매요청사항</td>
		<td>${purchase.dlvyRequest }</td>
		<td></td>
	</tr>
	<tr>
		<td>배송희망일자</td>
		<td>${purchase.dlvyDate }</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>