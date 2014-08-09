var app = app || {};

app.Post = Backbone.Model.extend({
  defaults: {
    id: 0,
    title: 'New Post about Backbone',
    content: 'New Post about Backbone, content goes here'
  }
});