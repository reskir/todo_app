require('riot');
require('./todo.tag');

riot.mount('*', {
  title: 'I want to behave!',
  items: [{
    title: 'Avoid excessive caffeine Avoid excessive caffeine Avoid excessive caffeine',
    done: true
  }, {
    title: 'Hidden item',
    hidden: true
  }, {
    title: 'Be less provocative'
  }, {
    title: 'Be nice to people'
  }]
});
