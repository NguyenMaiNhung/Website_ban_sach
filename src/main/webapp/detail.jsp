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
#h1 #h2 .col .tab-content #tab-pane-3 .row .col-md-6 #h4 #h5 {
	flex-direction: column;
}

#h1 #h2 .col .tab-content #tab-pane-3 .row .col-md-6 #h4 #h5 input {
	display: none;
}

#h1 #h2 .col .tab-content #tab-pane-3 .row .col-md-6 #h4 #h5 label {
	color: #444;
	transition: all 0.2s ease;
}

#h1 #h2 .col .tab-content #tab-pane-3 .row .col-md-6 #h4 #h5 input:not(:checked)
	 ~label:hover, #h1 #h2 .col .tab-content #tab-pane-3 .row .col-md-6 #h4 #h5 input:not(:checked)
	 ~label:hover ~label {
	color: #fd4;
}

#h1 #h2 .col .tab-content #tab-pane-3 .row .col-md-6 #h4 #h5 input:checked
	 ~label {
	color: #fd4;
}
</style>

<script type="text/javascript">
//Related carousel
$('.related-carousel').owlCarousel({
    loop: true,
    margin: 29,
    nav: false,
    autoplay: true,
    smartSpeed: 1000,
    responsive: {
        0: {
            items: 1
        },
        576: {
            items: 2
        },
        768: {
            items: 3
        },
        992: {
            items: 4
        }
    }
});
</script>

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
				<a href="" class="text-decoration-none">
					<h1 class="m-0 display-5 font-weight-semi-bold">
						<span class="text-primary font-weight-bold border px-3 mr-1">New</span>Book
					</h1>
				</a>
			</div>
			<div class="col-lg-6 col-6 text-left">
				<form action="search" method="post">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search for books" name="search">
						<div class="input-group-append">
							<span class="input-group-text bg-transparent text-primary">
								<i class="fa fa-search"></i>
							</span>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-3 col-6 text-right">
				<a href="cart" class="btn border"> <i
					class="fas fa-shopping-cart text-primary"></i> <span class="badge"></span>
				</a>
			</div>
		</div>
	</div>
	<!-- Topbar End -->


	<!-- Navbar Start -->
	<div class="container-fluid">
		<div class="row border-top px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a
					class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100"
					data-toggle="collapse" href="#navbar-vertical"
					style="height: 65px; margin-top: -1px; padding: 0 30px;">
					<h6 class="m-0">Categories</h6> <i
					class="fa fa-angle-down text-dark"></i>
				</a>
				<nav
					class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light"
					id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
					<div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
						<c:forEach items="${categories }" var="cate">
							<a href="cate?id=${cate.id }&&num=${1}" class="nav-item nav-link">${cate.name }</a>
						</c:forEach>
					</div>
				</nav>
			</div>
			<div class="col-lg-9">
				<nav
					class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
					<a href="" class="text-decoration-none d-block d-lg-none">
						<h1 class="m-0 display-5 font-weight-semi-bold">
							<span class="text-primary font-weight-bold border px-3 mr-1">New</span>Book
						</h1>
					</a>
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse">
						<div class="navbar-nav mr-auto py-0">
							<a href="home" class="nav-item nav-link">Home</a> <a
								href="shop?num=${0 }" class="nav-item nav-link">Shop</a>
							<c:if test="${account.role == 0 }">
								<a href="admin" class="nav-item nav-link">Admin</a>
							</c:if>
							<div class="nav-item dropdown">
								<a href="#" class="nav-link dropdown-toggle"
									data-toggle="dropdown">Pages</a>
								<div class="dropdown-menu rounded-0 m-0">
									<a href="ordered" class="dropdown-item">Check Ordered</a> <a
										href="checkout" class="dropdown-item">Checkout</a>
								</div>
							</div>
						</div>
						<div class="navbar-nav ml-auto py-0">
							<c:if test="${account == null }">
								<a href="login" class="nav-item nav-link">Login</a>
							</c:if>
							<c:if test="${account != null }">
								<a href="logout" class="nav-item nav-link">Logout</a>
							</c:if>
							<a href="register" class="nav-item nav-link">Register</a>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- Navbar End -->


	<!-- Page Header Start -->
	<div class="container-fluid bg-secondary mb-5">
		<div
			class="d-flex flex-column align-items-center justify-content-center"
			style="min-height: 300px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">Book
				Detail</h1>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="home">Home</a>
				</p>
				<p class="m-0 px-2">-</p>
				<p class="m-0">Book Detail</p>
			</div>
		</div>
	</div>
	<!-- Page Header End -->


	<!-- Shop Detail Start -->
	<div class="container-fluid py-5" id="h1">
		<div class="row px-xl-5">
			<div class="col-lg-5 pb-5">
				<div id="product-carousel" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner border">
						<div class="carousel-item active">
							<img class="w-100 h-100" src="${book.image }" alt="Image">
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-7 pb-5">
				<h3 class="font-weight-semi-bold">${book.title }</h3>
				<div class="d-flex mb-3">
					<div class="text-primary mr-2">
						<small class="fas fa-star"></small> <small class="fas fa-star"></small>
						<small class="fas fa-star"></small> <small
							class="fas fa-star-half-alt"></small> <small class="far fa-star"></small>
					</div>
					<small class="pt-1">(${list_comment_size } Reviews)</small>
				</div>
				<h3 class="font-weight-semi-bold mb-3">${book.gia_ban }đ</h3>
				<p class="mb-4">${book.describe }</p>
				<div class="d-flex mb-3">
					<p class="text-dark font-weight-medium mb-0 mr-3">Categories:</p>
					<div class="custom-control custom-control-inline">
						<c:set var="count" value="${1 }"></c:set>
						<c:forEach items="${list_cate_in_book }" var="cate_book">
							<label class="" for="size-1">${cate_book.name } <c:if
									test="${count < length_list }">
								,&nbsp;&nbsp;&nbsp;
								<c:set var="count" value="${count + 1 }"></c:set>
								</c:if>
							</label>
						</c:forEach>
					</div>
				</div>
				<div class="d-flex mb-3">
					<p class="text-dark font-weight-medium mb-0 mr-3">Tác giả:</p>
					<div class="custom-control custom-radio custom-control-inline">
						<label class="" for="color-1">${book.author }</label>
					</div>
				</div>
				<div class="d-flex mb-3">
					<p class="text-dark font-weight-medium mb-0 mr-3">Số trang:</p>
					<div class="custom-control custom-radio custom-control-inline">
						<label class="" for="color-1">${book.sotrang }</label>
					</div>
				</div>
				<div class="d-flex mb-3">
					<p class="text-dark font-weight-medium mb-0 mr-3">Nhà xuất bản:</p>
					<div class="custom-control custom-radio custom-control-inline">
						<label class="" for="color-1">${book.publisher }</label>
					</div>
				</div>
				<p class="text-danger">${mess_about_amount}</p>
				<form action="check?action=cart&&id=${book.id }&&page=${2}"
					method="post">
					<div class="d-flex align-items-center mb-4 pt-2">
						<div class="input-group quantity mr-3" style="width: 130px;">
							<div class="input-group-btn">
								<button class="btn btn-primary btn-minus" type="button">
									<i class="fa fa-minus"></i>
								</button>
							</div>
							<input type="text" class="form-control bg-secondary text-center"
								value="1" name="amount">
							<div class="input-group-btn">
								<button class="btn btn-primary btn-plus" type="button">
									<i class="fa fa-plus"></i>
								</button>
							</div>
						</div>
						<button class="btn btn-primary px-3" type="submit">
							<i class="fa fa-shopping-cart mr-1"></i> Add To Cart
						</button>
					</div>
				</form>
				<div class="d-flex pt-2">
					<p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
					<div class="d-inline-flex">
						<a class="text-dark px-2" href=""> <i
							class="fab fa-facebook-f"></i>
						</a> <a class="text-dark px-2" href=""> <i class="fab fa-twitter"></i>
						</a> <a class="text-dark px-2" href=""> <i
							class="fab fa-linkedin-in"></i>
						</a> <a class="text-dark px-2" href=""> <i
							class="fab fa-pinterest"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row px-xl-5" id="h2">
			<div class="col">
				<div
					class="nav nav-tabs justify-content-center border-secondary mb-4">
					<a class="nav-item nav-link active" data-toggle="tab"
						href="#tab-pane-3">Reviews (${list_comment_size })</a>
				</div>
				<div class="tab-content">
					<!-- reviews -->
					<div class="tab-pane fade show active" id="tab-pane-3">
						<div class="row">
							<div class="col-md-6">
								<h4 class="mb-4">${list_comment_size} reviews for
									${book.title }</h4>
								<c:forEach items="${list_comment }" var="com">
									<c:set var="stars" value="${com.number_star }"></c:set>
									<div class="media mb-4">
										<img src="img/user.jpg" alt="Image"
											class="img-fluid mr-3 mt-1" style="width: 45px;">
										<div class="media-body">
											<h6>
												${com.account.username }<small> - <i>${com.time_post }</i></small>
											</h6>
											<div class="text-primary mb-2">
												<c:if test="${stars == 1 }">
													<i class="fas fa-star"></i>
													<i class="far fa-star"></i>
													<i class="far fa-star"></i>
													<i class="far fa-star"></i>
													<i class="far fa-star"></i>
												</c:if>
												<c:if test="${stars == 2 }">
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="far fa-star"></i>
													<i class="far fa-star"></i>
													<i class="far fa-star"></i>
												</c:if>
												<c:if test="${stars == 3 }">
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="far fa-star"></i>
													<i class="far fa-star"></i>
												</c:if>
												<c:if test="${stars == 4 }">
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="far fa-star"></i>
												</c:if>
												<c:if test="${stars == 5 }">
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
												</c:if>
											</div>
											<p>${com.content }</p>
										</div>
									</div>
								</c:forEach>
							</div>


							<div class="col-md-6">
								<h4 class="mb-4">Leave a review</h4>
								<small>Your email address will not be published.
									Required fields are marked *</small>
								<form action="check?action=comment&&id=${book.id }&&page=${-1}"
									method="post">
									<div class="d-flex my-3" id="h4">
										<p class="mb-0 mr-2">Your Rating * :</p>
										<div class="text-primary d-flex flex-row-reverse" id="h5">
											<input type="radio" name="rate" id="rate-5" value="5">
											<label for="rate-5" class="fas fa-star"></label> <input
												type="radio" name="rate" id="rate-4" value="4"> <label
												for="rate-4" class="fas fa-star"></label> <input
												type="radio" name="rate" id="rate-3" value="3"> <label
												for="rate-3" class="fas fa-star"></label> <input
												type="radio" name="rate" id="rate-2" value="2"> <label
												for="rate-2" class="fas fa-star"></label> <input
												type="radio" name="rate" id="rate-1" value="1"> <label
												for="rate-1" class="fas fa-star"></label>
										</div>
									</div>
									<div class="form-group">
										<label for="message">Your Review *</label>
										<textarea id="message" cols="30" rows="5" class="form-control"
											name="text"></textarea>
									</div>
									<div class="form-group mb-0">
										<input type="submit" value="Leave Your Review"
											class="btn btn-primary px-3">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Shop Detail End -->


	<!-- Products Start -->
	<div class="container-fluid py-5">
		<div class="text-center mb-4">
			<h2 class="section-title px-5">
				<span class="px-2">You May Also Like</span>
			</h2>
		</div>
		<div class="row px-xl-5">
			<div class="col">
				<div class="owl-carousel related-carousel">
					<c:forEach items="${list_book_by_cate }" var="book_same">
						<div class="card product-item border-0">
							<div
								class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
								<img class="img-fluid w-100" src="${book_same.image }" alt="">
							</div>
							<div
								class="card-body border-left border-right text-center p-0 pt-4 pb-3">
								<h6 class="text-truncate mb-3">${book_same.title }</h6>
								<div class="d-flex justify-content-center">
									<h6>${book_same.gia_ban }đ</h6>
									<h6 class="text-muted ml-2">
										<del>${book_same.gia_goc }đ</del>
									</h6>
								</div>
							</div>
							<div
								class="card-footer d-flex justify-content-between bg-light border">
								<a href="detail?id=${book_same.id }"
									class="btn btn-sm text-dark p-0"><i
									class="fas fa-eye text-primary mr-1"></i>View Detail</a> <a
									href="check?action=cart&&id=${book_same.id }&&page=${1}"
									class="btn btn-sm text-dark p-0"><i
									class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- Products End -->


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