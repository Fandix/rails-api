require 'rails_helper'

describe 'Books API', type: :request do
    describe 'GET /books' do
        it 'returns all books' do
            FactoryBot.create(:book, title: '1984', author: 'Fandix')
            FactoryBot.create(:book, title: '1994', author: 'TOKO')
    
            get '/books'
    
            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body).size).to eq(2)
        end
    end

    describe 'POST /books' do
        it 'create a new book' do
            expect {
                post '/books', params: { book: { title: 'The Fandix day', author: 'Fandix' } }
            }.to change { Book.count }.from(0).to(1)

            expect(response).to have_http_status(:created)
        end
    end

    describe 'DELETE /books/:id' do
        it 'deletes a book' do
            book = FactoryBot.create(:book, title: '1984', author: 'Fandix')

            expect {
                delete "/books/#{book.id}"
            }.to change { Book.count }.from(1).to(0)
            
            expect(response).to have_http_status(:no_content)
        end
    end

end