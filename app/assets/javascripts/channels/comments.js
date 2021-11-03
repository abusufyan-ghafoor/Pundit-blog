this.App = {};

App.cable = ActionCable.createConsumer();

App.comments = App.cable.subscriptions.create('CommentsChannel', {
  received: function(data) {
    this.renderComments(data);
  },

  renderComments: function(data) {
    $('.comments_section').html(data);
    console.log(data);
  }
});