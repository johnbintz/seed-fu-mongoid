# added by cuke-pack

group :wip do
  guard 'cucumber', :env => :cucumber, :paths_from_profile => true, :cli => '--color -p wip' do
    watch(%r{^features/.+.feature$})
    watch(%r{^(app|lib).*})          { 'features' }
    watch(%r{^features/support/.+$})          { 'features' }
    watch(%r{^features/step_definitions/(.+).rb$}) { 'features' }
  end
end
