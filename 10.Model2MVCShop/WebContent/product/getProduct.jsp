<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javaScript">
	$(function(){
		
		$("td.ct_btn01:contains('����')[background='/images/ct_btnbg02.gif']").on("click",function(){
			
			self.location = "/purchase/addPurchase?prodNo="+$(this).find('input').val();
			
		})
		
		$("td.ct_btn01:contains('����')").on("click", function(){
			
			self.location = history.go(-1);
			
		})
		
		$("td.ct_btn01:contains('Ȯ��')").on("click", function(){
			
			self.location = "/product/listProduct?menu=manage"
			
		})
		
		$("td[width='30']:contains('��ۻ���')").on("click", function(){
			
			self.location = "/product/commentDelete?productCommentNo="+$(this).find("input").val()+"&prodNo=${product.prodNo}&menu=search"
			
		})
		
		$("input[value='��۵��']").on("click", function(){
			$("form[name='detailForm']").submit();
		})
	})
</script>

<title>Insert title here</title>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm" method="post" action=/product/getProduct>
<input type="hidden" name="prodNo" value=${product.prodNo }>

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"	width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">��ǰ����ȸ</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"  width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ��ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${product.prodNo}</td> 
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${product.prodName}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�̹��� <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<img src = "/images/uploadFiles/${product.fileName}">
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ������ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${product.prodDetail }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">��������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${product.manuDate }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">����</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${product.price}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${product.regDate}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>

	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">

		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<c:if test="${param.comePath ne null || param.menu eq 'search'}">
					<c:choose>
						<c:when test="${param.comePath eq 'purchaser' && param.menu eq 'search' }">
						</c:when>
						<c:when test="${param.comePath eq 'saleList' && param.menu eq 'search' }">
						</c:when>
						<c:when test="${param.comePath eq null && param.menu eq 'search' }">
							<c:if test="${product.tranStatusCode > 0 ? false : true}">
								<td width="17" height="23">
								<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
								</td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
								<%-- <a href="/purchase/addPurchase?prodNo=${product.prodNo }">����</a> --%>
								����
								<input type="hidden" value=${product.prodNo }>
								</td>				
								<td width="14" height="23">
								<img src="/images/ct_btnbg03.gif" width="14" height="23">
								</td>
							</c:if>
						</c:when>
					</c:choose>
				</c:if>
					
				<td width="30"></td>
		
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					
					<c:choose>
						<c:when test="${param.comePath eq null || param.comePath eq 'purchaser'
								     	|| param.comePath eq 'saleList'}">
							<!-- <a href="javascript:history.go(-1)">����</a> -->
							����
						</c:when>
						<c:when test="${param.comePath eq 'manage'}">
							<!-- <a href="/product/listProduct?menu=manage">Ȯ��</a> -->
							Ȯ��
						</c:when>
					</c:choose>
					
					
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
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��۸�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<c:set var="i" value="0"/>
	<c:forEach var="comments" items="${list}" >
		<c:set var="i" value="${i+1}"/>
		<tr>
			<td width="104" class="ct_write">
				${comments.userId} <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="105">${comments.comments}</td> 
					</tr>
				</table>
			</td>
			<td width="100" class="ct_write">
				${comments.regDate} <img src="/images/ct_icon_red.gif" width="3" height="3" align="right"/>
			</td>
			<td width="30">
				<c:if test="${user.userId eq comments.userId || user.userId eq 'admin' }">
				<%-- <a href="/product/commentDelete?productCommentNo=${comments.productCommentNo }&prodNo=${product.prodNo}&menu=search">��ۻ���</a> --%>
				<input type="hidden" name="productCommentNo" value="${comments.productCommentNo}">
				��ۻ���
				</c:if>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
	</c:forEach>
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
<tr>
	<td width="105">
		<input type="text" name="userComment" width="100%">
		<input type="button" value="��۵��">
	</td>
<tr>	
</table>

</form>

</body>
</html>