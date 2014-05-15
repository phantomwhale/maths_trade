jQuery ->
  $(".toggle_want_behaviour")
    .bind "ajax:success", (event, data) ->
      link = $(event.target)
      link.replaceWith(link.data('success-text'))
