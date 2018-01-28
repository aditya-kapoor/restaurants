class VisitorMailer < ApplicationMailer
  def reservation_confirmed(reservation_id)
    @reservation = Reservation.find(reservation_id)
    @restaurant = @reservation.restaurant
    mail(to: @reservation.visitor.email)
  end
end
