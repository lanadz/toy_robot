require 'spec_helper'

RSpec.describe Runner do
  let(:executor) {Executor.new}

  subject do
    described_class.new(source: commands, executor: executor)
  end

  describe '#execute' do
    context 'first example' do
      let(:commands) do
        [
          'PLACE 0,0,NORTH',
          'MOVE',
          'REPORT'
        ]
      end

      it 'expects to report 0,1,NORTH ' do
        subject.execute
        expect(executor.command('report')).to eq '0,1,NORTH'
      end
    end

    context 'second example' do
      let(:commands) do
        [
          'PLACE 0,0,NORTH',
          'LEFT',
          'REPORT'
        ]
      end

      it 'expects to report 0,0,WEST' do
        subject.execute
        expect(executor.command('report')).to eq '0,0,WEST'
      end
    end

    context 'third example' do
      let(:commands) do
        [
          'PLACE 1,2,EAST',
          'MOVE',
          'MOVE',
          'LEFT',
          'MOVE',
          'REPORT'
        ]
      end

      it 'expects to report 3,3,NORTH' do
        subject.execute
        expect(executor.command('report')).to eq '3,3,NORTH'
      end
    end
  end
end
