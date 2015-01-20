function init(channel){

// config editor codemirror

   editor= CodeMirror.fromTextArea($("#room-text").get(0), {
    lineNumbers: true,
    styleActiveLine: true,
    matchBrackets: true,
    mode: "javascript",
    theme: "midnight",
    indentUnit : 4,
    gutter: true
  });

// end config


   var room = io.connect('http://localhost:5000/room');
   var content = $('#room-text');




     room.emit('join room', channel);
     alert(channel);




   room.on('message', function(msg) {



            var obj=JSON.parse(msg);

            a=obj.from.line;
            b=obj.from.ch;
            t=obj.text.join('\n');
            console.log(obj);

            if(obj.origin== "+delete")
            {
              posFrom = CodeMirror.Pos(obj.from.line, obj.from.ch)
              posTo = CodeMirror.Pos(obj.to.line, obj.to.ch)
              editor.doc.replaceRange('', posFrom,posTo, "ignore");
            }else {
              editor.doc.replaceRange(t, CodeMirror.Pos(a,b), null, "ignore");
            }

    });

   editor.on('change', function(editor,changeobj) {
     if(changeobj.origin != "ignore"){
       msg = JSON.stringify(changeobj);
       room.emit('fromclient', msg);
     }
   });

};

