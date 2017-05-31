jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  payment.setupForm()

payment =
  setupForm: ->
    $('#new_order_detail').submit ->
      $('input[type=submit]').attr('disabled', true)
      Stripe.card.createToken($('#new_order_detail'), payment.handleStripeResponse)
      false

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#new_order_detail').append($('<input type="hidden" name="stripeToken" />').val(response.id))
      $('#new_order_detail')[0].submit()
    else
      $('.stripe-error').text(response.error.message).show()
      $('input[type=submit]').attr('disabled', false)
