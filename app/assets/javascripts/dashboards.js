//= require jquery
//= require jquery_ujs
//= require bootstrap.min.js
//= require metisMenu/jquery.metisMenu.js
//= require slimscroll/jquery.slimscroll.min.js
//= require dashboard.js
//= require gritter/jquery.gritter.min.js
//= require toastr/toastr.min.js
//= require refile
//= require bootstrap_refile
//= require cocoon
//= require cocoon-limiter/cocoon_limiter.js

// $(document).ready(function() {
//  setTimeout(function() {
//    $.gritter.add({
//      title: 'You have two new messages',
//      text: 'Go to <a href="mailbox.html" class="text-warning">Mailbox</a> to see who wrote to you.<br/> Check the date and today\'s tasks.',
//      time: 5000
//    });
//  }, 5000);
// });

$(document).ready(function() {
  setTimeout(function() {
    toastr.options = {
      closeButton: true,
      progressBar: true,
      showMethod: 'slideDown',
      timeOut: 4000
    };
    toastr.success('Go to <a href="mailbox.html" class="text-warning">Mailbox</a> to see who wrote to you. Check the date and today\'s tasks.');
  }, 1300);
});
