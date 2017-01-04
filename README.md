riofs-build
===========

Repository for building and distributing riofs binaries.

Building
--------

In order to build, you need to have Docker running and run ``make riofs``:

```
% make riofs
```

Uploading to S3
---------------

Once the binary is built, you can upload it to S3 using
[awscli](https://aws.amazon.com/cli/):

```
% S3_BUCKET_NAME=<your-bucket> S3_RIOFS_OBJECT_KEY=<object-name> make upload
```

RioFS License
-------------

RioFS is [licensed under
GPLv3](https://github.com/skoobe/riofs/blob/master/COPYING), keep that in mind
when distributing its binaries :)
