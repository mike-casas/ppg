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
//= require socket
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree
//= require bootstrap-sprockets
//= require retina
//= require jquery.easing.1.3
//= require smoothscroll
//= require jquery-func
//= require codemirror
//= require codemirror/modes/xml
//= require codemirror/modes/htmlmixed
//= require codemirror/modes/javascript
//= require codemirror/modes/ruby
//= require codemirror/modes/haml
//= require codemirror/keymaps/vim




var room = io.connect('http://localhost:5000/room');
var content = $('#room-text');


function init(channel){
  room.emit('join room', channel);

};

room.on('message', function(msg) {

  var obj=JSON.parse(msg);


   console.log(obj);
   if ("editor"==obj.evento){

           a=obj.editorobj.from.line;
           b=obj.editorobj.from.ch;
           t=obj.editorobj.text.join('\n');


           if(obj.editorobj.origin== "+delete")
           {
            posFrom = CodeMirror.Pos(obj.editorobj.from.line, obj.editorobj.from.ch)
            posTo = CodeMirror.Pos(obj.editorobj.to.line, obj.editorobj.to.ch)
            editor.doc.replaceRange('', posFrom,posTo, "ignore");
          }else {
            editor.doc.replaceRange(t, CodeMirror.Pos(a,b), null, "ignore");
          }
     }
  if ("event_file_create"==obj.evento){

      $('#list_file').append(obj.data);
    }

if ("invitations"==obj.evento){

         notifications(obj);
          $('#list-member').append(obj.text);

       }

       if ("delete_invitations"==obj.evento){

       $('#list-member #'+obj.data+'').remove();


      }



}); //end room


$(".nav-link").click(function(e) {
  e.preventDefault();
  var link = $(this);
  var href = link.attr("href");
  $("html,body").animate({scrollTop: $(href).offset().top - 80}, 500);
  link.closest(".navbar").find(".navbar-toggle:not(.collapsed)").click();
});



