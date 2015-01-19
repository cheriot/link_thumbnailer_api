require 'spec_helper'
require 'options_parser'

describe OptionsParser do

  let(:params)    { {} }
  let(:instance)  { described_class.new(params) }

  describe '#call' do

    let(:action) { instance.call }

    context 'when parsing integers' do

      let(:params) { { image_limit: '1', redirect_limit: 2 } }

      it { expect(action).to eq({ image_limit: 1, redirect_limit: 2 }) }

    end

    context 'when parsing others' do

      let(:params) { { attributes: ['foo'] } }

      it { expect(action).to eq({ attributes: ['foo'] }) }

    end

  end

end
