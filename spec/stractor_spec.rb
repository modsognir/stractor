require 'spec_helper'

describe Stractor do
  describe '#parse' do
    context 'nagios email' do
      let(:template) do
        %q(***** Nagios *****

Notification Type: {{ problem }}

Service: {{ service }}
Host: {{ host }}
Address: {{ address }}
State: {{ state }}

Date/Time: {{ datetime }}

Additional Info:

{{ additional_info }}
        )
      end

      let(:content) do
        %q(***** Nagios *****

Notification Type: PROBLEM

Service: check_https_cms
Host: nginx.jsf.io
Address: nginx.jsf.io
State: CRITICAL

Date/Time: Fri Feb 28 11:34:02 UTC 2014

Additional Info:

CHECK_NRPE: Socket timeout after 10 seconds.
        )
      end

      subject(:matches) { Stractor.parse(content, template) }

      {
        problem: 'PROBLEM',
        service: 'check_https_cms',
        host: 'nginx.jsf.io',
        address: 'nginx.jsf.io',
        state: 'CRITICAL',
        datetime: 'Fri Feb 28 11:34:02 UTC 2014',
        additional_info: 'CHECK_NRPE: Socket timeout after 10 seconds.'
      }.each do |var, expected|
        it "matches #{expected} in #{var}" do
          expect(matches[var]).to eql(expected)
        end
      end
    end
  end
end