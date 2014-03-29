var $picurl;

$(document).ready(function () {
    $(":file").filestyle({input: false,classButton: "btn btn-primary", buttonText: "+"});

    $("#imageuploadbutton").unbind('change');
    $("#imageuploadbutton").change(function(){
        $picurl=this;
        block(true);
        $('#myImageForm').ajaxSubmit({
            success: imageAdded,
            error:  imagefailed
        });
    });

    $("#imageset a").click(imgmodalOpen);


    $("#addRatingButton").append('<span class="glyphicon glyphicon-plus"></span>');



});

//function addTheRating(){
//    $('#myRatingForm').ajaxSubmit({
//        success: ratingAdded,
//        error:  ratingfailed
//    });
//}
//
//function ratingAdded(){
//    alert("Danke fürs rating!")
//}
//
//function ratingfailed(){
//    alert("Fehler beim rating upload!")
//}

function imgmodalOpen() {
  $('#deletebutton').attr('indexImg', $('#imageset a').index(this));
  $('#modalpic').attr('src', $('#modalpic').attr('srcLoad'));
  $('#deletebutton').attr('dataid', $(this).attr("dataid"));
  $('#modalpic').attr('data-src',$("img",this).attr("src"));
  $('#myPicModal').modal('show');
  setTimeout(function () {
    $("img.lazy").lazy();
  }, 500);
  $("#deletebutton").unbind('click');
  $("#deletebutton").click(function() {
    var r = confirm("Wirklich löschen?");
    if (r == true) {
        $('#myPicModal').modal('hide');
        block(true);
       $.ajax({
              url: "/images/" + $(this).attr("dataid") +".json",
              type: 'DELETE',
              success: function(result) {
               
                block(false);
                $('#imageset a').get(parseInt($('#deletebutton').attr('indexImg'))).remove();
                
              }
            });
     }
 });
}



function imageAdded(responseText, statusText, xhr, $form){

        if ($picurl.files && $picurl.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {

             var myEl=$('#imgclone').clone();
              $('img',myEl).attr('src', e.target.result);
              $(myEl).removeAttr('id');
              $(myEl).attr("dataid",responseText);
              $(myEl).click(imgmodalOpen);
              
                  $('#imageset').prepend(myEl);

            }

            reader.readAsDataURL($picurl.files[0]);
        }
block(false);
    
}

function imagefailed(responseText, statusText, xhr, $form){
alert("Failed to send picture to server");
block(false);
}



function block(doblock){

    if(doblock){
        $.blockUI({message: "Bitte warten...",
            css: {          border: 'none',
                padding: '15px',
                backgroundColor: '#000',
                '-webkit-border-radius': '10px',
                '-moz-border-radius': '10px',
                opacity: .5,
                color: '#fff'
            } });
    }
    else{
        $.unblockUI();
    }
}
