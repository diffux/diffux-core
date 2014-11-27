require 'spec_helper'
require 'json'

describe Diffux::Snapshotter do
  let(:viewport_width) { 320 }
  let(:user_agent)     { nil }
  let(:outfile)        { nil }
  let(:url)            { 'http://joelencioni.com' }
  let(:crop_selector)  { nil }

  let(:service) do
    described_class.new(viewport_width: viewport_width,
                        crop_selector:  crop_selector,
                        user_agent:     user_agent,
                        outfile:        outfile,
                        url:            url)
  end

  describe '#take_snapshot!' do
    # needs to be rewritten for webdriver
  end
end
