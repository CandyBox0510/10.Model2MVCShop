<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--�⺻��¥ ��ǰ�̸� ���� �Ǹų�¥ �����ѻ��  -->

<html>
<head>
<title>�Ǹ� �Ϸ� ���</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function fncGetList(currentPage) {
		$('#currentPage').value(currentPage)
		$('form').attr("method","POST").attr("action","/purchase/listSale").submit();
	}
	
	$(function(){
		
		$("tr.ct_list_pop td:nth-child(3)").on("click" , function(){
			self.location = "/product/getProduct?comePath=saleList&menu=search&prodNo="+$(this).find('input').val();
			}
		})
	})
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/purchase/listSale" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">�Ǹ� �Ϸ� ���</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�Ǹų�¥</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0"/>
		<c:forEach var="sale" items="${list }">
			<c:set var="i" value="${i+1 }"/>
			<tr class="ct_list_pop">
			<td align="center">
				${i }
			</td>
			<td></td>
			
			<td align="left">
				${sale.purchaseProd.prodName }
				<input type="hidden" value="${sale.purchaseProd.prodNo }">
			</td>
			<td></td>
			<td align="left">${sale.purchaseProd.price }</td>
			<td></td>
			<td align="left">${sale.purchaseDate }</td>
			<td></td>
			<td align="center">
				${sale.buyer.userId }
			</td>
	</tr>
	</c:forEach>
	
	
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		
		 	<jsp:include page="../common/pageNavigator.jsp"/>		
		
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>