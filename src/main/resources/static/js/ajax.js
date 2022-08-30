$.ajaxSetup({
    headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        "X-CSRF-TOKEN": $("#_csrf").attr("content"),
    },
});

function setRowIndexAndUserId(row, id) {
    userIdToDelete = id;
    rowIndexToDelete = row.parentNode.parentNode.rowIndex;
}

function closeModal(nameOfTheModal) {
    $(nameOfTheModal).modal("hide");
}

function deleteEntity() {
    let deleteUserUrl = "/admin/json-users/delete/" + userIdToDelete;

    $.ajax({
        url: deleteUserUrl,
        type: "DELETE",
        success: function () {
            let table = $("#user-table"), userIdToDelete, rowIndexToDelete;
            table[0].deleteRow(rowIndexToDelete);

            $("#alert-messages").append(
                "<div class='alert alert-success alert-dismissible fade show' role='alert'>" +
                "<button type='button' class='close' data-dismiss='alert' aria-label='Close'>" +
                "<span aria-hidden='true'>&times;</span> </button>" +
                "User deleted!" +
                "</div>"
            );

            closeModal("#deleteModal");
            userIdToDelete = "";
            rowIndexToDelete = "";
        },
    });
}

function searchUserByProperty() {
    let selectedProperty = $("#search-user-dropdown option:selected").text();
    let value = $("#searchUserBar").val();

    if (value != null && value !== "") {
        window.location.href = "/admin/users?usersProperty=" + selectedProperty + "&propertyValue=" + value;
    } else {
        window.location.href = "/admin/users";
    }
}
