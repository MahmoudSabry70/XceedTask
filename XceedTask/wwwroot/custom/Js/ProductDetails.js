"use strict";
//------------------------------------------------------------------------------------------------------------------ Signalr connection
//create connection
var connectionUserCount = new signalR.HubConnectionBuilder()
    //.configureLogging(signalR.LogLevel.Information)
    .withAutomaticReconnect()
    .withUrl("/OrderHub", signalR.HttpTransportType.WebSockets).build();
//debugger;
//connect to methods that hub invokes aka receive notfications from hub
connectionUserCount.on("ReceiveUpdate", (value) => {
    console.log(value);

    // notifyAddToCart("The products in the cart have been updated", "warning", "En", false, false);

    var element = document.getElementById(`checkout-${value}`);
    if (element) { reloadPageCheckOut() }
});

//invoke hub methods aka send notification to hub
function newWindowLoadedOnClient() {
    // connectionUserCount.send("GetAllComplain");
}

//start connection
function fulfilled() {
    //do something on start
    console.log("Connection to User Hub Successful");
}
function rejected() {
    //rejected logs
}
connectionUserCount.onclose((error) => {
    console.log("Connection to User Hub Closed");
});

connectionUserCount.start().then(fulfilled, rejected);

//-------------------------------------------------------------------------------------------------------------------- add to cart
function addToCart(productId, lang) {
    // Check if there are colors

    var colorId = null;
    var sizeId = null;
    var quantity = 1;

    if ($('.colors').length > 0) {
        // Check if a color is selected
        var selectedColor = $('.colors.active');
        if (selectedColor.length === 0) {
            // Display error message for not selecting a color
            $('.error-message-Color').text(lang == "En" ? "Select Color" : "اختر اللون");
            return;
        }

        colorId = selectedColor.attr('id');
        console.log("Color Id: " + colorId);
    }

    // Check if there are sizes
    if ($('#selectSize li').length > 0) {
        // Check if a size is selected
        var selectedSize = $('#selectSize li.selected');
        if (selectedSize.length === 0) {
            // Display error message for not selecting a size
            $('.error-message-Size').text(lang == "En" ? "Select Size" : "اختر المقاس");
            return;
        }

        sizeId = selectedSize.attr('id');
        console.log("Size Id: " + sizeId);
    }

    // Get quantity
    var quantity = $('input[name="quantity"]').val();
    console.log("Quantity: " + quantity);

    // Log productId and lang
    console.log("Product Id: " + productId);
    console.log("Language: " + lang);

    // Reset error message
    $('.error-message-Color').text('');
    $('.error-message-Size').text('');

    // Add your logic to perform the addToCart action here

    var data = {
        productId: productId,
        quantity: quantity,
        colorId: colorId,
        sizeId: sizeId
    };

    console.log(data);
    // Make AJAX request
    $.ajax({
        url: '/HomeOrder/AddToCart', // Replace with the actual URL of your server-side action
        type: 'POST',
        data: data,
        success: function (response) {
            // Check the response from the server
            if (response.status) {
                notifyAddToCart(response.message, "success", lang, false, response.status);
                updateUI(true, lang, productId, response.isDeleted, response.isUpdated, response.count);
            }
            else {
                notifyAddToCart(response.message, "warning", lang, response.isLogin, response.status);
            }
        },
        error: function () {
            // Display a generic error message for AJAX failure
            console.log("An error occurred while processing your request.");
        }
    });

    // Example: Display an alert
    //$('.added-notification').addClass("show");
    //setTimeout(function () {
    //    $('.added-notification').removeClass("show");
    //}, 5000);
}

