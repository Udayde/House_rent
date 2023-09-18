Rails.configuration.stripe = { 
    :publishable_key => 'pk_test_51Nro1qJWFdjw4nM14mr4NNUdzpNbxXpdDPEkvBHd3Dk0x1s2RyeULWdvSe5ii4xMrCF38lXPBodRsw1PVILyRsX400EV7jCipn',
    :secret_key => 'sk_test_51Nro1qJWFdjw4nM1H4dRBnTpUvHNF1JHYWs3q0Q4rmk5xIsU0Jq4YV2yWj369aPBolgWJmVne6p3AaovqsQi5zjJ00mis6Hk1f'
  } 
  Stripe.api_key = Rails.configuration.stripe[:secret_key]