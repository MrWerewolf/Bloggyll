---
layout: post
title: Techy Article
category: Technology
tags:
    - Code
    - Example
    - Tag with spaces
---

This is a technical post with some code in it.

Here's an inline hello world example: `puts 'Hello world'`


A more complex example taken from the [ruby article on wikipedia][ruby].

{:class="brush: ruby"}
~~~~~
puts 'Hello world'

def create_set_and_get(initial_value=0) # Note the default value of 0
  closure_value = initial_value
  return Proc.new {|x| closure_value = x}, Proc.new { closure_value }
end

setter, getter = create_set_and_get  # ie. returns two values
setter.call(21)
getter.call # => 21

#You can also use a parameter variable as a binding for the closure. So the above can be rewritten as...

def create_set_and_get(closure_value=0)
  return proc {|x| closure_value = x } , proc { closure_value }
end
~~~~~

Here's an example without any fancy highlighting:

    #You can also use a parameter variable as a binding for the closure. So the above can be rewritten as...

    def create_set_and_get(closure_value=0)
      return proc {|x| closure_value = x } , proc { closure_value }
    end

[ruby]:http://en.wikipedia.org/wiki/Ruby_(programming_language)

