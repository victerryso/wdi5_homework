var app = app || {};

app.AppView = Backbone.View.extend({
  el: '#tile',
  initialize: function () {
    console.log('AppView Initialized');
  },
  render: function () {
    this.$el.html(app.templates.appView);
    this.collection.each(function (p) {
      var view = new app.PostListView({model: p});
      $('#posts').append( view.render() );
    });
  }
});