function addToStickyCart(productId, lang) {
    // Check if there are colors
    var selectedColorElement = document.getElementById('inputState-color');
    var selectedSizeElement = document.getElementById('inputState-size');

    if (selectedColorElement && selectedColorElement.value == "0") {
        $('.error-message-Color-two').text(lang == "En" ? "Select Color" : "اختر اللون");
        return;
    }
    $('.error-message-Color-two').text('');
    if (selectedSizeElement && selectedSizeElement.value == "0") {
        $('.error-message-Size-two').text(lang == "En" ? "Select Size" : "اختر المقاس");
        return;
    }
    $('.error-message-Size-two').text('');

    // Check if selectedColorElement is not null before accessing its value
    var selectedColor = selectedColorElement ? selectedColorElement.value : null;

    // Check if selectedSizeElement is not null before accessing its value
    var selectedSize = selectedSizeElement ? selectedSizeElement.value : null;

    var quantity = $('input[name="quantity"]');
    if (quantity)
        quantity = quantity.val();
    else
        quantity = 1;

    console.log("Product Id: " + productId);
    console.log("Language: " + lang);
    console.log("Quantity: " + quantity);
    console.log("color Id: " + selectedColor);
    console.log("size Id: " + selectedSize);

    // Add your logic to perform the addToCart action here
    var data = {
        productId: productId,
        quantity: quantity,
        colorId: selectedColor,
        sizeId: selectedSize
    };

    console.log(data);
    // Make AJAX request
    $.ajax({
        url: '/HomeOrder/AddToCart', // Replace with the actual URL of your server-side action
        type: 'POST',
        data: data,
        success: function (response) {
            // Check the response from the server
            if (response.status) {
                notifyAddToCart(response.message, "success", lang, false, response.status);
                updateUI(true, lang, productId, response.isDeleted, response.isUpdated, response.count);
            }
            else {
                notifyAddToCart(response.message, "warning", lang, response.isLogin, response.status);
            }
        },
        error: function () {
            // Display a generic error message for AJAX failure
            console.log("An error occurred while processing your request.");
        }
    });
}

function addToCartFromProductBox(productId, lang) {
    var colorId = null;
    var sizeId = null;
    var quantity = 1;
    // Add your logic to perform the addToCart action here
    var data = {
        productId: productId,
        quantity: quantity,
        colorId: colorId,
        sizeId: sizeId,
        productBox: true
    };

    console.log(data);
    // Make AJAX request
    $.ajax({
        url: '/HomeOrder/AddToCart', // Replace with the actual URL of your server-side action
        type: 'POST',
        data: data,
        success: function (response) {
            // Check the response from the server
            if (response.status) {
                notifyAddToCart(response.message, "success", lang, false, response.status);
                updateUI(true, lang, productId, response.isDeleted, response.isUpdated, response.count);
            }
            else {
                notifyAddToCart(response.message, "warning", lang, response.isLogin, response.status);
            }
        },
        error: function () {
            // Display a generic error message for AJAX failure
            console.log("An error occurred while processing your request.");
        }
    });
}

//----------------------

function removeFromCart(productId, lang) {
    // Add your logic to perform the removeFromCart action here
    var data = {
        productId: productId,
    };

    // Make AJAX request
    $.ajax({
        url: '/HomeOrder/DeleteFromCart', // Replace with the actual URL of your server-side action
        type: 'POST',
        data: data,
        success: function (response) {
            // Check the response from the server
            if (response.status) {
                // notifyAddToCart(response.message, "success", lang, false, response.status);
                updateUI(true, lang, productId, true, response.isUpdated, response.count);
            }
            else {
                notifyAddToCart(response.message, "warning", lang, response.status, response.isLogin);
            }
        },
        error: function () {
            // Display a generic error message for AJAX failure
            console.log("An error occurred while processing your request.");
        }
    });
}

//------------------------------- show cart data
function getCartData(lang) {
    $.ajax({
        url: "/HomeOrder/GetCartData",
        type: 'GET',
        dataType: 'json',
        success: function (response) {
            if (response.status === true) {
                $("#partial-cart-container").html(response.cart);
            }
            else {
                notifyAddToCart(response.message, "warning", lang, true, response.status);
            }
        },
        error: function (xhr, status, error) {
            // Handle error response from server
            console.log(' to favorites: ' + error);
        }
    });
}
function ShowCartData(lang) {
    $.ajax({
        url: "/HomeOrder/GetCartData",
        type: 'GET',
        dataType: 'json',
        success: function (response) {
            if (response.status === true) {
                $("#partial-cart-container").html(response.cart);
            }
            else {
            }
        },
        error: function (xhr, status, error) {
            // Handle error response from server
            console.log(' to favorites: ' + error);
        }
    });
}

