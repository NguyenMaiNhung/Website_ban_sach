<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>EShopper - Bootstrap Shop Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<style>
.upload-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 0.5%;
}

.upload-container input[type="file"] {
	display: none;
}

.upload-button {
	background-color: #d19c97;
	color: #000;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
}

.upload-button:hover {
	color: #fff;
	background-color: #d78981;
}

#imagePreview {
	width: 400px;
	/* Độ rộng mới */
	height: 400px;
	/* Chiều cao mới */
	border: 1px dashed #ccc;
	overflow: hidden;
	margin-top: 20px;
}

#imagePreview img {
	max-width: 100%;
	max-height: 100%;
	object-fit: contain;
}

.checkbox {
	margin-bottom: 4px;
	padding-left: 27px;
	font-size: 1.2em;
	line-height: 27px;
	cursor: pointer;
}

.checkbox {
	position: relative;
	font-size: 1em;
	color: #555;
}

.checkbox:last-child {
	margin-bottom: 0;
}

.news_letter {
	color: #555;
	margin-bottom: 1em;
	display: block;
	transition: 0.5s all;
	-webkit-transition: 0.5s all;
	-moz-transition: 0.5s all;
	-o-transition: 0.5s all;
	clear: both;
}

.checkbox i {
	position: absolute;
	bottom: 5px;
	left: 0;
	display: block;
	width: 20px;
	height: 20px;
	outline: none;
	border: 2px solid #E1DFDF;
}

.checkbox input+i:after {
	content: '';
	background: url("img/tick1.png") no-repeat 1px 2px;
	top: -1px;
	left: -1px;
	width: 15px;
	height: 15px;
	font: normal 12px/16px FontAwesome;
	text-align: center;
}

.checkbox input+i:after {
	position: absolute;
	opacity: 0;
	transition: opacity 0.1s;
	-o-transition: opacity 0.1s;
	-ms-transition: opacity 0.1s;
	-moz-transition: opacity 0.1s;
	-webkit-transition: opacity 0.1s;
}

.checkbox input {
	position: absolute;
	left: -9999px;
}

.checkbox input:checked+i:after {
	opacity: 1;
}

.news-letter:hover {
	color: #00BFF0;
}
</style>
</head>

