//-------------------------------------------------------------- Dashboard create Prosuct
function changeFinalPrice() {
    let price = $("#thePrice").val();
    let discount = $("#theDiscount").val();
    if (price == '') {
        $("#theFinalPrice").val('');
    }
    if (discount == 0 || discount == '') {
        $("#theFinalPrice").val(price);
    }
    else {
        let finalPrice = price - (price * discount / 100);
        $("#theFinalPrice").val(finalPrice);
    }
    let finalPrice = price - (price * discount / 100);
    $("#theFinalPrice").val(finalPrice);
}
//-------------------------------------------------------------- Dashboard create Prosuct