//---------------------------------- updateUI(true, lang, productId, response.isDeleted, response.isUpdated);
function updateUI(isInCart, lang, productId, isDeleted, isUpdated, count) {
    var cartText = $('#cartText');
    var cartIcon = $('#cartEffect i'); // Assuming cartEffect is accessible
    var cartEffect = $('#cartEffect');
    var cartTextTwo = $('#cartTextTwo');
    var CartCount = $('.cart_qty_cls');
    var className = convertIdToClassNameForCart(productId);
    var elements = document.querySelectorAll(className);
    //$("#partial-cart-container").empty();
    getCartData()

    if (isDeleted) {
        cartText.text(lang == "En" ? "Add to Cart" : "أضف إلى السلة");
        cartTextTwo.text(lang == "En" ? "Add to Cart" : "أضف إلى السلة");
        cartIcon.removeClass('fa-check-circle').addClass('fa-shopping-cart'); // Change the icon back to the shopping cart
        elements.forEach(function (element) {
            element.classList.toggle('hovered');
        });
        CartCount.text(count);
        return;
    }
    if (isUpdated) {
        return;
    }

    cartText.text(lang == "En" ? "Added to Cart" : "تمت الإضافة إلى السلة");
    cartTextTwo.text(lang == "En" ? "Added to Cart" : "تمت الإضافة إلى السلة");
    cartIcon.removeClass('fa-shopping-cart').addClass('fa-check-circle'); // Change the icon to a check mark
    elements.forEach(function (element) {
        element.classList.toggle('hovered');
    });
    CartCount.text(count);
    return;
}

function convertIdToClassNameForCart(id) {
    return '.' + 'Cart-' + id;
}

//------------------------

function notifyAddToCart(message, type, lang, needLogin, status) {
    const isRtl = lang && lang.toLowerCase() === 'ar';
    var message2 = isRtl ? (needLogin ? 'صفحة تسجيل الدخول' : 'الانتقال إلى السلة') : (needLogin ? 'Login page' : 'Go to Cart');
    var url = status ? "/HomeOrder/OrderCart" : (needLogin ? '/Home/UserLogin' : "/HomeOrder/OrderCart");

    $.notify(
        {
            icon: (type == "success") ? 'fa fa-check' : 'fa fa-exclamation-triangle',
            title: (type == "success") ? (isRtl) ? 'نجاح !' : 'Success!' : (isRtl) ? 'تحذير !' : 'Warning!',
            message: message + (url ? '<br /><a href="' + url + '" target="_blank">' + message2 + '</a>' : '')
        },
        {
            element: 'body',
            position: null,
            type: (type == "success") ? 'success' : 'info',
            allow_dismiss: true,
            newest_on_top: false,
            showProgressbar: true,
            placement: {
                from: "top",
                align: "right"
            },
            offset: 20,
            spacing: 10,
            z_index: 1031,
            delay: 5000,
            animate: {
                enter: 'animated fadeInDown',
                exit: 'animated fadeOutUp'
            },
            icon_type: 'class',
            template: '<div style="' + (isRtl ? 'direction: rtl;' : '') + '" data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
                '<button type="button" aria-hidden="true" class="btn-close ' + (isRtl ? 'right-class' : '') + ' " data-notify="dismiss"></button>' +
                '<span data-notify="icon"></span> ' +
                '<span data-notify="title">{1}</span> ' +
                '<span data-notify="message">{2}</span>' +
                '<div class="progress" data-notify="progressbar">' +
                '<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
                '</div>' +
                '<a href="{3}" target="{4}" data-notify="url"></a>' +
                '</div>'
        });
}

//------------------------------------------------------------------------------------------------------------------------ details page
// Handle click events for color selection
$('.colors').click(function () {
    $('.colors').removeClass('active');
    $(this).addClass('active');
    // Reset error message on color selection
    $('.error-message-Color').text('');
});

// Handle click events for size selection
$('#selectSize li').click(function () {
    $('#selectSize li').removeClass('selected');
    $(this).addClass('selected');
    // Reset error message on size selection
    $('.error-message-Size').text('');
});

//----------------------------------------------------------------------------
function loadPartialView(partialView, id, el) {
    $.ajax({
        url: "/HomeProducts/ChangeDetails",
        data: { partialView: partialView, id: id },
        success: function (result) {
            var elements = document.querySelectorAll('nav-link');
            elements.forEach(function (element) {
                element.classList.remove('active');
            });
            el.classList.add('active');

            $("#partial-container").html(result);
        }
    });
}

