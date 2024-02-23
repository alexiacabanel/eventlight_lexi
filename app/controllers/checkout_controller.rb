class CheckoutController < ApplicationController
  def create
    @total = params[:total].to_d
    @event_id = params[:event_id]
    puts "Debug: Create action - @event_id: #{@event_id}"
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            unit_amount: (@total * 100).to_i,
            product_data: {
              name: 'Rails Stripe Checkout'
            }
          },
          quantity: 1
        }
      ],
      metadata: {
        event_id: @event_id
      },
      mode: 'payment',
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    redirect_to @session.url, allow_other_host: true
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    puts "Debug: Success action - @session.metadata: #{@session.metadata}"
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    puts "Debug: Success action - @event_id: #{@event_id}"
    @event_id = @session.metadata['event_id']
    puts @event_id
    event = Evenement.find(@event_id)
    participation = Participation.new(evenement: event, user: current_user,
                                      stripe_customer_id: @session.customer_details.email)
    if participation.save
      # Faire quelque chose en cas de succès, par exemple, rediriger vers une page de confirmation
      redirect_to evenements_path, notice: 'Participation créée avec succès.'
    else
      # Gérer les erreurs en cas d'échec de l'enregistrement de la participation
      redirect_to erreur_path, alert: 'Erreur lors de la création de la participation.'
    end
  end

  def cancel; end
end
