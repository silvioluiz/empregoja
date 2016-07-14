require 'rails_helper'

feature 'User create categories' do
  scenario 'successfully' do
      category = Category.new(name: 'Analista de Teste')

      visit new_category_path

      fill_in 'Nome',  with: category.name

      click_on 'Criar categoria'
      
      expect(page).to have_content(category.name)

  end

  scenario 'with invalid data' do

      visit new_category_path

      click_on 'Criar categoria'

      expect(page).to have_content('Não foi possível criar a categoria')

  end

end