//--------------------------------------------------------------
function addComment(lang, id) {
    // Get rating value
    var rating = $('input[name="rating"]:checked').val();

    // Get comment value
    var comment = $('#example').val();

    // Check if rating and comment are provided
    if (!rating || !comment) {
        commentNotify(lang == "En" ? "Please provide both rating and comment." : "يرجى تقديم كل من التقييم والتعليق.", "warning", lang, false, false);
        return;
    }

    // Reset error message
    $('.alert-danger').text('');

    // Prepare data for AJAX request
    var data = {
        rating: rating,
        comment: comment,
        productId: id
    };

    console.log(data);
    // Make AJAX request
    $.ajax({
        url: '/HomeProducts/AddComment', // Replace with the actual URL of your server-side action
        type: 'POST',
        data: data,
        success: function (response) {
            // Check the response from the server
            if (response.status) {
                // Display success message
                commentNotify(response.message, "success", lang, response.status, false);
                var comment = $('#example').val("");
                var rating = $('input[name="rating"]:checked').val(0);
            } else {
                // Display error message from the server
                commentNotify(response.message, "warning", lang, response.status, response.isLogin);
            }
        },
        error: function () {
            // Display a generic error message for AJAX failure
            console.log("An error occurred while processing your request.");
        }
    });
}
function commentNotify(message, type, lang, status, needLogin) {
    const isRtl = lang && lang.toLowerCase() === 'ar';
    var url = status ? "" : '/Home/UserLogin';
    var message2 = isRtl ? (needLogin ? 'صفحة تسجيل الدخول' : '') : (needLogin ? 'Login page' : '');

    $.notify({
        icon: (type == "success") ? 'fa fa-check' : 'fa fa-exclamation-triangle',
        title: (type == "success") ? (isRtl) ? 'نجاح !' : 'Success!' : (isRtl) ? 'تحذير !' : 'Warning!',
        message: message + (url ? '<br /><a href="' + url + '" target="_blank">' + message2 + '</a>' : '')
    }, {
        element: 'body',
        position: null,
        type: (type == "success") ? 'success' : 'info',
        allow_dismiss: true,
        newest_on_top: false,
        showProgressbar: true,
        placement: {
            from: "top",
            align: "right"
        },
        offset: 20,
        spacing: 10,
        z_index: 1031,
        delay: 5000,
        animate: {
            enter: 'animated fadeInDown',
            exit: 'animated fadeOutUp'
        },
        icon_type: 'class',
        template: '<div style="' + (isRtl ? 'direction: rtl;' : '') + '" data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
            '<button type="button" aria-hidden="true" class="btn-close ' + (isRtl ? 'right-class' : '') + ' " data-notify="dismiss"></button>' +
            '<span data-notify="icon"></span> ' +
            '<span data-notify="title">{1}</span> ' +
            '<span data-notify="message">{2}</span>' +
            '<div class="progress" data-notify="progressbar">' +
            '<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
            '</div>' +
            '<a href="{3}" target="{4}" data-notify="url"></a>' +
            '</div>'
    });
}

//---------------------------------------------------------------
function ShowReplyInput(el, id) {
    // Hide the anchor

    $(el).hide();
    var idName = convertIdToClassComment(id);
    $(idName).show();
}
function HideReplyInput(id) {
    // Hide the anchor
    var idName = convertIdToClassComment(id);
    $(idName).hide();
    $(`#an-${id}`).show();
}
function convertIdToClassComment(id) {
    return '#' + 'comment-' + id;
}
function addSubComment(lang, commentId) {
    // Get the input data
    var inputId = `input-${commentId}`;
    var inputValue = $(`#${inputId}`).val();

    // Check if the input is not empty
    if (!inputValue) {
        commentNotify(lang == "En" ? "Please enter a reply." : "يرجى إدخال رد.", "warning", lang, false, false);
        return;
    }

    // Prepare data for AJAX request
    var data = {
        commentId: commentId,
        replyText: inputValue
    };

    // Make AJAX request
    $.ajax({
        url: '/HomeProducts/AddSubComment', // Replace with the actual URL of your server-side action
        type: 'POST',
        data: data,
        success: function (response) {
            if (response.status) {
                // Display success message
                commentNotify(response.message, "success", lang, response.status, false);
                var inputValue = $(`#${inputId}`).val("");
                HideReplyInput(commentId);
            } else {
                // Display error message from the server
                commentNotify(response.message, "warning", lang, response.status, response.isLogin);
            }
        },
        error: function () {
            // Display a generic error message for AJAX failure
            console.log("An error occurred while processing your request.");
        }
    });
}

//------------------------------------------------------------------------------------------------------------------------ Cart page

function changeQuantity(id, element, lang) {
    // Make an AJAX request to the server to add the item with the given ID
    let inputValue = element.value;
    $.ajax({
        url: '/HomeOrder/ChangeQuantity',
        type: 'POST',
        data: { id: id, quantity: inputValue },
        success: function (response) {
            if (response.status === true) {
                document.getElementById('subTotal' + id).textContent = lang == "En" ? response.subTotal + "El" : "El" + response.subTotal;
                document.getElementById('subTotal2' + id).textContent = lang == "En" ? response.subTotal + "El" : "El" + response.subTotal;
                document.getElementById('totalOrder').textContent = lang == "En" ? response.orderPrice + "El" : "El" + response.orderPrice;
                getCartData()
                var CartCount = $('.cart_qty_cls');
                CartCount.text(response.count);
            }
            else {
                notifyAddToCart(response.message, "warning", lang, response.status, response.isLogin);
            }
        },
        error: function (xhr, status, error) {
            // Handle error response from server
            console.log('Error adding item with ID ' + id + ' to favorites: ' + error);
        }
    });
}
//------------------delete item from cart

