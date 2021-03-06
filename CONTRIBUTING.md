# How to become a contributor and submit your own code

## Contributor License Agreements

We'd love to accept your sample apps and patches! Before we can take them, we
have to jump a couple of legal hurdles.

Please fill out either the individual or corporate Contributor License
Agreement (CLA).

  * If you are an individual writing original source code and you're sure you
    own the intellectual property, then you'll need to sign an [individual CLA]
    (https://developers.google.com/open-source/cla/individual).
  * If you work for a company that wants to allow you to contribute your work,
    then you'll need to sign a [corporate CLA]
    (https://developers.google.com/open-source/cla/corporate).

Follow either of the two links above to access the appropriate CLA and
instructions for how to sign and return it. Once we receive it, we'll
be able to accept your pull requests.

## Contributing A Patch

1. Submit an issue describing your proposed change to the repo in question.
1. The repo owner will respond to your issue promptly.
1. If your proposed change is accepted, and you haven't already done so, sign a
   Contributor License Agreement (see details above).
1. Fork the desired repo, develop and test your code changes.
1. Ensure that your code adheres to the existing style in the sample to which
   you are contributing.
1. Ensure that your code has an appropriate set of unit tests which all pass.
1. Submit a pull request.

## Style

We adhere as much as possible to the [ruby-style-guide][] and make the code
[rubocop][] compliant. Tests are setup to fail if there are style guide
violations.

## Testing

Please make sure all tests pass before sending a patch. This will help us to
approve your change faster.

As a matter of policy the master branch is always passing all tests, and changes
that break tests cannot be accepted. If that's your case reach out and we can
help you get it fixed.

### Running Tests

```
gem install bundler
bundle install
bundle exec rspec
bundle exec rubocop
```

## Auto generated files

Various of the files in this repository are automatically generated by
puppet-codegen. Such files contain a prominent comment warning for its
auto generated origins. However some types, such as JSON or MD, do not allow
embedding comments without breaking the file or causing side effects.

### Changing auto generated files

Of course these files are not perfect there will inevitably be issues with them.
If you find an issue with them there are 2 options:

1. Send a patch to the affected files to us and we'll update the source used to
   generate the file, thus addressing the issue. Note that in this option your
   patch will not be accepted but will be used as a guide to fix the original
   file.

2. Change the file directly in the sources used by puppet-codegen. By taking
   this approach your change will be attributed to you, as you'd be the author
   of the change. If you'd like to take credit for the change this is the
   recommended approach. This approach has the nice side effect to fix all other
   projects that have the same issue at once.

### File list

The list below contains all the files that were automatically generated by
puppet-codegen:

  * .gitignore
  * .rubocop.yml
  * .tests/end2end/data/bucket.pp
  * .tests/end2end/data/bucket_access_control.pp
  * .tests/end2end/data/bucket~acl.pp
  * .tests/end2end/data/delete_bucket.pp
  * CONTRIBUTING.md
  * examples/bucket.pp
  * examples/bucket_access_control.pp
  * examples/bucket~acl.pp
  * examples/delete_bucket.pp
  * Gemfile
  * lib/google/hash_utils.rb
  * lib/google/object_store.rb
  * lib/google/storage/network/base.rb
  * lib/google/storage/network/delete.rb
  * lib/google/storage/network/get.rb
  * lib/google/storage/network/post.rb
  * lib/google/storage/network/put.rb
  * lib/google/storage/property/array.rb
  * lib/google/storage/property/base.rb
  * lib/google/storage/property/boolean.rb
  * lib/google/storage/property/bucket_acl.rb
  * lib/google/storage/property/bucket_action.rb
  * lib/google/storage/property/bucket_condition.rb
  * lib/google/storage/property/bucket_cors.rb
  * lib/google/storage/property/bucket_lifecycle.rb
  * lib/google/storage/property/bucket_logging.rb
  * lib/google/storage/property/bucket_name.rb
  * lib/google/storage/property/bucket_owner.rb
  * lib/google/storage/property/bucket_project_team.rb
  * lib/google/storage/property/bucket_rule.rb
  * lib/google/storage/property/bucket_versioning.rb
  * lib/google/storage/property/bucket_website.rb
  * lib/google/storage/property/bucketaccesscontrol_project_team.rb
  * lib/google/storage/property/enum.rb
  * lib/google/storage/property/integer.rb
  * lib/google/storage/property/string.rb
  * lib/google/storage/property/string_array.rb
  * lib/google/storage/property/time.rb
  * lib/google/string_utils.rb
  * lib/puppet/provider/gstorage_bucket/google.rb
  * lib/puppet/provider/gstorage_bucket_access_control/google.rb
  * lib/puppet/type/gstorage_bucket.rb
  * lib/puppet/type/gstorage_bucket_access_control.rb
  * metadata.json
  * README.md
  * spec/.rubocop.yml
  * spec/bundle.rb
  * spec/copyright.rb
  * spec/copyright_spec.rb
  * spec/data/copyright_bad1.rb
  * spec/data/copyright_bad2.rb
  * spec/data/copyright_good1.rb
  * spec/data/copyright_good2.rb
  * spec/data/network/gstorage_bucket/success1~name.yaml
  * spec/data/network/gstorage_bucket/success1~title.yaml
  * spec/data/network/gstorage_bucket/success2~name.yaml
  * spec/data/network/gstorage_bucket/success2~title.yaml
  * spec/data/network/gstorage_bucket/success3~name.yaml
  * spec/data/network/gstorage_bucket/success3~title.yaml
  * spec/data/network/gstorage_bucket_access_control/success1~name.yaml
  * spec/data/network/gstorage_bucket_access_control/success1~title.yaml
  * spec/data/network/gstorage_bucket_access_control/success2~name.yaml
  * spec/data/network/gstorage_bucket_access_control/success2~title.yaml
  * spec/data/network/gstorage_bucket_access_control/success3~name.yaml
  * spec/data/network/gstorage_bucket_access_control/success3~title.yaml
  * spec/fake_auth.rb
  * spec/gstorage_bucket_access_control_provider_spec.rb
  * spec/gstorage_bucket_provider_spec.rb
  * spec/hash_utils_spec.rb
  * spec/network_blocker.rb
  * spec/network_blocker_spec.rb
  * spec/network_delete_spec.rb
  * spec/network_get_spec.rb
  * spec/network_post_spec.rb
  * spec/network_put_spec.rb
  * spec/puppetlint_spec.rb
  * spec/spec_helper.rb
  * spec/string_utils_spec.rb
  * spec/test_constants.rb

The list below contains all the files that were automatically sourced from a
central location:

  * .tests/README.md
  * Gemfile.lock
  * LICENSE
  * spec/data/poor_example.pp

[ruby-style-guide]: https://github.com/bbatsov/ruby-style-guide
[rubocop]: https://rubocop.readthedocs.io/en/latest/
