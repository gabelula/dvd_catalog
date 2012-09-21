// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require jquery_nested_form

$(function(){
  var $modal = $('#modal'),
      $modal_close = $modal.find('.close'),
      $modal_container = $('#modal-container');

  # This bit can be confusing. Since Rails.js sends an accept header asking for
  # javascript, but we want it to return HTML, we need to override this instead.
  $('a[data-remote]').live('ajax:beforeSend', function(e, xhr, settings){
    xhr.setRequestHeader('accept', '*/*;q=0.5, text/html, ' + settings.accepts.html);
  });

  # Handle modal links with the data-remote attribute
  $('a[data-remote]').live('ajax:success', function(xhr, data, status){
    $modal
      .html(data)
      .prepend($modal_close)
      .css('top', $(window).scrollTop() + 40)
      .show();
    $modal_container.show();
  });

  # Hide close button click
  $('.close', '#modal').live('click', function(){
    $modal_container.hide();
    $modal.hide();
    return false;
  });
});
