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
	
	�̰� ���ִ°���
	-->
</head>

</head>

<body>

<form name="updatePurchase">

<%-- <input type="hidden" value="${purchase.tranNo }"> �̰� ���ִ°��� --%>

������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>
		<td>${purchaseProd.prodNo }</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
		<td>${buyer.userId }</td>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>
		<td>${purchase.paymentOption eq 1 ? '���ݱ���' : '�ſ뱸��' }</td>
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>
		<td>${purchase.receiverName }</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<td>${purchase.receiverPhone }</td>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>
		<td>${purchase.dlvyAddr }</td>
		<td></td>
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<td>${purchase.dlvyRequest }</td>
		<td></td>
	</tr>
	<tr>
		<td>����������</td>
		<td>${purchase.dlvyDate }</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>