<body>
	<!-- Topbar Start -->
	<div class="container-fluid">
		<div class="row bg-secondary py-2 px-xl-5">
			<div class="col-lg-6 d-none d-lg-block">
				<div class="d-inline-flex align-items-center">
					<a class="text-dark" href="">FAQs</a> <span class="text-muted px-2">|</span>
					<a class="text-dark" href="">Help</a> <span class="text-muted px-2">|</span>
					<a class="text-dark" href="">Support</a>
				</div>
			</div>
			<div class="col-lg-6 text-center text-lg-right">
				<div class="d-inline-flex align-items-center">
					<a class="text-dark px-2" href=""> <i class="fab fa-facebook-f"></i>
					</a> <a class="text-dark px-2" href=""> <i class="fab fa-twitter"></i>
					</a> <a class="text-dark px-2" href=""> <i
						class="fab fa-linkedin-in"></i>
					</a> <a class="text-dark px-2" href=""> <i class="fab fa-instagram"></i>
					</a> <a class="text-dark pl-2" href=""> <i class="fab fa-youtube"></i>
					</a>
				</div>
			</div>
		</div>
		<div class="row align-items-center py-3 px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a href="admin" class="text-decoration-none">
					<h1 class="m-0 display-5 font-weight-semi-bold">
						<span class="text-primary font-weight-bold border px-3 mr-1">New</span>Book
					</h1>
				</a>
			</div>
		</div>
	</div>
	<!-- Topbar End -->

	<!-- Detail Start -->
	<form action="bookdetail" method="post">
		<div class="container-fluid pt-5">
			<div class="text-center mb-4">
				<h2 class="section-title px-5">
					<span class="px-2">Book</span>
				</h2>
			</div>
			<div class="row px-xl-5">
				<div class="col-lg-8">
					<div class="mb-4">
						<c:if test="${check_loop == 1}">
							<p class="text-danger">* This book is existed</p>
						</c:if>
						<c:if test="${check_array_null == 1}">
							<p class="text-danger">* Please choose category for this book</p>
						</c:if>
						<div class="row">
							<div class="col-md-6 form-group">
								<label>Tiêu Đề</label>
								<c:if test="${id_test <= -1 }">
									<input class="form-control" type="text" value="${book.title }"
										name="title" required="required">
								</c:if>
								<c:if test="${id_test > 0 }">
									<input class="form-control" type="text" value="${book.title }"
										name="title" readonly="readonly">
								</c:if>

							</div>
							<div class="col-md-6 form-group">
								<label>Tác Giả</label>
								<c:if test="${id_test <= -1 }">
									<input class="form-control" type="text" value="${book.author }"
										name="author" required>
								</c:if>
								<c:if test="${id_test > 0 }">
									<input class="form-control" type="text" value="${book.author }"
										name="author" readonly="readonly">
								</c:if>
							</div>

							<div class="col-md-6 col-lg-12 form-group">
								<label>Mô Tả</label>
								<c:if test="${id_test <= -1 }">
									<textarea class="form-control" name="describe" type="text"
										cols="50" rows="7" required="required">${book.describe }</textarea>
								</c:if>
								<c:if test="${id_test > 0 }">
									<textarea class="form-control" name="describe" type="text"
										cols="50" rows="7" readonly="readonly">${book.describe }</textarea>
								</c:if>

							</div>

							<div class="col-md-6 form-group">
								<label>Ngày Phát Hành</label>
								<c:if test="${id_test <= -1 }">
									<input class="form-control" type="number" value="${book.year }"
										name="year" required>
								</c:if>
								<c:if test="${id_test > 0 }">
									<input class="form-control" type="number" value="${book.year }"
										name="year" readonly="readonly">
								</c:if>

							</div>
							<div class="col-md-6 form-group">
								<label>Số Trang</label>
								<c:if test="${id_test <= -1 }">
									<input class="form-control" type="number"
										value="${book.sotrang }" name="sotrang" required="required">
								</c:if>
								<c:if test="${id_test > 0 }">
									<input class="form-control" type="number"
										value="${book.sotrang }" name="sotrang" readonly="readonly">
								</c:if>
							</div>

							<div class="col-md-6 form-group">
								<label>Giá Gốc</label>
								<c:if test="${id_test <= -1 }">
									<input class="form-control" type="number"
										value="${book.gia_goc }" name="gia_goc" required="required">
								</c:if>
								<c:if test="${id_test > 0 }">
									<input class="form-control" type="number"
										value="${book.gia_goc }" name="gia_goc" readonly="readonly">
								</c:if>
							</div>

							<div class="col-md-6 form-group">
								<label>Giá Bán</label>
								<c:if test="${id_test <= -1 }">
									<input class="form-control" type="number"
										value="${book.gia_ban }" name="gia_ban" required="required">
								</c:if>
								<c:if test="${id_test > 0 }">
									<input class="form-control" type="number"
										value="${book.gia_ban }" name="gia_ban" readonly="readonly">
								</c:if>
							</div>

							<div class="col-md-6 form-group">
								<label>Loại Bìa</label>
								<c:if test="${id_test <= -1 }">
									<input class="form-control" type="text"
										value="${book.loai_bia }" name="loai_bia" required="required">
								</c:if>
								<c:if test="${id_test > 0 }">
									<input class="form-control" type="text"
										value="${book.loai_bia }" name="loai_bia" readonly="readonly">
								</c:if>
							</div>

							<div class="col-md-6 form-group">
								<label>Số Lượng</label>
								<c:if test="${id_test <= -1 }">
									<input class="form-control" type="number"
										value="${book.amount }" name="amount" required="required">
								</c:if>
								<c:if test="${id_test > 0 }">
									<input class="form-control" type="number"
										value="${book.amount }" name="amount" readonly="readonly">
								</c:if>
							</div>

							<div class="col-md-6 form-group">
								<label>Nhà Xuất Bản</label>
								<c:if test="${id_test <= -1 }">
									<input class="form-control" type="text"
										value="${book.publisher }" name="publisher"
										required="required">
								</c:if>
								<c:if test="${id_test > 0 }">
									<input class="form-control" type="text"
										value="${book.publisher }" name="publisher"
										readonly="readonly">
								</c:if>
							</div>

							<div class="col-md-6 form-group">
								<label>Thể Loại</label>

								<c:if test="${id_test <= -1 }">
									<!--<select name="category" id="" class="form-control">
										<c:forEach items="${list_cate }" var="cate">
											<c:if test="${cate.id == id_cate_on_book }">
												<option value="${cate.id }" selected>${cate.name }</option>
											</c:if>

											<c:if test="${cate.id != id_cate_on_book }">
												<option value="${cate.id }">${cate.name }</option>
											</c:if>
										</c:forEach>
									</select>-->
									<div class="row">
										<c:forEach items="${list_cate }" var="cate">
											<c:if test="${cate.type == 1 }">
												<div class="col-lg-6">
													<div class="form-check">
														<label class="checkbox"> <input type="checkbox" value="${cate.id }"
															name="checkbox" checked="checked"><i></i>${cate.name }
														</label>
													</div>
												</div>
											</c:if>
											<c:if test="${cate.type == 0 }">
												<div class="col-lg-6">
													<div class="form-check">
														<label class="checkbox"> <input type="checkbox" value="${cate.id }"
															name="checkbox"><i></i>${cate.name }
														</label>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</c:if>
								<c:if test="${id_test > 0 }">
									<!--<select name="category" id="" disabled="disabled"
										class="form-control">
										<c:forEach items="${list_cate }" var="cate">
											<c:if test="${cate.id == id_cate_on_book }">
												<option value="${cate.id }" selected>${cate.name }</option>
											</c:if>

											<c:if test="${cate.id != id_cate_on_book }">
												<option value="${cate.id }">${cate.name }</option>
											</c:if>
										</c:forEach>
									</select>-->
									<div class="row">
										<c:forEach items="${list_cate }" var="cate">
											<c:if test="${cate.type == 1 }">
												<div class="col-lg-6">
													<div class="form-check">
														<label class="checkbox"> <input type="checkbox" disabled="disabled"
															name="checkbox" checked="checked" value="${cate.id }"><i></i>${cate.name }
														</label>
													</div>
												</div>
											</c:if>
											<c:if test="${cate.type == 0 }">
												<div class="col-lg-6">
													<div class="form-check">
														<label class="checkbox"> <input type="checkbox" disabled="disabled"
															name="checkbox" value="${cate.id }"><i></i>${cate.name }
														</label>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="mb-5">
						<div class="upload-container">
							<label for="imageUpload" class="upload-button">Upload</label> <input
								type="file" name="imageUpload" id="imageUpload"
								value="${book.image }">
							<div id="imagePreview"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card-footer border-secondary bg-transparent text-right">
			<c:if test="${id_test == -1 }">
				<button class="btn btn-lg btn-primary" type="submit"
					onclick="return confirm('Do you want add it?')">Add</button>
			</c:if>
			<c:if test="${id_test > 0 }">
				<button class="btn btn-lg btn-primary" type="submit"
					onclick="return confirm('do you want edit it?')">Edit</button>
			</c:if>
			<c:if test="${id_test <= -2 }">
				<button class="btn btn-lg btn-primary" type="submit"
					onclick="return confirm('do you want save it?')">Save</button>
			</c:if>
		</div>
	</form>
	<!-- Detail End -->

	<script>
		function previewImage(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('imagePreview');
				output.innerHTML = '<img src="' + reader.result + '" alt="Preview">';
			}
			reader.readAsDataURL(event.target.files[0]);
		}

		var imageUpload = document.getElementById('imageUpload');
		imageUpload.addEventListener('change', previewImage);
	</script>

	<script>
		// Chờ cho tài liệu HTML tải xong
		document.addEventListener("DOMContentLoaded", function() {
			// Lấy đối tượng div imagePreview
			var imagePreview = document.getElementById("imagePreview");

			// Tạo một đối tượng hình ảnh mặc định
			var defaultImage = new Image();
			defaultImage.src = '${book.image}';

			// Gán hình ảnh mặc định vào vùng xem trước
			imagePreview.appendChild(defaultImage);
		});
	</script>

	<!-- Footer Start -->
	<div class="container-fluid bg-secondary text-dark mt-5 pt-5">
		<div class="row px-xl-5 pt-5">
			<div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
				<a href="" class="text-decoration-none">
					<h1 class="mb-4 display-5 font-weight-semi-bold">
						<span
							class="text-primary font-weight-bold border border-white px-3 mr-1">New</span>Book
					</h1>
				</a>
				<p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna,
					ipsum no sit erat lorem et magna ipsum dolore amet erat.</p>
				<p class="mb-2">
					<i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street,
					New York, USA
				</p>
				<p class="mb-2">
					<i class="fa fa-envelope text-primary mr-3"></i>info@example.com
				</p>
				<p class="mb-0">
					<i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890
				</p>
			</div>
			<div class="col-lg-8 col-md-12">
				<div class="row">
					<div class="col-md-4 mb-5">
						<h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
						<div class="d-flex flex-column justify-content-start">
							<a class="text-dark mb-2" href="index.html"><i
								class="fa fa-angle-right mr-2"></i>Home</a> <a
								class="text-dark mb-2" href="shop.html"><i
								class="fa fa-angle-right mr-2"></i>Our Shop</a> <a
								class="text-dark mb-2" href="detail.html"><i
								class="fa fa-angle-right mr-2"></i>Shop Detail</a> <a
								class="text-dark mb-2" href="cart.html"><i
								class="fa fa-angle-right mr-2"></i>Shopping Cart</a> <a
								class="text-dark mb-2" href="checkout.html"><i
								class="fa fa-angle-right mr-2"></i>Checkout</a> <a class="text-dark"
								href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact
								Us</a>
						</div>
					</div>
					<div class="col-md-4 mb-5">
						<h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
						<div class="d-flex flex-column justify-content-start">
							<a class="text-dark mb-2" href="index.html"><i
								class="fa fa-angle-right mr-2"></i>Home</a> <a
								class="text-dark mb-2" href="shop.html"><i
								class="fa fa-angle-right mr-2"></i>Our Shop</a> <a
								class="text-dark mb-2" href="detail.html"><i
								class="fa fa-angle-right mr-2"></i>Shop Detail</a> <a
								class="text-dark mb-2" href="cart.html"><i
								class="fa fa-angle-right mr-2"></i>Shopping Cart</a> <a
								class="text-dark mb-2" href="checkout.html"><i
								class="fa fa-angle-right mr-2"></i>Checkout</a> <a class="text-dark"
								href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact
								Us</a>
						</div>
					</div>
					<div class="col-md-4 mb-5">
						<h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
						<form action="">
							<div class="form-group">
								<input type="text" class="form-control border-0 py-4"
									placeholder="Your Name" required="required" />
							</div>
							<div class="form-group">
								<input type="email" class="form-control border-0 py-4"
									placeholder="Your Email" required="required" />
							</div>
							<div>
								<button class="btn btn-primary btn-block border-0 py-3"
									type="submit">Subscribe Now</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="row border-top border-light mx-xl-5 py-4">
			<div class="col-md-6 px-xl-0 text-center text-md-right">
				<img class="img-fluid" src="img/payments.png" alt="">
			</div>
		</div>
	</div>
	<!-- Footer End -->


	<!-- Back to Top -->
	<a href="#" class="btn btn-primary back-to-top"><i
		class="fa fa-angle-double-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="mail/jqBootstrapValidation.min.js"></script>
	<script src="mail/contact.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>

</html>