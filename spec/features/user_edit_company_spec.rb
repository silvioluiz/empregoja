require 'rails_helper'

feature 'User edit company' do
  scenario 'successfully' do
    company = Company.create!(name: 'Campus Code',
                          location: 'São Paulo',
                          mail: 'contato@campus.com.br',
                          phone: '2369-3476')

    visit edit_company_path(company)

    fill_in 'Nome', with: 'Google'
    fill_in 'Local', with: 'Rio de Janeiro'
    fill_in 'Email', with: 'rj@google.com'
    fill_in 'Telefone', with: '123412322'

    click_on 'Atualizar Empresa'

    expect(page).to have_content('Google')
    expect(page).to have_content('Rio de Janeiro')
    expect(page).to have_content('rj@google.com')
    expect(page).to have_content('123412322')

  end

  scenario 'with valid data' do
    company = Company.create!(name: 'Campus Code',
                          location: 'São Paulo',
                          mail: 'contato@campus.com.br',
                          phone: '2369-3476')

    visit edit_company_path(company)

    fill_in 'Nome', with: ''

    click_on 'Atualizar Empresa'

    expect(page).to have_content('Não foi possível atualizar a Empresa')

  end
end
