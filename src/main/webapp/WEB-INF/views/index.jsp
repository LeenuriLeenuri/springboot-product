<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>스프링 부트 연습하기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>상품 목록</h2><hr/>

		<button id="pro_all" type="button" class="btn btn-outline-info">전체보기</button>
		<button id="pro_fruit" type="button" class="btn btn-outline-danger">과일</button>
		<button id="pro_cook" type="button" class="btn btn-outline-primary">주방용품</button>
		<button id="pro_price" type="button" class="btn btn-outline-dark">가격순으로 정렬</button>
		<button id="pro_order" type="button" class="btn btn-outline-secondary">주문순으로
			정렬</button>

		<table class="table table-dark table-striped mt-3">
			<thead>
				<tr id = "fix">
					<th>ID</th>
					<th>NAME</th>
					<th>PRICE</th>
					<th>ORDER COUNT</th>
					<th>TYPE</th>
				</tr>
			</thead>
			
			</tbody>
		</table>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<script>
	$(document).ready(function(){

		$('pro_all').on('click', function(){
			let data={
					id : $('#id').val(),
					name : $('#name').val(),
					price : $('#price').val(),
					orderCount : $('#orderCount').val(),
					type : $('#type').val()
					};

			$.ajax({
				type: 'GET',
				url: '/list',
				data: JSON.stringify(data),
				contentType: 'application/json; charset=utf-8',
				dataType: 'json'
				}).done(function(){
					if(result === 'ok')
						location.href=''
					})
			});
		
		});
	

	
	</script>

</body>
</html>
