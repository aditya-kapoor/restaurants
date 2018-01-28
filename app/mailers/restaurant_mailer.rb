class RestaurantMailer < ApplicationMailer
  def new_reservation(reservation_id)
    @reservation = Reservation.find(reservation_id)
    @restaurant = @reservation.restaurant
    mail(to: @reservation.restaurant.email)
  end
end
