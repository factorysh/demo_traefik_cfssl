PHONY: pki

pull:
	docker pull cfssl/cfssl

pki/ca.pem:
	cd pki && \
	cfssl gencert -initca ca-csr.json | cfssljson -bare ca -

pki/star.pem: pki/ca.pem
	cd pki && \
    cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=server star.json | cfssljson -bare star

pki/star.example.com.crt+chain: pki/star.pem
	cd pki && \
	cat ca.pem star.pem > star.example.com.crt+chain

star: pki/star.example.com.crt+chain

docker-build: star
	docker-compose build

up:
	docker-compose up -d mirror demo.example.com
	docker-compose ps

client:
	docker-compose up client

down:
	docker-compose down