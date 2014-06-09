require "spec_helper"

describe SidekiqSquash::Middleware do
  let(:worker) { double('instance of sidekiq worker') }
  let(:job) { double('sidekiq job data') }
  let(:queue) { 'name_of_job_queue' }

  before do
    allow(Squash::Ruby).to receive(:notify)
  end

  it "yields to the block" do
    block_called = false

    subject.call(worker, job, queue) do
      block_called = true
    end

    expect(block_called).to eq(true)
  end

  it "notifies squash of exceptions in the block and reraises them" do
    whoops = RuntimeError.new("whoops")

    expect {
      subject.call(worker, job, queue) do
        raise whoops
      end
    }.to raise_error(whoops)

    expect(Squash::Ruby).to have_received(:notify).with(whoops, parameters: job)
  end

  it "notifies of exceptions that are not in RuntimeError hierarchy" do
    expect {
      subject.call(worker, job, queue) do
        ThisWillRaiseANameError
      end
    }.to raise_error(NameError)

    expect(Squash::Ruby).to have_received(:notify).with(instance_of(NameError), parameters: job)
  end
end
