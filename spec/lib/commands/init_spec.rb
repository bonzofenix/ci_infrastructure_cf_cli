require_relative '../../../lib/ci_infrastructure_cf_cli/commands/init'

def clean_env
  `rm -rf #{env_name}` 
end

describe CiInfrastructureCfCli::Commands::Init do
  include ::Cancun::Test
  before{ init_cancun_test }

  let(:env_name){ 'dev' } 
  let(:init){ described_class.new(env_name) }

  describe 'perform' do
    let(:args) do
      [ 'admin', 'admin','jenkins_flavor',  'http://keystone_url.com',
        '','internal', 'dev', '1.2.3.4' ]
    end

    subject(:perform_init) do
      execute do
        init.perform
      end.and_type *args
    end

    before{ clean_env }

    it 'should create the file' do
      perform_init
      expect(File.read('spec/fixtures/Vagrantfile'))
        .to eq(File.read("#{env_name}/Vagrantfile"))
    end

    it 'should create a jobs.yml' do
      perform_init
      expect(File.read('spec/fixtures/jobs.yml'))
        .to eq(File.read("#{env_name}/jobs.yml"))
    end

    after{ clean_env }
  end
end
