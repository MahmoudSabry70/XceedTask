//--------------------------------------------------------------

$('img').addClass('img-enlargeable').click(function () {
    var src = $(this).attr('src');
    var modal;
    function removeModal() { modal.remove(); $('body').off('keyup.modal-close'); }
    modal = $('<div>').css({
        background: 'RGBA(0,0,0,.5) url(' + src + ') no-repeat center',
        backgroundSize: 'contain',
        width: '100%', height: '100%',
        position: 'fixed',
        zIndex: '10000',
        top: '0', left: '0',
        cursor: 'zoom-out'
    }).click(function () {
        removeModal();
    }).appendTo('body');
    //handling ESC
    $('body').on('keyup.modal-close', function (e) {
        if (e.key === 'Escape') { removeModal(); }
    });
});

//-----------------------------------------------------------
// change PermissibleLimit

function changePermissibleLimit(userId, lang) {
    debugger;
    var limit = $(`#inputSaveLimit`).val();
    // Display Swal.fire with an input for the amount
    Swal.fire({
        title: lang == "En" ? "Change the Allowed Limit for Joining Associations" : "قم بتغيير الحد المسموح للدخول في الجمعيات",
        input: 'number',
        inputValue: limit,
        inputAttributes: {
            autocapitalize: 'off',
            min: 1
        },
        showCancelButton: true,
        confirmButtonText: lang == "En" ? "Confirm" : "تأكيد",
        cancelButtonText: lang == "En" ? "Cancel" : "ألغاء",
        showLoaderOnConfirm: true,
        preConfirm: (amount) => {
            // Use AJAX to send the amount to your server
            return $.ajax({
                url: '/ApplicationUsers/ChangePermissibleLimit', // Replace with the actual URL of your server-side action
                method: 'POST',
                data: {
                    userId: userId,
                    permissibleLimit: amount
                },
                dataType: 'json',
                success: function (response) {
                    if (!response.success) {
                        throw new Error(response.message);
                    }
                },
                error: function (error) {
                    Swal.showValidationMessage(
                        `Request failed: ${error.responseText}`
                    );
                }
            });
        },
        allowOutsideClick: () => !Swal.isLoading()
    }).then((result) => {
        if (result.isConfirmed) {
            if (result.value) {
                Swal.fire({
                    title: `${result.value.message}`,
                    icon: 'success'
                });
                $(`#permissibleLimitId`).text(result.value.newPermissibleLimit);
                $(`#inputSaveLimit`).val(result.value.permissibleLimitNumber);
            } else {
                Swal.fire({
                    title: 'Invalid Amount',
                    icon: 'error'
                });
            }
        }
    });
}

//-------------------------------------------------------------- change Discount Percentage

function changeDiscountPercentage(id, lang) {
    debugger;
    var discountPercentage = $(`#inputDiscountPercentage`).val();
    // Display Swal.fire with an input for the amount
    Swal.fire({
        title: lang == "En" ? "Change Discount Percentage" : "قم بتغيير نسبة الخصم",
        input: 'number',
        inputValue: discountPercentage,
        inputAttributes: {
            autocapitalize: 'off',
            min: 1,
            max: 100,
        },
        showCancelButton: true,
        confirmButtonText: lang == "En" ? "Confirm" : "تأكيد",
        cancelButtonText: lang == "En" ? "Cancel" : "ألغاء",
        showLoaderOnConfirm: true,
        inputValidator: (value) => {
            if (value < 1 || value > 100) {
                return lang == "En" ? "Invalid number. Please enter a value between 1 and 100." : "رقم غير صالح. يرجى إدخال قيمة بين 1 و 100.";
            }
        },
        preConfirm: (amount) => {
            // Use AJAX to send the amount to your server
            return $.ajax({
                url: '/UserOrders/changeDiscountPercentage', // Replace with the actual URL of your server-side action
                method: 'POST',
                data: {
                    id: id,
                    discountPercentage: amount
                },
                dataType: 'json',
                success: function (response) {
                    if (!response.success) {
                        throw new Error(response.message);
                    }
                },
                error: function (error) {
                    Swal.showValidationMessage(
                        `Request failed: ${error.responseText}`
                    );
                }
            });
        },
        allowOutsideClick: () => !Swal.isLoading()
    }).then((result) => {
        if (result.isConfirmed) {
            if (result.value) {
                Swal.fire({
                    title: `${result.value.message}`,
                    icon: 'success'
                });
                $(`#inputDiscountPercentage`).val(result.value.discountPercentageNumber);
                $(`#discountPercentageId`).text(result.value.discountPercentage);
                $(`#AssociationFeesId`).text(result.value.fees);
            } else {
                Swal.fire({
                    title: 'Invalid Number',
                    icon: 'error'
                });
            }
        }
    });
}

