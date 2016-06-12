import { Meteor } from 'meteor/meteor';

Meteor.startup(function () {
  console.log('hello world');
  let test = App.Foo.MyModule('arg1', 'arg2');
});

App.Foo.MyModule('and here too');
