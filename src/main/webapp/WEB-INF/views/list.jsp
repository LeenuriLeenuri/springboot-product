<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>스프링 부트 연습하기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>상품 목록</h2>
		<hr />

		<button id="pro_all" type="button" class="btn btn-outline-info">전체보기</button>
		<button id="pro_fruit" type="button" class="btn btn-outline-danger">과일</button>
		<button id="pro_cook" type="button" class="btn btn-outline-primary">주방용품</button>
		<button id="pro_price" type="button" class="btn btn-outline-dark">가격순으로 정렬</button>
		<button id="pro_order" type="button" class="btn btn-outline-secondary">주문순으로 정렬</button>

		<table class="table table-dark table-striped mt-3">
			<thead>
				<tr id="fix">
					<th>ID</th>
					<th>NAME</th>
					<th>PRICE</th>
					<th>ORDER COUNT</th>
					<th>TYPE</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="product" items="${products}">
					<tr id="deleteBodys">
						<td class="deleteBody">${product.id}</td>
						<td class="deleteBody">${product.name}</td>
						<td class="deleteBody">${product.price}</td>
						<td class="deleteBody">${product.orderCount}</td>
						<td class="deleteBody">${product.type}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<script>


	
		$('#pro_all').on(
				'click',
				function() {

					// id, name, price, orderCount, type
					let data = {
						id : $('#id').val(),
						name : $('#name').val(),
						price : $('#price').val(),
						orderCount : $('#orderCount').val(),
						type : $('#type').val()
					};

					$.ajax({
						type : 'GET',
						url : '/all',
						dataType : 'json',
						
					}).done(
							function(result, XMLHttpRequest, textStatus) {

								type = "all";
								console.log(result);
								console.log('전체보기');
								console.log('XMLHttpRequest: ' + XMLHttpRequest);		
								console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
								console.log('textStatus: ' + textStatus);
								console.log('textStatus: ' + textStatus.status);

								$(".deleteBody").remove();

								for (i = result.length-1; i >= 0; i--) {
									$("#fix").after("<tr id='deleteBodys'>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].id + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].name + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].price + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].orderCount
													+ "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].type + "</td>")
									$("#deleteBodys").after("</tr>")
								}
							}).fail(function(XMLHttpRequest, textStatus, errorThrown) {
						console.log('XMLHttpRequest: ' + XMLHttpRequest);		
						console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
						console.log('textStatus: ' + textStatus);
						console.log('textStatus: ' + textStatus.status);
						console.log('errorThrown: ' + errorThrown);
						console.log('errorThrown: ' + errorThrown.status);
						
					});
				});


		$('#pro_fruit').on(
				'click',
				function() {

					let data = {
							id : $('#id').val(),
							name : $('#name').val(),
							price : $('#price').val(),
							orderCount : $('#orderCount').val(),
							type : $('#type').val()
						};

					$.ajax({
						type : 'GET',
						url : '/과일',
						dataType : 'json'

					}).done(
							function(result, XMLHttpRequest, textStatus) {
								type = "과일";
								console.log(result);
								console.log('과일');
								console.log('XMLHttpRequest: ' + XMLHttpRequest);		
								console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
								console.log('textStatus: ' + textStatus);
								console.log('textStatus: ' + textStatus.status);

								$(".deleteBody").remove();

								for (i = 0; i < result.length; i++) {
									$("#fix").after("<tr id='deleteBodys'>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].id + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].name + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].price + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].orderCount
													+ "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].type + "</td>")
									$("#deleteBodys").after("</tr>")
								}
							}).fail(function(XMLHttpRequest, textStatus, errorThrown) {
						console.log('XMLHttpRequest: ' + XMLHttpRequest);		
						console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
						console.log('textStatus: ' + textStatus);
						console.log('textStatus: ' + textStatus.status);
						console.log('errorThrown: ' + errorThrown);
						console.log('errorThrown: ' + errorThrown.status);
					});
				});

		
		$('#pro_cook').on(
				'click',
				function() {

					let data = {
							id : $('#id').val(),
							name : $('#name').val(),
							price : $('#price').val(),
							orderCount : $('#orderCount').val(),
							type : $('#type').val()
						};

					$.ajax({
						type : 'GET',
						url : '/주방용품',
						dataType : 'json'

					}).done(
							function(result, XMLHttpRequest, textStatus) {
								type = "주방용품";
								console.log(result);
								console.log('주방용품');
								console.log('XMLHttpRequest: ' + XMLHttpRequest);		
								console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
								console.log('textStatus: ' + textStatus);
								console.log('textStatus: ' + textStatus.status);

								$(".deleteBody").remove();

								for (i = 0; i < result.length; i++) {
									$("#fix").after("<tr id='deleteBodys'>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].id + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].name + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].price + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].orderCount
													+ "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].type + "</td>")
									$("#deleteBodys").after("</tr>")
								}
							}).fail(function(XMLHttpRequest, textStatus, errorThrown) {
						console.log('XMLHttpRequest: ' + XMLHttpRequest);		
						console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
						console.log('textStatus: ' + textStatus);
						console.log('textStatus: ' + textStatus.status);
						console.log('errorThrown: ' + errorThrown);
						console.log('errorThrown: ' + errorThrown.status);
					});
				});

		
		$('#pro_price').on(
				'click',
				function() {

					let data = {
							id : $('#id').val(),
						};

					$.ajax({
						type : 'GET',
						url : '/price/'+type,
						dataType : 'json'

					}).done(
							function(result, XMLHttpRequest, textStatus) {
								console.log(result);
								console.log('가격');
								console.log('XMLHttpRequest: ' + XMLHttpRequest);		
								console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
								console.log('textStatus: ' + textStatus);
								console.log('textStatus: ' + textStatus.status);

								$(".deleteBody").remove();

								for (i = 0; i < result.length; i++) {
									$("#fix").after("<tr id='deleteBodys'>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].id + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].name + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].price + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].orderCount
													+ "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].type + "</td>")
									$("#deleteBodys").after("</tr>")
								}
							}).fail(function(XMLHttpRequest, textStatus, errorThrown) {
						console.log('XMLHttpRequest: ' + XMLHttpRequest);		
						console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
						console.log('textStatus: ' + textStatus);
						console.log('textStatus: ' + textStatus.status);
						console.log('errorThrown: ' + errorThrown);
						console.log('errorThrown: ' + errorThrown.status);
					});
				});


		$('#pro_order').on(
				'click',
				function() {

					let data = {
							id : $('#id').val(),
						};

					$.ajax({
						type : 'GET',
						url : '/order/'+type,
						dataType : 'json'

					}).done(
							function(result, XMLHttpRequest, textStatus) {
								console.log(result);
								console.log('주문');
								console.log('XMLHttpRequest: ' + XMLHttpRequest);		
								console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
								console.log('textStatus: ' + textStatus);
								console.log('textStatus: ' + textStatus.status);

								$(".deleteBody").remove();

								for (i = 0; i < result.length; i++) {
									$("#fix").after("<tr id='deleteBodys'>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].id + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].name + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].price + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].orderCount
													+ "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].type + "</td>")
									$("#deleteBodys").after("</tr>")
								}
							}).fail(function(XMLHttpRequest, textStatus, errorThrown) {
						console.log('XMLHttpRequest: ' + XMLHttpRequest);		
						console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
						console.log('textStatus: ' + textStatus);
						console.log('textStatus: ' + textStatus.status);
						console.log('errorThrown: ' + errorThrown);
						console.log('errorThrown: ' + errorThrown.status);
					});
				});


		$('#pro_price').on(
				'click',
				function() {

					let data = {
							id : $('#id').val(),
							name : $('#name').val(),
							price : $('#price').val(),
							orderCount : $('#orderCount').val(),
							type : $('#type').val()
						};

					$.ajax({
						type : 'GET',
						url : '/price/'+type,
						dataType : 'json'

					}).done(
							function(result, XMLHttpRequest, textStatus) {
								console.log(result);
								console.log('전체 가격');
								console.log('XMLHttpRequest: ' + XMLHttpRequest);		
								console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
								console.log('textStatus: ' + textStatus);
								console.log('textStatus: ' + textStatus.status);

								$(".deleteBody").remove();

								for (i = 0; i < result.length; i++) {
									$("#fix").after("<tr id='deleteBodys'>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].id + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].name + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].price + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].orderCount
													+ "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].type + "</td>")
									$("#deleteBodys").after("</tr>")
								}
							}).fail(function(XMLHttpRequest, textStatus, errorThrown) {
						console.log('XMLHttpRequest: ' + XMLHttpRequest);		
						console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
						console.log('textStatus: ' + textStatus);
						console.log('textStatus: ' + textStatus.status);
						console.log('errorThrown: ' + errorThrown);
						console.log('errorThrown: ' + errorThrown.status);
					});
				});


		$('#pro_order').on(
				'click',
				function() {

					let data = {
							id : $('#id').val(),
							name : $('#name').val(),
							price : $('#price').val(),
							orderCount : $('#orderCount').val(),
							type : $('#type').val()
						};

					$.ajax({
						type : 'GET',
						url : '/order/'+type,
						dataType : 'json'

					}).done(
							function(result, XMLHttpRequest, textStatus) {
								console.log(result);
								console.log('전체 주문');
								console.log('XMLHttpRequest: ' + XMLHttpRequest);		
								console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
								console.log('textStatus: ' + textStatus);
								console.log('textStatus: ' + textStatus.status);

								$(".deleteBody").remove();

								for (i = 0; i < result.length; i++) {
									$("#fix").after("<tr id='deleteBodys'>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].id + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].name + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].price + "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].orderCount
													+ "</td>")
									$("#deleteBodys").append(
											"<td class='deleteBody'>" + result[i].type + "</td>")
									$("#deleteBodys").after("</tr>")
								}
							}).fail(function(XMLHttpRequest, textStatus, errorThrown) {
						console.log('XMLHttpRequest: ' + XMLHttpRequest);		
						console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
						console.log('textStatus: ' + textStatus);
						console.log('textStatus: ' + textStatus.status);
						console.log('errorThrown: ' + errorThrown);
						console.log('errorThrown: ' + errorThrown.status);
					});
				});
	</script>

</body>
</html>
