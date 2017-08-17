<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- �⺻����, ��ǰ��, ��ǰ����, �����,  -->

<html>
<head>
<title>���� ��ٱ���</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function fncGetList(currentPage) {
		$('#currentPage').value(currentPage)
		$('form').attr("method","POST").attr("action","/purchase/listWishPurchase").submit();
	}
	
	$(function(){
		/* 
		alert($(this).find("input[name='status']").val());
		$(this).text($(this).text+$(this).find("input[name='status']").val());
		 */
		$("tr.ct_list_pop td:nth-child(3)").on("click" , function(){
			var url = $(this).find("input").val();
			if(url!=null){
				self.location = url;
			}
		})
		
		$("tr.ct_list_pop td:nth-child(9)").on("click" , function(){
			self.location = "/purchase/cancelWishPurchase?wishNo="+$(this).find('input').val();
		})
		
		
		$(".ct_list_pop:nth-child(2n+5)").css("background-color" , "PapayaWhip");
	})
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/purchase/listWishPurchase" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� ��ٱ��� ��ȸ</td>
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
		<td class="ct_list_b">��ǰ �������</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ٱ��� ���</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0"/>
		<c:forEach var="wish" items="${list }">
			<c:set var="i" value="${i+1 }"/>
			<tr class="ct_list_pop">
			<td align="center">
				${i}
			</td>
			<td></td>
			
			<td align="left">
				${wish.purchaseProd.prodName }
				<c:if test="${wish.tranStatusCode eq null}">
					<input type="hidden" value="/product/getProduct?&menu=search&prodNo=${wish.purchaseProd.prodNo }">
				</c:if> 
				<c:if test="${!empty wish.tranStatusCode}">
					<input type="hidden" name="status" value="(���źҰ� ���X)">
				</c:if>
				
			</td>
			<td></td>
			<td align="left">${wish.purchaseProd.price }</td>
			<td></td>
			<td align="left">${wish.purchaseProd.regDate }</td>
			<td></td>
			<td align="center">
				���
				<input type="hidden" value="${wish.wishNo }"> 
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