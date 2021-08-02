<%--
    Document   : cart
    Created on : Jul 4, 2021, 5:14:31 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>View Cart Page</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" href="bootstrap/css/headers.css" />


        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }

        </style>

    </head>
    <body>
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="book" viewBox="0 0 16 16">

        <path fill-rule="evenodd" clip-rule="evenodd" d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"></path>
    </symbol>
    <symbol id="cart" viewBox="0 0 16 16">
        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
    </symbol>
    <symbol id="table" viewBox="0 0 16 16">
        <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z"/>
    </symbol>
    <symbol id="people-circle" viewBox="0 0 16 16">
        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
    </symbol>
    <symbol id="grid" viewBox="0 0 16 16">
        <path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"/>
    </symbol>
    </svg>
    <jsp:include page="include/nav.jsp"></jsp:include>
        <body>
        <c:if test="${sessionScope.LOGIN_USER.roleID != 'US'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <p class="lead"style="color: red">
            ${requestScope.ORDER_MESSAGE}
        </p>
        <c:if test="${requestScope.LIST_CART == null}">
            <h2 class="h6 d-flex flex-wrap justify-content-between align-items-center px-4 py-3 bg">Your cart is empty!<a class="font-size-sm" href="MainController?search=&action=SearchBook"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left" style="width: 1rem; height: 1rem;"><polyline points="15 18 9 12 15 6"></polyline></svg>Continue shopping</a></h2>

        </c:if>
        <c:if test="${requestScope.LIST_CART != null}">
            <div class="container pb-5 mt-n2 mt-md-n3">
                <div class="row">

                    <div class="col-xl-9 col-md-8">

                        <h2 class="h6 d-flex flex-wrap justify-content-between align-items-center px-4 py-3 bg"><span>Products</span><a class="font-size-sm" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left" style="width: 1rem; height: 1rem;"><polyline points="15 18 9 12 15 6"></polyline></svg>Continue shopping</a></h2>


                        <c:set var="total" value="0" ></c:set>
                        <c:forEach var="dto" items="${requestScope.LIST_CART}">
                            <form action="MainController">

                                <div class="d-sm-flex justify-content-between my-4">
                                    <div class="media d-block d-sm-flex text-center text-sm-left">
                                        <a class="cart-item-thumb mx-auto mr-sm-4" href="#"><img style="height: 300px;width: 240px" src="${dto.image}" alt="Product"></a>
                                        <div class="media-body pt-3">
                                            <h3 class="product-card-title font-weight-semibold border-0 pb-0"><a href="#">${dto.title}</a></h3>
                                            <div class="font-size-sm"><span class="text-muted mr-2">Category:</span>${dto.categoryID}</div>
                                            <div class="font-size-sm"><span class="text-muted mr-2">Author:</span>${dto.author}</div>
                                            <div class="font-size-lg text-primary pt-2">${dto.price} X ${dto.quantity} = ${dto.price*dto.quantity} VNĐ</div>
                                        </div>
                                    </div>
                                    <div class="pt-2 pt-sm-0 pl-sm-3 mx-auto mx-sm-0 text-center text-sm-left" style="max-width: 10rem;">
                                        <div class="form-group mb-2">
                                            <label for="quantity4">Quantity</label>
                                            <input class="form-control form-control-sm" type="number" name="quantity" id="quantity4" value="${dto.quantity}">
                                        </div>
                                        <button class="btn btn-outline-secondary btn-sm btn-block mb-2" type="submit" name="action" value="UpdateCart">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-refresh-cw mr-1">
                                            <polyline points="23 4 23 10 17 10"></polyline>
                                            <polyline points="1 20 1 14 7 14"></polyline>
                                            <path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"></path>
                                            </svg>Update cart</button>
                                        <input type="hidden" name="bookID" value="${dto.bookID}"/>
                                        <button class="btn btn-outline-danger btn-sm btn-block mb-2" type="submit" name="action" value="RemoveCart">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 mr-1">
                                            <polyline points="3 6 5 6 21 6"></polyline>
                                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                            <line x1="10" y1="11" x2="10" y2="17"></line>
                                            <line x1="14" y1="11" x2="14" y2="17"></line>
                                            </svg>
                                            Remove
                                        </button>
                                    </div>
                                    <input type="hidden" value="${total=total+dto.price*dto.quantity}">
                                </div>
                            </form>
                        </c:forEach>

                    </div>



                    <!-- Sidebar-->

                    <div class="col-xl-3 col-md-4 pt-3 pt-md-0">
                        <form action="MainController" method="GET">
                            <h2 class="h6 px-4 py-3 bg-secondary text-center">Subtotal</h2>
                            <div class="h3 font-weight-semibold text-center py-3">Total: ${total} VNĐ</div>
                            <hr>
                            <h4 class="mb-3">Payment</h4>

                            <select class="form-control" required="" name="paymentStatus">
                                <option value="">Payment option</option>
                                <option value="Credit Cart">Credit Card</option>
                                <option value="COD">COD</option>
                            </select>
                            <!--                        <div class="row gy-3">
                                                        <div class="col-md-6">
                                                            <label for="cc-name" class="form-label">Name on card</label>
                                                            <input type="text" class="form-control" id="cc-name" placeholder="" required>
                                                            <small class="text-muted">Full name as displayed on card</small>
                                                            <div class="invalid-feedback">
                                                                Name on card is required
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <label for="cc-number" class="form-label">Credit card number</label>
                                                            <input type="text" class="form-control" id="cc-number" placeholder="" required>
                                                            <div class="invalid-feedback">
                                                                Credit card number is required
                                                            </div>
                                                        </div>

                                                        <div class="col-md-3">
                                                            <label for="cc-expiration" class="form-label">Expiration</label>
                                                            <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
                                                            <div class="invalid-feedback">
                                                                Expiration date required
                                                            </div>
                                                        </div>

                                                        <div class="col-md-3">
                                                            <label for="cc-cvv" class="form-label">CVV</label>
                                                            <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                                                            <div class="invalid-feedback">
                                                                Security code required
                                                            </div>
                                                        </div>
                                                    </div>-->
                            <hr/>
                            <input type="hidden" name="total" value="${total}"/>
                            <button class="btn btn-primary btn-block" type="submit" name="action" value="AddOrder">Check Out</button>
                        </form>

                    </div>
                </div>
            </div>
        </c:if>
        <script src="bootstrap/js/bootstrap.js"></script>

    </body>
</html>
