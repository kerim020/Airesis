class RemoveBlogImageUrl2 < ActiveRecord::Migration
  def change
    User.where('users.id >= 2000').where.not(blog_image_url: nil).order(:id).find_each do |user|
      Rails.logger.info "Parsing #{user.blog_image_url}"
      puts "Parsing #{user.id}"
      user.avatar_url = user.blog_image_url
      user.save
    end
  end
end