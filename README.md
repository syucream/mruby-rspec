# mruby-rspec

mruby [rspec](http://rspec.info/)

# example

If you write a below spec:

```ruby
describe "example" do
  it "should be successed." do
    expect(true).to be true
  end

  it "should be failed." do
    expect(true).to be false
  end
end
```

then you can get a result:

```
$ mruby examples/rspec_test.rb
.F
```

# License

MITL

This product is based on [sagmor/mruby-spec](https://github.com/sagmor/mruby-spec), and [mruby](https://github.com/mruby/mruby).
