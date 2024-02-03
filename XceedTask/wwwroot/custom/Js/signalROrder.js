//create connection
var connectionUserCount = new signalR.HubConnectionBuilder()
    //.configureLogging(signalR.LogLevel.Information)
    .withAutomaticReconnect()
    .withUrl("/OrderHub", signalR.HttpTransportType.WebSockets).build();
//debugger;
//connect to methods that hub invokes aka receive notfications from hub
connectionUserCount.on("ReceiveVipOrder", (value) => {
    console.log(value);

    notify("تم اضافة طلب VIP جديد", "warn");
    $.ajax({
        url: "/VipOrders/GetData",
        data: { "id": value },
        type: "GET",
        contentType: "application/json; charset=utf-8",
        success: function (result) {
            var table = $('#table_id_vip').DataTable()
            console.log(result);
            var actions1 =
                ' <a href = "mailto: ' + result.email + '"class="btn btn-secondary">الرد علي الطلب</a>' +
                ' <a href = "/VipOrders/Details/' + result.id + '"class="btn btn-info">التفاصيل</a>' +
                '<a href = "/VipOrders/Delete/' + result.id + '"class="btn btn-danger"' + ' onclick="' + "return confirm('" + 'هل انت متأكد من حذف الطلب ' + `');">حذف الطلب </a>`;
            table.row.add([result.client.fullName, result.phoneNumber, result.addressTitle, actions1]).draw(false);
        }
    });
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
    document.body.style.background = "red";
});

connectionUserCount.start().then(fulfilled, rejected);