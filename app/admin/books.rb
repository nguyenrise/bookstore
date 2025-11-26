ActiveAdmin.register Book do
  permit_params :title, :author, :description, :price, :stock_quantity
end
