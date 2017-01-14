// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap-sprockets

$(document).on('ready', function(){
  $('input.form-control').on('keypress change', function(){
    $(this).parents('div.form-group.has-error').removeClass('has-error');
    $(this).siblings('span.help-block').html('')
  })

  $('.delete_person_button').on('click', function(){
    $that = $(this);

    $('#confirmation_dialog').modal('show');
    console.log($that.data('url'))
    $('.person_full_name').text($that.data('full_name'))
    $('.delete_person').attr('href', $that.data('url'))
  })
})
