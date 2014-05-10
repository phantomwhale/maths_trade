$(document).ready ->
  $(".submit_want_behaviour")
    .bind "ajax:success", (event, data) ->
      $(event.target).replaceWith("ADDED")
