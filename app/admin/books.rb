ActiveAdmin.register Book do
  permit_params :title, :author, :description, :price, :stock_quantity, :image

  form do |f|
    f.inputs do
      f.input :title
      f.input :author
      f.input :description
      f.input :price
      f.input :stock_quantity
      f.input :image, as: :file
    end
    f.actions
  end
end
