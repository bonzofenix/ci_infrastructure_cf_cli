require 'cancun'
require 'cancun/highline'
require 'bosh-deployer'
require 'fileutils'

module CiInfrastructureCfCli; module Commands; end ;end

class CiInfrastructureCfCli::Commands::Init 
  include ::Cancun::Highline
  include Bosh::Deployer::BoshSettings

  attr_reader :env_name

  def initialize(env_name)
    @env_name = env_name
  end

  def perform
    save("#{env_name}/Vagrantfile", vagrantfile)
    save("#{env_name}/jobs.yml", jobs_yml)
  end


  def jenkins_flavor
    @jenkins_flavor ||= ask('Jenkins VM flavor:') do |q|
      q.default =  'm1.large'
    end
  end

  def openstack_keypair_name
    @openstack_keypair_name ||= ask('Keypair name:') do |q|
      q.default = 'firstbosh'
    end
  end

  def jenkins_floating_ip
    @jenkins_floating_ip ||= ask('Jenkins floating IP:') do |q|
      q.default =  ''
    end
  end

  protected
  def save(filename, content)
    if File.exists?(filename) and !agree "#{filename} already exists, do you want to overwrite it?"
      say 'Vagrantfile generation cancelled!'
    else
      dirname = File.dirname("./#{env_name}/")
      FileUtils.mkdir_p(env_name)
      say "Creating #{filename}"
      File.open(filename, 'w') { |f| f.write(content) }
    end
  end

  def template(name)
    ERB.new(File.read(File.expand_path("../../../../assets/#{name}", __FILE__)))
  end

  def vagrantfile
    say_bold "Provide the following information for #{env_name} configuration:"
    template('Vagrantfile.erb').result(binding)
  end

  def jobs_yml
    template('jobs.yml.erb').result(binding)
  end
end
