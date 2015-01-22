function fneditor (){

 editor= CodeMirror.fromTextArea($("#room-text").get(0), {
    lineNumbers: true,
    styleActiveLine: true,
    matchBrackets: true,
    mode: "javascript",
    theme: "midnight",
    indentUnit : 4,
    gutter: true,
  });

 editor.setSize(870, 570)
}

