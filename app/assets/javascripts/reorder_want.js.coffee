jQuery ->
  $(".reorder_want_behaviour").sortable(
    axis: 'y'
    handle: '.handle'
    update: ->
      $.post($(this).data('sort-url'), $(this).sortable('serialize'))
  )
