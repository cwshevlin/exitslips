# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    # removeField(this)
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    console.log($(this).data('fields').replace(regexp, time))
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('form').on 'click', '.remove_question', (event) ->
    if window.confirm("Are you sure?")
      # removeField(this)
      $(this).prev('input[type=hidden]').val('1')
      $(this).closest('fieldset').hide()
      event.preventDefault()

  $('form').on 'change', '.open-response-checkbox', (event) ->
    handleOpenResponseBox(event.target)

handleOpenResponseBox = (box) ->
  question = $(box).closest('fieldset')
  if $(box).prop("checked") == true
    $(question).children('fieldset').hide()
    $(question).children('.add_fields').hide()
  else if $(box).prop("checked") == false
    $(question).children('fieldset').show()
    $(question).children('.add_fields').show()

$('#new_quiz').on 'submit', (event) ->
  validateForm()

validateForm = () ->
  standard = document.forms["#new_quiz"]["standard"].val();
  console.log(standard)



# removeField (deletion_link) ->
#   jQuery(deletion_link).prev('input[type=hidden').val('1')
#   jQuery(deletion_link).closest('fieldset').hide()
#   event.preventDefault()