//-------------------------------------------------------------- change Order Status

function changeOrderStatus(orderId, lang) {
    var selectedStatus = $('#select2modal select').val();

    $.ajax({
        url: '/UserOrders/ChangeStatus', // Replace with your backend endpoint
        type: 'POST',
        data: {
            orderId: orderId,
            status: selectedStatus
        },
        dataType: 'json',
        success: function (response) {
            if (response.success) {
                // Show success message using SweetAlert
                var messageSpan = `<span class="tag tag-radius tag-round tag-outline-warning">${response.statusString}</span>`;
                $('#changeStatusData').html(messageSpan);
                Swal.fire({
                    icon: 'success',
                    title: response.message,
                    showConfirmButton: false,
                    timer: 1500
                });
            } else {
                // Show error message using SweetAlert
                Swal.fire({
                    icon: 'error',
                    title: response.message,
                    showConfirmButton: false,
                    timer: 1500
                });
            }
        },
        error: function () {
            // Show error message using SweetAlert
            Swal.fire({
                icon: 'error',
                title: 'Error occurred during the request.',
                showConfirmButton: false,
                timer: 1500
            });
        }
    });

    // Close the modal
    $('#select2modal').modal('hide');
}

//-------------------------------------------------------------- Cancel Order

function cancelOrder(orderId, lang) {
    debugger;
    var recipientName = $('#recipient-name').val();

    // Ensure that the recipient name is not empty
    if (!recipientName) {
        $('#input-modal').modal('hide');
        Swal.fire({
            icon: 'error',
            title: lang == 'En' ? 'You must write the reason for rejection' : 'يجب كتابة سبب الرفض',
            showConfirmButton: false,
            timer: 1500
        });
        return;
    }

    $.ajax({
        url: '/UserOrders/CancelOrder', // Replace with your backend endpoint
        type: 'POST',
        data: {
            orderId: orderId,
            reason: recipientName
        },
        dataType: 'json',
        success: function (response) {
            if (response.success) {
                // Show success message using SweetAlert
                var messageSpan = `<span class="tag tag-radius tag-round tag-outline-warning">${response.statusString}</span>`;
                $('#changeStatusData').html(messageSpan);
                Swal.fire({
                    icon: 'success',
                    title: response.message,
                    showConfirmButton: false,
                    timer: 1500
                });
                $('#statusButton').hide();
            } else {
                // Show error message using SweetAlert
                Swal.fire({
                    icon: 'error',
                    title: response.message,
                    showConfirmButton: false,
                    timer: 1500
                });
            }
        },
        error: function () {
            // Handle error
            Swal.fire({
                icon: 'error',
                title: lang == 'En' ? 'Error occurred during the request.' : 'حدث خطأ أثناء الطلب',
                showConfirmButton: false,
                timer: 1500
            });
        }
    });

    // Close the modal
    $('#input-modal').modal('hide');
}

//-------------------------------------------------------------- Cahnge Cycle order

function changeCycles(orderId, lang) {
    debugger;
    var associationCycleId = $('#select5modal select').val();
    var selectedOption = $('#select5modal select option:selected');
    var title = selectedOption.data('title');

    $.ajax({
        url: '/UserOrders/changeCycles', // Replace with your backend endpoint
        type: 'POST',
        data: {
            orderId: orderId,
            associationCycleId: associationCycleId
        },
        dataType: 'json',
        success: function (response) {
            if (response.success) {
                // Show success message using SweetAlert

                $('#associationCycleData').text(title);
                Swal.fire({
                    icon: 'success',
                    title: response.message,
                    showConfirmButton: false,
                    timer: 1500
                });
            } else {
                // Show error message using SweetAlert
                Swal.fire({
                    icon: 'error',
                    title: response.message,
                    showConfirmButton: false,
                    timer: 1500
                });
            }
        },
        error: function () {
            // Show error message using SweetAlert
            Swal.fire({
                icon: 'error',
                title: 'Error occurred during the request.',
                showConfirmButton: false,
                timer: 1500
            });
        }
    });

    // Close the modal
    $('#select5modal').modal('hide');
}

//-------------------------------------------------------------- Cahnge modal-effect

$('.modal-effect').on('click', function (e) {
    e.preventDefault();
    var effect = $(this).attr('data-bs-effect');
    $('.modaldemoEffect').addClass(effect);
});

// HIDE MODAL WITH EFFECT
$('.modaldemoEffect').on('hidden.bs.modal', function (e) {
    $('.modaldemoEffect').removeClass(function (index, className) {
        return (className.match(/(^|\s)effect-\S+/g) || []).join(' ');
    });
});