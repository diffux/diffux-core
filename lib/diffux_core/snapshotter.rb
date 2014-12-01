require 'selenium-webdriver'
require 'chunky_png'

module Diffux
  # Snapshotter is responsible for delegating to PhantomJS to take the snapshot
  # for a given URL and viewoprt, and then saving that snapshot to a file and
  # storing any metadata on the Snapshot object.
  class Snapshotter
    # @param url [String] the URL to snapshot
    # @param viewport_width [Integer] the width of the screen used when
    #   snapshotting
    # @param outfile [File] where to store the snapshot PNG.
    # @param user_agent [String] an optional useragent string to used when
    #   requesting the page.
    # @param crop_selector [String] an optional string containing a CSS
    #   selector. If this is present, and the page contains something matching
    #   it, the resulting snapshot image will only contain that element. If the
    #   page contains multiple elements mathing the selector, only the first
    #   element will be used.
    # @param driver [Selenium::WebDriver] an already-initialized driver (can be
    #   used to speed things up).
    def initialize(url:     raise, viewport_width: raise,
                   outfile: raise, user_agent: nil,
                   crop_selector: nil, driver: nil)
      @viewport_width = viewport_width
      @crop_selector  = crop_selector
      @user_agent     = user_agent
      @outfile        = outfile
      @url            = url
      @driver         = driver
    end

    # Takes a snapshot of the URL and saves it in the outfile as a PNG image.
    #
    # @return [Hash] a hash containing the following keys:
    #   title [String] the <title> of the page being snapshotted
    #   log   [String] a log of events happened during the snapshotting process
    def take_snapshot!
      driver = @driver || Selenium::WebDriver.for(:firefox)
      driver.manage.window.resize_to(@viewport_width, @viewport_width * 16 / 9)
      driver.navigate.to @url
      disable_animations(driver)
      result = { title: driver.title }
      driver.save_screenshot(@outfile)
      if @crop_selector
        elem = driver.find_element(:css, @crop_selector)
        image = ChunkyPNG::Image.from_file(@outfile)
        image.crop!(elem.location.x,
                    elem.location.y,
                    elem.size.width,
                    elem.size.height)
        image.save(@outfile)
      end

      driver.quit
      result
    end

    def disable_animations(driver)
      driver.execute_script <<-EOS
        // CSS Transitions
        var css = document.createElement('style');
        css.type = 'text/css';
        var styles = ['', '-webkit-', '-moz-', '-ms-'].map(
          function(prefix) {
            return prefix + 'transition: none !important; ' +
                   prefix + 'animation-duration: 0 !important;';
          }).join(' ');
        css.innerHTML = '* {' + styles + '}';
        document.head.appendChild(css);

        // jQuery
        if (window.jQuery) {
          jQuery.fx.off = true;
          jQuery('*').stop(true, true);
        }

        // Prevent things like blinking cursors by un-focusing any focused
        // elements
        document.activeElement.blur();
      EOS
    end
  end
end
