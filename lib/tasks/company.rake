namespace :db do
  task company: :environment do
    Company.destroy_all

    def random_displayed
      ['true', 'false'].sample
    end

    def random_users
      rand(3) + 1
    end

    def created
      ((rand(60) + 2).days.ago + rand(600).minutes).to_s(:db)
    end

    def updated
      (Time.now + rand(36_000).seconds).to_s(:db)
    end

    20.times do
      Company.create(
        user_id: random_users,
        name: FFaker::Company.name,
        description: FFaker::HipsterIpsum.words(10).join(' '),
        status: random_displayed,
        created_at: created,
        updated_at: updated
      )
    end

  end
end

