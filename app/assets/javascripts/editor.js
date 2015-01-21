$(document).on('page:change', function() {
function editor (){
 editor.setSize(870, 570)

  editor.on('change', function(editor,changeobj) {
     if(changeobj.origin != "ignore"){
        obj={
            editorobj: changeobj,
            evento: 'editor'
        }
       msg = JSON.stringify(obj);
      room.emit('event_editor', msg);
     }
   });
}
}
