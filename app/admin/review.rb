ActiveAdmin.register Review do
  

  controller do
    def permitted_params
      params.permit!
    end

    def approved_review
      review = Review.find params[:id]
      if review.approve
        review.update_attributes(approve: false )
      else
        review.update_attributes(approve: true )
      end
      redirect_to :back      
    end
  end

  form do |f|
    f.inputs do
      input :email
      input :name
      input :review_type
      input :review
      input :star
      input :approve
    end

    f.actions
  end

  index do
    selectable_column
    column :id
    column :customer_name
    column :email
    column :name
    column :review_type
    column :approve

    actions defaults: true do |review|
      if review.approve
        link_to 'Unapprove' , approved_review_path(review)
      else
        link_to 'Approve' , approved_review_path(review)
      end
    end

  end
  


end
