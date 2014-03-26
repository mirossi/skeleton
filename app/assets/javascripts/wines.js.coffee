# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('select#wine_country_code').change (event) ->
    select_wrapper = $('#wine_state_code_wrapper')

    $('select', select_wrapper).attr('disabled', true)

    country_code = $(this).val()

    url = "/info/subregion_options?parent_region=#{country_code}"
    select_wrapper.load(url)