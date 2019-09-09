$ ->

  window.showLoader = ->
    $('#loader').fadeIn()

  window.hideLoader = ->
    $('#loader').fadeOut()

  $(document).on 'submit', 'form.new_entry', ->
    form = $(this)
    $.ajax
      data: form.serialize()
      url: '/entries'
      type: 'post'
      beforeSend: ->
        window.showLoader()
      success: (data) ->
        $('#modal-success').modal('show')
      error: (data) ->
        $('#modal-failure').modal('show')
      complete: ->
        window.hideLoader()
        form.find('input').val('').focus()
    return false