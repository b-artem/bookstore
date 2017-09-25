require 'rails_helper'
require 'support/factory_girl'
require 'support/devise'

shared_examples 'delete' do
  let(:book) { create :book }
  background do
    allow(Book).to receive(:best_seller).and_return(book)
    visit home_index_path
  end

  context "user clicks 'x' button", js: true do
    let!(:line_item) { create(:line_item, cart: Cart.last, book: book) }
    background { visit cart_path(Cart.last) }

    scenario 'removes product from Cart view' do
      click_button("delete-#{line_item.id}")
      expect(page).not_to have_content(line_item.book.title)
      expect(page).to have_content('Product was successfully removed')
    end

    scenario 'decrements number of products in Cart' do
      expect { click_button("delete-#{line_item.id}"); wait_for_ajax }
                .to change { Cart.last.line_items.count }.by(-1)
    end
  end
end

feature 'Cart' do
  feature 'Delete' do
    context 'when user is a guest' do
      it_behaves_like 'delete'
    end

    context 'when user is logged in' do
      let(:user) { create(:user) }
      background { sign_in user }
      it_behaves_like 'delete'
    end
  end
end
