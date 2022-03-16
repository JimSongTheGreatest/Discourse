# frozen_string_literal: true

# We do not run this in production cause it is intrusive and has
# potential to break stuff, it also breaks under concurrent use
# which rake:multisite_migrate uses
#
# The protection is only needed in Dev and Test
if !Rails.env.production?
  SanePatch.patch("activerecord", "~> 7.0.2") do
    module FreedomPatches
      module SafeMigrations
        require 'migration/safe_migrate'
        Migration::SafeMigrate.patch_active_record!
      end
    end
  end
end
