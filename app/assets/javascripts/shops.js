var $contextMenu;
var $rowClicked;

$("body").on("contextmenu", ".listitem", function (e) {
    $rowClicked = $(this)
     $contextMenu = $("#myContextMenu");
    $contextMenu.css({
        display: "block",
        left: e.clientX,
        top: e.clientY,
        show: true
    });
    //$("#edit_item").attr('href', $rowClicked.attr("resItem") + "/edit")
    $("#delete_item").attr('href', $rowClicked.attr("resItem"))
    $("#edit_item").on("click", function () {openModular($rowClicked.attr("resItem") + "/edit");});
    return false;
});

$(document).ready(function () {
    $("#new_item").on("click", function () {
    openModular($("#new_item").attr("resItem"));
    });
    $(".listitem a").removeAttr('href');
    $(".listitem").on("click",function (){openModular($(this).attr("resItem") + "/edit");});

});


function openModular(theURL){
    $.ajax({
        url: theURL,
        type: "GET",
        dataType: "html",
        success: function (data) {
            $('#my-modal-body').html($(data).filter('#theMainDiv').html());
            $('#MyDeleteButton').removeAttr('href');
            $('#MyDeleteButton').removeAttr('data-confirm');
            $('#MyDeleteButton').removeAttr('data-method');
            $('#MyDeleteButton').removeAttr('rel');
            $("#MyDeleteButton").on("click", function () {
                var r = confirm("Wirklich löschen?");
                if (r == true)
                {
                    deleteItem(theURL.substring(0, theURL.length - 5));
                }
                });
            $('#MyBackButton').removeAttr('href');
            $("#MyBackButton").on("click", function () { $('#myModal').modal('hide')});
            $("#MySubmitButton").on("click", function () {
                    $('#MyForm').ajaxForm({
                        success:       showResponse  // post-submit callback
                    });}
            );
            $('#myModal').modal('show');
        },
        error: function (xhr, status) {
            alert("Sorry, there was a problem!");
        },
        complete: function (xhr, status) {
        }
    })
}

function deleteItem(theURL){
    $.ajax({
        url: theURL,
        type: "DELETE",
        dataType: "JSON",
        success: function (data) {
            $.ajax({
                url: theURL.substring(0, theURL.lastIndexOf("/")),
                type: "get",
                dataType: "html",
                success: function (data) {
                    $('#myModal').modal('hide');
                    $('#theList').html($(data).find('#theList').html());
                    $(".listitem a").removeAttr('href');
                    $(".listitem").unbind( "click" );
                    $(".listitem").on("click",function (){openModular($(this).attr("resItem") + "/edit");});
                },
                error: function (xhr, status) {
                    alert("Sorry, there was a problem!");
                },
                complete: function (xhr, status) {
                }
            });
        },
        error: function (xhr, status) {
            alert("Sorry, there was a problem!");
        },
        complete: function (xhr, status) {
        }
    });
}

// post-submit callback
function showResponse(responseText, statusText, xhr, $form)  {
    if(xhr.status==200){
        $('#myModal').modal('hide');
        $('#theList').html($(responseText).find('#theList').html());

        $(".listitem a").removeAttr('href');
        $(".listitem").unbind( "click" );
        $(".listitem").on("click",function (){openModular($(this).attr("resItem") + "/edit");});


    }else{
        $('#my-modal-body').html($(responseText).filter('#theMainDiv').html());
        $('#MyBackButton').removeAttr('href');
        $("#MyBackButton").on("click", function () { $('#myModal').modal('hide')});
        // $('#MySubmitButton').replaceWith('<a class="btn btn-primary"  id="MySubmitButton" rel="nofollow">Ok</a>');
        $("#MySubmitButton").on("click", function () {
                $('#MyForm').ajaxForm({
                    success:       showResponse  // post-submit callback
                });}
        );
    }

}


$("#myContextMenu").on("click", "a", function () {
    $("#myContextMenu").hide();
});

$(document).click(function () {
    $("#myContextMenu").hide();
});


