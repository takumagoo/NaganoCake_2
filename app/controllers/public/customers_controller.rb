class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end
end

private

def customer_params
  params.require(:customers).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
end
