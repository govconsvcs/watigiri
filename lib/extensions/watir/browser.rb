module Watir

  class Browser
    attr_reader :doc

    #
    # Store instance of Nokogiri
    #

    def doc=(html)
      @doc = html
      return if html.nil?

      @reset_doc_hook = ->(browser) { browser.reset_doc }
      after_hooks.add(@reset_doc_hook)
    end

    def reset_doc
      @doc = nil
      after_hooks.delete(@reset_doc_hook)
    end
    #
    # Uses Nokogiri to return the text of page body.
    #
    # @return [String]
    #

    def text!
      body.text!
    end

  end # Browser
end # Watir
