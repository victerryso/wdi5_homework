var app = app || {};

app.Router = Backbone.Router.extend({
  routes: {
    '': 'index',
    'posts/:id': 'getPost'
  },
  initialize: function () {
    console.log("router initialized");
    app.posts = new app.Posts([
      new app.Post({ id: 1, title: 'First Post', content: 'Backbone is friggin confusing'}),
      new app.Post({ id: 2, title: 'Second Post', content: 'Nope still not getting it'}),
      new app.Post({ id: 3, title: 'Third Post', content: 'stupid stupid'}),
      new app.Post({ id: 4, title: 'Fourth Post', content: 'i feel sick...'})
    ]);
  },
  index: function () {
    console.log('you reached index');
    var appView = new app.AppView({collection: app.posts});
    appView.render();
  },
  getPost: function (id) {
    var appView = new app.AppView({collection: app.posts});
    appView.render();
    var post = app.posts.get(id);
    new app.PostView({model: post});
  }
});