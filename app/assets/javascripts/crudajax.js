var $contextMenu;
var $rowClicked;

$(document).ready(function () {
    if ($isModal == 1) {
        $("#new_item").on("click", function () {
            openModular($("#new_item").attr("resItem"));
        });
        $(".listitem a").removeAttr('href');
     
        $(".listitem[isEditable='true']").on("click", function () {
            openModular($(this).attr("resItem") + "/edit");
        });
    } else {
        $("#new_item").attr("href", $("#new_item").attr("resItem"));
    }

    if (!$IsExtend) {
        $("#new_item").hide();
    } else {
        $("#new_item").show();
    }

});


$("body").on("contextmenu", ".listitem", function (e) {
    $rowClicked = $(this)
    $contextMenu = $("#myContextMenu");
 

    if ($isModal == 1) {
        $("#new_item2").on("click", function () {
            openModular($("#new_item2").attr("resItem"));
        });
        $("#edit_item").on("click", function () {
            openModular($rowClicked.attr("resItem") + "/edit");
        });
    } else {
        $("#edit_item").attr('href', $rowClicked.attr("resItem") + "/edit");
        $("#new_item2").attr('href', $("#new_item").attr("resItem"));

    }

    $('#delete_item').removeAttr('href');
    $('#delete_item').removeAttr('data-confirm');
    $('#delete_item').removeAttr('data-method');
    $('#delete_item').removeAttr('rel');
    $("#delete_item").unbind("click");
    $("#delete_item").on("click", function () {
        var r = confirm("Wirklich löschen?");
        if (r == true) {
            deleteItem($rowClicked.attr("resItem"));
        }
    });

  var atLeastOneOption=false;
    if($rowClicked.attr("isEditable")=="true"){
        $("#edit_item").show();
                  atLeastOneOption=true;
    }else{

        $("#edit_item").hide();
    }

    if($rowClicked.attr("isDeletable")=="true"){

        $("#delete_item").show();
                  atLeastOneOption=true;
    }else{

        $("#delete_item").hide();
    }

    if (!$IsExtend) {

        $("#new_item2").hide();
    } else {
            atLeastOneOption=true;
        $("#new_item2").show();
    }


  if(atLeastOneOption){
      $contextMenu.css({
        display: "block",
        left: e.clientX,
        top: e.clientY,
        show: true
    });
  }
  
    return false;
});


function openModular(theURL) {
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
            $("#MyDeleteButton").unbind("click");
            $("#MyDeleteButton").on("click", function () {
                var r = confirm("Wirklich löschen?");
                if (r == true) {
                    deleteItem(theURL.substring(0, theURL.length - 5));
                }
            });
            $('#MyBackButton').removeAttr('href');
            $("#MyBackButton").on("click", function () {
                $('#myModal').modal('hide')
            });
            $("#MySubmitButton").on("click", function () {
                    $('#myModal').block({message: "Bitte warten...", css: {
                        border: 'none',
                        padding: '15px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff'
                    } });
                    $('#MyForm').ajaxForm({
                        success: formSubmitResponse  // post-submit callback
                    });
                }
            );
            $('#myModal').modal('show');
            setTimeout(function () {
                $("img.lazy").lazy();
            }, 500);


        },
        error: function (xhr, status) {
            alert("Sorry, there was a problem!");
        },
        complete: function (xhr, status) {
        }
    })
}

$("#myContextMenu").on("click", "a", function () {
    $("#myContextMenu").hide();
});

$(document).click(function () {
    $("#myContextMenu").hide();
});

function loadingState(start) {
    if (start) {
        if ($('#myModal').is(":visible")) {
            $('#myModal').block({message: "Bitte warten...", css: {
                border: 'none',
                padding: '15px',
                backgroundColor: '#000',
                '-webkit-border-radius': '10px',
                '-moz-border-radius': '10px',
                opacity: .5,
                color: '#fff'
            } });
        } else {
            $.blockUI({message: "Bitte warten...", css: {
                border: 'none',
                padding: '15px',
                backgroundColor: '#000',
                '-webkit-border-radius': '10px',
                '-moz-border-radius': '10px',
                opacity: .5,
                color: '#fff'
            } });

        }
    } else {
        if ($('#myModal').is(":visible")) {

            $('#myModal').unblock();

        } else {
            $.unblockUI();

        }

    }


}

function deleteItem(theURL) {
    $
    loadingState(true);
    $.ajax({
        url: theURL,
        type: "DELETE",
        dataType: "JSON",
        success: function (data) {
            loadingState(false);

            $.ajax({
                url: theURL.substring(0, theURL.lastIndexOf("/")),
                type: "get",
                dataType: "html",
                success: function (data) {
                    $('#myModal').modal('hide');
                    $('#theList').html($(data).find('#theList').html());
                    $(".listitem a").removeAttr('href');
                    $(".listitem").unbind("click");
                    $(".listitem").on("click", function () {
                        openModular($(this).attr("resItem") + "/edit");
                    });
                    $("img.lazy").lazy();

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
function formSubmitResponse(responseText, statusText, xhr, $form) {
    loadingState(false);
    if ($(responseText).find('#theList').length != 0) {
        $('#myModal').modal('hide');
        $('#theList').html($(responseText).find('#theList').html());

        $(".listitem a").removeAttr('href');
        $(".listitem").unbind("click");
        $(".listitem").on("click", function () {
            openModular($(this).attr("resItem") + "/edit");
        });
        $("img.lazy").lazy();
    } else {
        $('#my-modal-body').html($(responseText).filter('#theMainDiv').html());
        $('#MyBackButton').removeAttr('href');
        $("#MyBackButton").on("click", function () {
            $('#myModal').modal('hide')
        });
        // $('#MySubmitButton').replaceWith('<a class="btn btn-primary"  id="MySubmitButton" rel="nofollow">Ok</a>');
        $("#MySubmitButton").on("click", function () {
                $('#MyForm').ajaxForm({
                    success: formSubmitResponse  // post-submit callback
                });
            }
        );
    }

}




