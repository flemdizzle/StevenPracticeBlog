require 'rails_helper'

def test_post_one
    Post.create!(
      title: "Post One",
      body: "Body for Post One"
    )
end

def test_post_two
    Post.create!(
      title: "Post Two",
      body: "Body for Post Two"
    )
end

feature "manage Posts" do
    scenario "List all blog posts" do
      t1 = test_post_one
      visit drafts_path
      click_on 'Publish'
      t2 = test_post_two
      visit drafts_path
      click_on 'Publish'
      expect(page).to have_content(/Post One/)
      expect(page).to have_content(/Post Two/)
    end

    scenario "click new button and find form" do
      visit posts_path
      click_on 'New Post'
      expect(current_path).to eq(new_post_path)
      expect(page).to have_css('form')
   end

   scenario "New post for works" do
      visit new_post_path
      fill_in 'Title', with: 'New Post'
      fill_in 'Body', with: 'New post body'
      click_on 'Create Post'
      expect(current_path).to eq(drafts_path)
      click_on 'Publish'
      expect(current_path).to eq(posts_path)
      expect(page).to have_content(/New Post/)
      expect(page).to have_content(/New post body/)
   end

   scenario "users can edit posts" do
      t1 = test_post_one
      visit drafts_path
      click_on 'Publish'
      expect(current_path).to eq(posts_path)
      click_on 'Edit'
      expect(current_path).to eq(edit_post_path(Post.last.id))
      fill_in 'Title', with: 'New Post'
      fill_in 'Body', with: 'New post body'
      click_on 'Update Post'
      expect(current_path).to eq(posts_path)
      expect(page).to have_content(/New Post/)
      expect(page).to have_content(/New post body/)

   end

end
