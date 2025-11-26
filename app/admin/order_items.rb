ActiveAdmin.register OrderItem do
  permit_params :order_id, :book_id, :quantity, :price

  index do
    selectable_column
    id_column
    column :order
    column :book
    column :quantity
    column :price
    actions
  end

  filter :order
  filter :book

  form do |f|
    f.inputs do
      f.input :order
      f.input :book
      f.input :quantity
      f.input :price
    end
    f.actions
  end
end
