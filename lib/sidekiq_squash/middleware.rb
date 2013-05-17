module SidekiqSquash

  # This is a middleware for reporting exception occurred within sidekiq workers.
  class Middleware

    def call(worker, msg, queue)
      begin
        yield
      rescue => e
        Squash::Ruby.notify(e, parameters: msg)
        raise
      end
    end
  end
end
