require "thor"
require "bosh-deployer"
      require "bosh-deployer/cli/commands/generate_stub"
module CiInfrastructureCfCli
  class ThorCli < Thor

    desc 'generate_stub <NAME>', 'Interactively generates a bosh or cloudfoundry stub. This stub can be use with spiff.'
    def generate_stub(name)
      cmd = Bosh::Deployer::Cli::Commands::GenerateStub.new(
        name, default_path )
        cmd.perform
    end

    desc 'edit_stub <NAME>', 'Edits bosh or cloudfoundry stub for any custom change (eg: number of instances, PEMs, etc)'
    def edit_stub(name)
      filepath = "#{default_path}/#{name}.yml"
      open_file(filepath)
    end

    desc 'provision', 'Provisions ci_infrastructure_cf jenkins machine'
    def provision
      spawn_and_wait('vagrant provision')
    end

    desc 'edit_jobs', 'Lets you edit the job file'
    def edit_jobs
      filepath = "jobs.yml"
      open_file(filepath)
    end

    desc 'init <env_name>', 'Inits a folder that contains a ci_infrastructure_cf deployment for a particular environment (eg.: prod, stag, dev, your_company_name_env).'
    def init(env_name)
      cmd = CiInfrastructureCfCli::Commands::Init.new(env_name)
      cmd.init
    end



    no_commands do
      def open_file(filepath)
        if File.exist?(filepath)
          spawn_and_wait("vim #{filepath}")
        else
          puts "file not found at #{filepath}"
        end
      end

      def default_path
        File.expand_path( "#{`pwd`.strip}/cookbooks/ci_infrastructure_cf/files/default/stubs", __FILE__)
      end

      def spawn_and_wait(cmd)
        pid = spawn(cmd)
        Process.wait(pid)
      end
    end
  end
end
