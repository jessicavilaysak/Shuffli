shuffliApp.factory('Page', function() {
   var title = 'Shuffli.';
   return {
     title: function() { return title; },
     setTitle: function(newTitle) { title = newTitle }
   };
});