# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $beforeEl = $('div.question_possible_parents')
  $button = $("#js-add-answer")
  labelPattern = $button.data('labelPattern')

  $button.on 'click', (e) ->
    e.preventDefault()
    number = $("input.answer").length + 1
    context =
      label: "#{ labelPattern }#{ number }"
      id: "question_answer_content_#{ number }"
    $beforeEl.before HandlebarsTemplates['questions/answer_field'](context)

  $(document).on 'click', 'a.js-remove-answer', (e) ->
    e.preventDefault()
    $(@).closest('div.control-group').fadeOut 'slow', () -> $(@).remove()

jQuery ready
$(document).on 'page:load', ready
