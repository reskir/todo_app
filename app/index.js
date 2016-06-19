require('riot');
require('./todo.tag');

riot.mount('*', {
  title: 'My tasks',
  items: [{
    title: 'Learn how to drive and try to get from A to B destinations',
    done: true
  }, {
    title: 'Read a book'
  }, {
    title: 'Buy a milk'
  }]
});