function deleteItem(id, lang) {
    // Make an AJAX request to the server to add the item with the given ID
    $.ajax({
        url: '/HomeOrder/DeleteItem',
        type: 'POST',
        data: { id: id },
        success: function (response) {
            if (response.status === true) {
                document.getElementById('orderItem' + id).remove();
                document.getElementById('totalOrder').textContent = lang == "En" ? response.orderPrice + "El" : "El" + response.orderPrice;
                getCartData()
                var CartCount = $('.cart_qty_cls');
                CartCount.text(response.count);
            }
            else {
                notifyAddToCart(response.message, "warning", lang, response.status, response.isLogin);
            }
        },
        error: function (xhr, status, error) {
            // Handle error response from server
            console.log('Error adding item with ID ' + id + ' to favorites: ' + error);
        }
    });
}

//------------------------------------------------------------------------------------------------------------------------ Checkout page

function updateCitiesList(el, lang) {
    debugger;
    let id = el.value;

    $.ajax({
        url: "/HomeOrder/UpdateCitiesList",
        data: { id: id },
        contentType: "application/json; charset=utf-8",
        success: function (result) {
            console.log(result)
            if (result.length <= 0) {
                var selectElement = document.getElementById("cities-select");

                selectElement.innerHTML = '';

                var newOption = document.createElement("option");
                newOption.value = null;
                newOption.textContent = (lang == "En") ? "No cities are currently available in this country." : "لم تتاح أي مدن حاليا في هذة الدولة.";
                newOption.selected = true;

                selectElement.add(newOption);

                $(selectElement).selectpicker('refresh');
            } else {
                var selectElement = document.getElementById("cities-select");
                selectElement.innerHTML = '';
                var newOption = document.createElement("option");
                newOption.value = null;
                newOption.textContent = (lang == 'En') ? "Select City" : "حدد المدينة";
                newOption.selected = true;
                selectElement.add(newOption);
                for (let i = 0; i < result.length; i++) {
                    var newOption = document.createElement("option");
                    newOption.value = result[i].id;
                    newOption.textContent = result[i].name;
                    selectElement.add(newOption);
                }

                $(selectElement).selectpicker('refresh');
            }
        },
        failure: function (response) {
            alert(response.responseText);
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
}

//-------------------------------------------------------------- get shipping price

function getShippingPrice(el, lang) {
    let id = el.value;

    $.ajax({
        url: "/HomeOrder/GetShippingPrice",
        data: { id: id },
        type: 'POST',
        success: function (response) {
            if (response.status === true) {
                //notify(response.message, "success");
                document.getElementById('shipping-price').textContent = lang == "En" ? response.shippingPrice + " EL " : response.shippingPrice + " EL ";
                document.getElementById('totalOrder').textContent = lang == "En" ? response.orderPrice + " EL " : response.orderPrice + " EL ";
                document.getElementById('finalTotalOrder').textContent = lang == "En" ? response.totalPrice + " EL " : response.totalPrice + " EL ";
            }
            else {
                notify(response.message, "warn", lang);
            }
        },
        failure: function (response) {
            alert(response.responseText);
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
}

//-------------------------------------------------------------- CalculateTheDiscount

function CalculateTheDiscount(lang) {
    const couponCodeInput = document.getElementById("coupon-code");
    const couponCode = couponCodeInput.value;

    $.ajax({
        url: "/HomeOrder/CalculateTheDiscount",
        data: { couponCode: couponCode },
        type: 'POST',
        success: function (response) {
            if (response.status === true) {
                //notify(response.message, "success");
                document.getElementById('discount-Price').textContent = lang == "En" ? response.discountPrice + " EL " : response.discountPrice + " EL ";
                document.getElementById('discount-Code').textContent = copounCode;
                document.getElementById('totalOrder').textContent = lang == "En" ? response.orderPrice + " EL " : response.orderPrice + " EL ";
                document.getElementById('finalTotalOrder').textContent = lang == "En" ? response.totalPrice + " EL " : response.totalPrice + " EL ";
            }
            else {
                notify(response.message, "warn", lang);
            }
        },
        failure: function (response) {
            alert(response.responseText);
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
}