<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>���� ��ٱ���</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
		function fncGetList(currentPage) {
			$('#currentPage').value(currentPage)
			$('form').attr("method","POST").attr("action","/purchase/listPurchase").submit();
		}
		
		$(function(){
			$("tr.ct_list_pop td:nth-child(1)").on("click",function(){
				
			})			
		})		
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm">

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
		<td class="ct_list_b">��ٱ��� �������</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">���</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	
	<c:set var="i" value="0"/>
		<c:forEach var="purchase" items="${purchaseList }">
			<c:set var="i" value="${i+1 }"/>
			<tr class="ct_list_pop">
				<td align="center">
					������${i}
					<c:if test="${purchase.tranCode eq 1 }">
					<input type="hidden" value="/purchase/getPurchase?tranNo=${purchase.tranNo }">
					</c:if>
					<%-- <c:if test="${purchase.tranCode ne 1 }">
					${i}
					</c:if> --%>
				</td>
			<td></td>
			<td align="left">
				<%-- <a href="/getUser.do?userId=${user.userId }"> ${user.userId }</a> --%>
				<c:if test="${purchase.tranCode eq 1 }">
				<a href="/product/getProduct?&comePath=purchaser&menu=search&prodNo=${purchase.purchaseProd.prodNo }"> ${purchase.purchaseProd.prodName }</a>
				</c:if>
				<c:if test="${purchase.tranCode ne 1 }">
				${purchase.purchaseProd.prodName }
				</c:if>
			</td>
			<td></td>
			<td align="left">${user.userName }</td>
			<td></td>
			<td align="left">${user.phone }</td>
			<td></td>
			<td align="left">����
						<c:choose>
						<c:when test="${! empty purchase.tranCode && purchase.tranCode eq 1}">
							���ſϷ�
						</c:when>
						<c:when test="${! empty purchase.tranCode && purchase.tranCode eq 2}">
							�����
						</c:when>
						<c:when test="${! empty purchase.tranCode && purchase.tranCode eq 3}">
							��ۿϷ�
						</c:when>
					</c:choose>
						<!-- ${purchase.tranCode} -->
					���� �Դϴ�.</td>
			<td></td>
			<td align="left">	
			<c:if test="${! empty purchase.tranCode && purchase.tranCode eq 2}">
			<a href="/purchase/updateTranCode?tranNo=${purchase.tranNo }&tranCode=3">���ǵ���</a>
			</c:if>
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