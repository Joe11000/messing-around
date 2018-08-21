// App.chat = App.cable.subscriptions.create("ChatChannel", {
//   connected: function() {
//     // Called when the subscription is ready for use on the server
//     console.log('connected')
//   },

//   disconnected: function() {
//     console.log('disconnected')
//     // Called when the subscription has been terminated by the server
//   },

//   received: function(data) {
//     console.log(`received ${data}`)
//     // Called when there's incoming data on the websocket for this channel
//   },

//   chat: function() {
//     // return this.perform('chat');
//   }
// });
