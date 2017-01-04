.PHONY: upload clean

RIOFS_VERSION=$(shell grep "ENV.*RIOFS_VERSION" Dockerfile | awk '{print $$3}')

riofs: Dockerfile
	docker build --rm --pull -t riofs-builder-image .
	docker rm -f riofs-builder || true
	docker run --name riofs-builder riofs-builder-image true
	docker cp riofs-builder:/riofs/src/riofs .
	docker rm riofs-builder
	docker rmi riofs-builder-image

upload: riofs
	test -n "$${S3_BUCKET_NAME}"
	aws s3 cp riofs s3://$${S3_BUCKET_NAME}/$${S3_RIOFS_OBJECT_KEY:-$(RIOFS_VERSION)/riofs}

clean:
	git clean -dfX
