<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
<title>${param.menu eq "search" ? "��ǰ�����ȸ" : "��ǰ ����"}</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

 <c:if test="${wishSuccess eq 'success'}">
	 <script type="text/javascript">
	<!--
		alert("��ٱ��Ͽ� ��ϵǾ����ϴ�.");
	//-->
	</script>
 </c:if>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetList(currentPage) {
		$('#currentPage').val(currentPage);
		$('form').attr("method" , "POST").attr("action" , "/product/listProduct?menu="+$(this).find("input[type='hidden']")).submit();		
	}
	
	$(function(){
		
		 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
				fncGetList(1);
		 });
		 
		  /* $(".ct_list_pop td:nth-child(3)").on("click", function(){
			 console.log("����1 : "+$(this).find('input').val());
			 console.log("����2 : "+$($(this).find('input')[1]).val());
			 self.location = "/product/getProduct?prodNo="+$(this).find('input').val()+"&menu="+$($(this).find('input')[1]).val();
		 }) */
		 
		 $(".ct_list_pop td:nth-child(3)").tooltip({
			 content:"d";
		 })
		 
		 $(".ct_list_pop td:nth-child(9) span").on("click", function(){
			 console.log("����1 : "+$(this).find('input').val());
			 self.location = "/purchase/updateTranCodeByProd?prodNo="+$(this).find('input').val()+"&tranCode=2";
		 })
		 
		 $(".ct_list_pop td:nth-child(11)").on("click", function(){
			 console.log("����1 : "+$(this).find('input').val());
			 if($(this).find('input').val() != null){
			 self.location = "/purchase/addWishPurchase?prodNo="+$(this).find('input').val();
			 }
		 })
	})
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm">

<input type="hidden" value=${param.menu }>

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
							
							
							${param.menu eq "search" ? "��ǰ �����ȸ" : "��ǰ����"}
					
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">

				
				<option value="0" ${ !empty search.searchCondition && search.searchCondition eq 0 ? "selected" : "" }>��ǰ��</option>
				<option value="1" ${ !empty search.searchCondition && search.searchCondition eq 1 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="2" ${ !empty search.searchCondition && search.searchCondition eq 2 ? "selected" : "" }>��ǰ����</option>
				
			</select>
			<input 	type="text" name="searchKeyword"  value="${search.searchKeyword}" 
							class="ct_input_g" style="width:200px; height:19px" >
			<!--  -->
		</td>	
		
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!-- <a href="javascript:fncGetList('1');">�˻�</a> -->
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>

		<td colspan="11" >��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>

	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����
		<select name="searchSortPrice" onchange="this.form.submit()">
			<option value="0" ${ !empty search.searchSortPrice && search.searchSortPrice eq 0 ? "selected" : "" }>��ü����</option>
			<option value="1" ${ !empty search.searchSortPrice && search.searchSortPrice eq 1 ? "selected" : "" }>���� ���ݼ�</option>
			<option value="2" ${ !empty search.searchSortPrice && search.searchSortPrice eq 2 ? "selected" : "" }>���� ���ݼ�</option>
		</select>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>
		<td class="ct_line02"></td>
		<c:if test="${!empty param.menu && param.menu ne 'manage' }">
		<td class="ct_list_b">��ٱ���</td>
		</c:if>
		<c:if test="${!empty param.menu && param.menu eq 'manage' }">
		<td></td>
		</c:if>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0"/>
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${i+1}"/>
			<tr class="ct_list_pop">
				<td align="center">${i}</td>
				<td></td>		
				<td align="left" title=${product.fileName }>
					<%-- <a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a> --%>
					<input type="hidden" value="${product.prodNo}">
					<input type="hidden" value="${param.menu}">
					${product.prodName }
				</td>	
				<td></td>
				<td align="left">${product.price }</td>
				<td></td>
				<td align="left">${product.regDate }</td>
				<td></td>
				<td align="left">
				 
						<c:if test="${!empty param.menu && param.menu eq 'search'}">		
							<c:choose>
								<c:when test="${product.tranStatusCode eq null }">
									�Ǹ���
								</c:when>
								<c:when test="${product.tranStatusCode <= 2 && product.tranStatusCode>=1 }">
									������
								</c:when>
								<c:when test="${!empty product.tranStatusCode && product.tranStatusCode eq 3 }">
									�ǸſϷ�
								</c:when>
							</c:choose>
							<c:if test="${product.tranStatusCode ne null ? '������' : '�Ǹ���'}"></c:if>				
						</c:if>
						
						<c:if test="${!empty param.menu && param.menu eq 'manage' }">
							<c:choose>
								<c:when test="${product.tranStatusCode eq 1 }">
									<%-- ���ſϷ� / <a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=2">����ϱ�</a> --%>
									
									���ſϷ� / <span>����ϱ�<input type="hidden" value=${product.prodNo }></span>
								</c:when>
								<c:when test="${product.tranStatusCode eq 2 }">
									�����
								</c:when>
								<c:when test="${product.tranStatusCode eq 3 }">
									��ۿϷ�
								</c:when>
								<c:otherwise>
									�Ǹ���
								</c:otherwise>
							</c:choose>
						</c:if>
				</td>
				<td></td>
				<c:if test="${!empty param.menu && param.menu ne 'manage' }">
				<td align="center">
					<c:if test="${product.tranStatusCode ne null}">
					��ٱ��� �Ұ�(���X)
					</c:if>
					<c:if test="${product.tranStatusCode eq null}">
					<input type="hidden" value="${product.prodNo }" >
					<%-- <a href="/purchase/addWishPurchase?prodNo=${product.prodNo }">��ٱ��� ���</a> --%>
					��ٱ��� ���
					</c:if>
				</td>
			</c:if>	
		</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	</c:forEach>
	
	
	
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		
		<input type="hidden" id="currentPage" name="currentPage" value="0"/>
			
			<jsp:include page="../common/pageNavigator.jsp"/>	
    	
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>
