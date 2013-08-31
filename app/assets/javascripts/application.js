// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap
$(document).ready(function(){

    $(".task_checkbox").on('click',function(){
        var trigger = this
        task_id = $(this).attr('data-id');
        $.post(
            'tasks/set_state',
            {id: task_id},
            function(data)  {
                if (data.completed) {
                    $(trigger).removeClass('icon-hand-right');
                    $(trigger).addClass('icon-ok');
                    $("#task_"+data.task_id+"_name").addClass("striked");
                }
                else {
                    $(trigger).removeClass('icon-ok');
                    $(trigger).addClass('icon-hand-right');
                    $("#task_"+data.task_id+"_name").removeClass("striked");

                }
            }
        )

    })




})
