<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>


<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>${param.menu eq "search" ? "��ǰ�����ȸ" : "��ǰ ����"}</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">


 <c:if test="${wishSuccess eq 'success'}">
	 <script type="text/javascript">
	<!--
		alert("��ٱ��Ͽ� ��ϵǾ����ϴ�.");
	//-->
	</script>
 </c:if>


<script type="text/javascript">
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetList(currentPage) {
		$('#currentPage').val(currentPage);
		
		$('form').attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
	}
	
	$(function(){
		
		 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
			 fncGetList(1);
		 });

		 
		 $(".ct_list_pop td:nth-child(3)").tooltip({
				
				items:'[data-photo]',
				content:function(){
						var photo = $(this).data('photo');
					 return '<img src=../images/uploadFiles/'+photo+'/>';
				 },
				 classes: { "ui-tooltip" : "highlight"},
				 show: { effect: "blind", duration: 500 }
		})
			
		
		
		 //��ǰ�� Ŭ���� getProduct
		  $(".ct_list_pop td:nth-child(3)").on("click", function(){
			 console.log("����1 : "+$(this).find('input').val());
			 console.log("����2 : "+$($(this).find('input')[1]).val());
			 self.location = "/product/getProduct?prodNo="+$(this).find('input').val()+"&menu="+$($(this).find('input')[1]).val();
		 }) 
		 
		  $(".ct_list_pop td:nth-child(3)").each(function(index){
			 if($($(this).find('input')[2]).val() != ''){   //���� �Ǹ����� �ƴϸ�
				 if("${param.menu}" != "manage"){ //�Ŵ����� �ƴϸ�
				 	$(this).html('<del>'+$(this).html()+'</del>'); //�輱ǥ��
				 }else{
					switch($($(this).find('input')[2]).val()){
						case '1' :
						$(this).css("color" , "blue");
						break;
						case '2' : 
						$(this).css("color" , "green");
						break;
						case '3' : 
						$(this).css("color" , "red");
						break;
					}
				 }
			 }
		 })
		 
		 
		 $(".ct_list_pop td:nth-child(9) span").on("click", function(){
			 console.log("����1 : "+$(this).find('input').val());
			 self.location = "/purchase/updateTranCodeByProd?prodNo="+$(this).find('input').val()+"&tranCode=2";
		 })
		 
		 
		  $(".ct_list_pop td:nth-child(9)").each(function(index){
			 if($($(this).find('input')[0]).val() != ''){   //���� �Ǹ����� �ƴϸ�
				 if("${param.menu}" == "manage"){
					switch($($(this).find('input')[0]).val()){
						case '1' :
						$(this).css("color" , "blue");
						break;
						case '2' : 
						$(this).css("color" , "green");
						break;
						case '3' : 
						$(this).css("color" , "red");
						break;
					}
				 }
			 }else{
				 if("${param.menu}" != "manage"){
				 	$(this).css("color","red");
				 }
			 }
		 })
		 
		 
		 $(".ct_list_pop td:nth-child(11)").on("click", function(){
			 console.log("����1 : "+$(this).find('input').val());
			 if($(this).find('input').val() != null){
			 self.location = "/purchase/addWishPurchase?prodNo="+$(this).find('input').val();
			 }
		 })
		 
		 $(".ct_list_pop:nth-child(4n+6)").css("background-color" , "PapayaWhip");
		 
		var page = 1;
		$( window ).scroll(function() {
			 
			 if ($(window).scrollTop() == $(document).height() - $(window).height()){
				/* $.ajax({
						url:"/product/json/listProduct",
						method:"POST",
						headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
						},
						data:{
							currentPage : page++,
						},
						
						success : function(JSONData, status){
										
								
						}
						
				})//end ajax  */
				console.log(page++);
			 }//end if��
		}); 
		
		$( "input[name='searchKeyword']" ).autocomplete({
			
			source: function(request, response){

           	 			$.ajax({
					
								async : false,
						
								method : "POST",
								
								url : "/product/json/autoListProduct/",
								
								headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										   },
								
								data : JSON.stringify({
									
										name : encodeURIComponent(request.term)
										
										}),
								
								success : function(JSONData, status){
											 response(JSONData)
										  }
								})
           			 }
         });
		
	})
</script>
</head>


<!--  $("input[name='searchKeyword']").on("keyup",function(){
			
			var input = $(this).val().trim();
			if(input != ''){
				$.ajax({
					
					async : false,
					
					method : "POST",
					
					url : "/product/json/autoListProduct/",
					
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					
					data : JSON.stringify({
						
							name : encodeURIComponent(input)
							
							}),
					
					success : function(JSONData, status){
						         $( "#abcd" ).autocomplete({
						                     source: JSONData
						                   });
					}
				})
			}
		})  -->








<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm">

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
		<td colspan="4" >��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������&nbsp;&nbsp;&nbsp;</td>
		<c:if test="${param.menu eq 'manage' }">
			<td colspan="7">
			<font color="black">�� �Ǹ���&nbsp;</font>
			<font color="blue">�� ���ſϷ�/����ϱ�&nbsp;</font>
			<font color="green">�� �����&nbsp;</font>
			<font color="red">�� ��ۿϷ�</font>
			</td>
			

		</c:if>
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
				<td align="left" data-photo=${product.fileName }>
					<input type="hidden" value="${product.prodNo}">
					<input type="hidden" value="${param.menu}">
					<input type="hidden" value="${product.tranStatusCode }">
					${product.prodName }
				</td>	
				<td></td>
				<td align="left">${product.price }</td>
				<td></td>
				<td align="left">${product.regDate }</td>
				<td></td>
				<td align="left">
						<input type="hidden" value="${product.tranStatusCode }">
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
