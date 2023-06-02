module Domain
end

Rails.autoloaders.main.push_dir Rails.root.join('domain'), namespace: Domain
