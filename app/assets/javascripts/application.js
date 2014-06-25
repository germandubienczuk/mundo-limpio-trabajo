// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .


$(function() {
	
    $('#suppliers_search input').keyup(function () {  
      var action = $('#suppliers_search').attr('action');  
      var formData = $('#suppliers_search').serialize();  
      $.get(action, formData, null, 'script');  
      history.replaceState(null, document.title, action + "?" + formData);    
    });  
    
    $('#clients_search input').keyup(function () {  
      var action = $('#clients_search').attr('action');  
      var formData = $('#clients_search').serialize();  
      $.get(action, formData, null, 'script');  
      history.replaceState(null, document.title, action + "?" + formData);    
    });  

    $('#articles_search input').keyup(function () {  
      var action = $('#articles_search').attr('action');  
      var formData = $('#articles_search').serialize();  
      $.get(action, formData, null, 'script');  
      history.replaceState(null, document.title, action + "?" + formData);    
    });  

    $('#categories_search input').keyup(function () {  
      var action = $('#categories_search').attr('action');  
      var formData = $('#categories_search').serialize();  
      $.get(action, formData, null, 'script');  
      history.replaceState(null, document.title, action + "?" + formData);    
    });  
});



