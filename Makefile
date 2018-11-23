PHONY: pki

pki/ca.pem:
	cd pki && \
	cfssl gencert -initca ca-csr.json | cfssljson -bare ca -

star: pki/star.pem

pki/star.pem: pki/ca.pem
	cd pki && \
    cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=server star.json | cfssljson -bare star