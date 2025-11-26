ActiveAdmin.register Order do
  permit_params :user_id, :total, :status

  index do
    selectable_column
    id_column
    column :user
    column :total
    column :status
    column :address
    column :phone_number
    column :created_at
    actions
  end

  filter :user
  filter :total
  filter :status
  filter :address
  filter :phone_number
  filter :created_at

  form do |f|
    f.inputs do
      f.input :user
      f.input :total
      f.input :status
    end
    f.actions
  end

  show do
    attributes_table do
      row :user
      row :total
      row :status
      row :address
      row :phone_number
      row :created_at
      row :updated_at
    end

    panel "Order Items" do
      table_for order.order_items do
        column :book
        column :quantity
        column :price
      end
    end
    active_admin_comments
  end
end
