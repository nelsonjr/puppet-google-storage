# Copyright 2017 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by puppet-codegen and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

require 'spec_helper'

TEST_URI = URI.parse('https://google.com')

describe Google::Storage::NetworkBlocker do
  let(:uri) { described_class::ALLOWED_TEST_URI }

  context '#allow_get' do
    before(:each) do
      described_class.instance.allow_get(uri, 200, 'text/html', 'hello')
    end

    subject { Net::HTTP.get(uri) }

    it { is_expected.to eq 'hello' }
  end

  context '#allow_post' do
    before(:each) do
      described_class.instance.allow_post(
        uri_in: uri, type_in: 'text/plain', body_in: 'my input',
        code: 200, uri_out: uri, type_out: 'text/html', body_out: '<html/>'
      )
    end

    subject { Net::HTTP.post_form(uri, q: 'query') }

    it { is_expected.to be_a Net::HTTPOK  }
    it { is_expected.to have_attributes content_type: 'text/html' }
    it { is_expected.to have_attributes code: 200 }
    it { is_expected.to have_attributes body: '<html/>' }
  end

  context '#allow_delete' do
    before(:each) do
      described_class.instance.allow_delete(uri)
    end

    subject do
      Net::HTTP.new(uri.host, uri.port).request(Net::HTTP::Delete.new(uri))
    end

    it { is_expected.to be_a Net::HTTPNoContent }
  end

  context '#allowed_test_hosts' do
    let(:uri) { URI.parse('http://some-other-site.com') }

    before(:each) do
      described_class.instance.allow_get(uri, 200, 'text/html', 'hello')
    end

    context 'failed without #allowed_test_hosts update' do
      subject { -> { Net::HTTP.get(uri) } }
      it { is_expected.to raise_error(IOError) }
    end

    context '#allowed_test_hosts' do
      before(:each) do
        described_class.instance.allowed_test_hosts << \
          { host: uri.host, port: uri.port }
      end

      subject { -> { Net::HTTP.get(uri) } }
      it { is_expected.not_to raise_error }
    end
  end
end

describe Net::HTTP do
  context '#new' do
    subject { -> { described_class.new(TEST_URI) } }

    it { is_expected.to raise_error(IOError, /traffic.*blocked/) }
  end

  # Shortcut form for Net::HTTP::Get
  context '#get' do
    subject { -> { described_class.get(TEST_URI) } }

    it { is_expected.to raise_error(IOError, /traffic.*blocked/) }
  end

  # Shortcut form for Net::HTTP::Get
  context '#get_response' do
    subject { -> { described_class.get_response(TEST_URI) } }

    it { is_expected.to raise_error(IOError, /traffic.*blocked/) }
  end

  # Shortcut form for Net::HTTP::Post
  context '#post_form' do
    subject do
      lambda do
        described_class.post_form(TEST_URI, q: 'My query', per_page: 50)
      end
    end

    it { is_expected.to raise_error(IOError, /traffic.*blocked/) }
  end
end

context Net::HTTP::Get do
  subject do
    lambda do
      http = Net::HTTP.new(TEST_URI.host, TEST_URI.port)
      http.request(Net::HTTP::Get.new(TEST_URI.request_uri))
    end
  end

  it { is_expected.to raise_error(IOError, /traffic.*blocked/) }
end

context Net::HTTP::Post do
  subject do
    lambda do
      http = Net::HTTP.new(TEST_URI.host, TEST_URI.port)

      request = Net::HTTP::Post.new(TEST_URI.request_uri)
      request.set_form_data(q: 'My query', per_page: 50)

      http.request(request)
    end
  end

  it { is_expected.to raise_error(IOError, /traffic.*blocked/) }
end

context Net::HTTP::Delete do
  subject do
    lambda do
      http = Net::HTTP.new(TEST_URI.host, TEST_URI.port)
      http.request(Net::HTTP::Delete.new(TEST_URI.request_uri))
    end
  end

  it { is_expected.to raise_error(IOError, /traffic.*blocked/) }
end
