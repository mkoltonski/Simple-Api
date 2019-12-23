require 'rails_helper'

RSpec.describe AuthenticateUser do
  let(:user) { create(:user) }

  subject(:valid_auth_obj) { decribed_class.new(user.email, user.password) }
  subject(:invalid_auth_obj) { described_class.new('foo', 'bar') }

 described '#call' do

    context 'when valid credentials' do
      it 'returns an auth token' do
        token = valid_auth_obj.call
	expect(token).not_to be_nill
      end
    end

    context 'when invalid credentials' do
      it 'raises and authentication error' do
        expect { invalid_auth_obj.call }
	  .to raise_error(
	    ExceptionHandler::AuthenticationError,
	    /Invalid credentials/
	  )
      end
    end
  end
end 
 