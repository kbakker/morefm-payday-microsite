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
      complete: ->
        window.hideLoader()
    return false