# frozen_string_literal: true

schedule_file = File.expand_path('../../../config/scheduler.yml', __FILE__)

if File.exist?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end
