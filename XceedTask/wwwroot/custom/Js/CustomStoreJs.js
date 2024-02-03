'Use Strict'

//--------------------------------------------------------------------------- contact us page
$(document).ready(function () {
    $("form.ClientMessage-form").submit(function (e) {
        e.preventDefault(); // Prevent the default form submission
        // Get form data
        var formData = {
            firstName: $("#name").val(),
            lastName: $("#last-name").val(),
            phoneNumber: $("#review").val(),
            email: $("#email").val(),
            message: $("#exampleFormControlTextarea1").val()
        };

        // Send an AJAX POST request to the server
        $.ajax({
            type: "post",
            url: "/Home/ClientMessage", // Replace with the correct controller and action URL
            data: JSON.stringify(formData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.success) {
                    // Handle success response (e.g., show a success message)
                    $("#successMessage").text("");
                    $("#successMessage").text(response.message);
                    $("#successMessage").show();
                    $("#errorMessage").hide();
                    $("#name").val("");
                    $("#last-name").val("");
                    $("#review").val("");
                    $("#email").val("");
                    $("#exampleFormControlTextarea1").val("");
                } else {
                    // Handle error response (e.g., show an error message)
                    $("#errorMessage").text("");
                    $("#errorMessage").text(response.message);
                    $("#errorMessage").show();
                    $("#successMessage").hide();
                }

                // Automatically hide the messages after 10 seconds
                setTimeout(function () {
                    $("#successMessage, #errorMessage").hide();
                }, 10000); // 10000 milliseconds = 10 seconds
            },
            error: function (error) {
                // Handle error response (e.g., show an error message)
                console.error("Error submitting form: " + JSON.stringify(error));
                $("#errorMessage").text("");
                $("#errorMessage").text("An error occurred while submitting the form.");
                $("#errorMessage").show();
                $("#successMessage").hide();

                // Automatically hide the error message after 10 seconds
                setTimeout(function () {
                    $("#errorMessage").hide();
                }, 10000); // 10000 milliseconds = 10 seconds
            }
        });
    });
});

//---------------------------------------------------------------------------------------------------------------

function sendMail(lang) {
    var email = $('#mce-EMAIL').val();
    lang = !lang ? "En" : lang;
    // Make an Ajax request to send the email to the backend
    $.ajax({
        url: '/Home/ClientSubscribe', // Replace with your actual backend endpoint
        method: 'get',
        data: { email: email },
        success: function (response) {
            // Handle success, e.g., show a success message

            if (response.success === true) {
                notify(response.message, "success", lang);
            }
            else {
                notify(response.message, "warn", lang);
            }
        },
        error: function (error) {
            // Handle error, e.g., show an error message
            console.error('Error sending email:', error);
        }
    });
}
//---------------------------------------------------------------------------------------------------------------

function notify(message, type, lang, id) {
    const isRtl = lang && lang.toLowerCase() === 'ar';
    var url = id ? "/Home/Details/" + id : '';

    $.notify({
        icon: (type == "success") ? 'fa fa-check' : 'fa fa-exclamation-triangle',
        title: (type == "success") ? (isRtl) ? 'نجاح !' : 'Success!' : (isRtl) ? 'تحذير !' : 'Warning!',
        message: message + (url ? '<br /><a href="' + url + '" target="_blank">' + (isRtl ? 'انقر هنا' : 'Click Here') + '</a>' : '')
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

//--------------------------------------------------------------------------------------------------------------- wistlist

function addToFavoriteProducts(id, lang) {
    $.ajax({
        url: '/Home/AddToFavoriteProducts', // Replace with your actual backend endpoint
        method: 'get',
        data: { id: id },
        success: function (response) {
            // Handle success, e.g., show a success message

            if (response.success === true) {
                wishListNotify(response.message, "success", lang, true);
                $('#wishListSpan').text(lang == "En" ? "Remove" : "إزالة ");
            }
            else {
                wishListNotify(response.message, "warn", lang, false, response.needLogin);
                $('#wishListSpan').text(lang == "En" ? "Add " : "أضف ");
            }

            var className = convertIdToClass(id);
            var elements = document.querySelectorAll(className);

            if (response.success === true) {
                elements.forEach(function (element) {
                    element.classList.toggle('hovered');
                });
            }
            if (response.success === false && (response.needLogin === false || response.needLogin === undefined)) {
                elements.forEach(function (element) {
                    element.classList.toggle('hovered');
                });
            }
        },
        error: function (error) {
            // Handle error, e.g., show an error message
            console.error('Error sending email:', error);
        }
    });
}
function convertIdToClass(id) {
    return '.' + 'Wishlist-' + id;
}
function wishListNotify(message, type, lang, status, needLogin) {
    const isRtl = lang && lang.toLowerCase() === 'ar';
    var url = status ? "/Home/FavoriteProducts" : '/Home/UserLogin';
    var message2 = isRtl ? (needLogin ? 'صفحة تسجيل الدخول' : 'اذهب الى قائمة المفضلة') : (needLogin ? 'Login page' : 'Go to Favorites');

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

//--------------------------------------------------------------------------------------------------------------- compare

function addToCompareProducts(id, lang) {
    $.ajax({
        url: '/Home/AddCompareProducts', // Replace with your actual backend endpoint
        method: 'get',
        data: { id: id },
        success: function (response) {
            // Handle success, e.g., show a success message

            if (response.success === true) {
                compareNotify(response.message, "success", lang, true);
            }
            else {
                compareNotify(response.message, "warn", lang, false);
            }
        },
        error: function (error) {
            // Handle error, e.g., show an error message
            console.error('Error sending email:', error);
        }
    });
}

function compareNotify(message, type, lang, status) {
    const isRtl = lang && lang.toLowerCase() === 'ar';
    var url = status ? "/Home/CompareProducts" : '';
    var message2 = isRtl ? 'اذهب الى قائمة المقارنة' : 'Go to Compare';

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