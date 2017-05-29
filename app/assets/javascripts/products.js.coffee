jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  product.setupForm()

product =
  setupForm: ->
    $('#new_product').submit ->
      $('input[type=submit]').attr('disabled', true)
      Stripe.bankAccount.createToken($('#new_product'), product.handleStripeResponse)
      false

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#new_product').append($('<input type="hidden" name="stripeToken" />').val(response.id))
      $('#new_product')[0].submit()
    else
      $('.stripe-error').text(response.error.message).show()
      $('input[type=submit]').attr('disabled', false)
