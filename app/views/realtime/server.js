var fs   = require('fs');
var http = require('http');
var port = process.env.PORT || 5000;

var server = http.createServer(function (req, res) {

});
var io = require('socket.io')(server);

var Room = io
  .of('/room')
  .on('connection', function(socket) {
    var joinedRoom = null;
       data="chat-mike";
      socket.join(data);
      console.log(data);
      joinedRoom = data;

    socket.on('fromclient', function(data) {
      if (joinedRoom) {
         console.log(data);
         socket.broadcast.to(joinedRoom).send(data);
      } else {
        socket.send(
           "you're not joined a room." +
           "select a room and then push join."
        );
      }
    });
  });




server.listen(port, function () {
  console.log('Server is running on port %s', port);
});


