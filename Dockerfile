FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Pinned versions for reproducibility
# renovate: datasource=github-releases depName=kubernetes/kubernetes extractVersion=^v(?<version>.+)$
ENV KUBECTL_VERSION=1.35.3
# renovate: datasource=github-releases depName=helm/helm extractVersion=^v(?<version>.+)$
ENV HELM_VERSION=4.3.0
# renovate: datasource=github-releases depName=opentofu/opentofu extractVersion=^v(?<version>.+)$
ENV OPENTOFU_VERSION=1.11.5
# renovate: datasource=github-releases depName=derailed/k9s extractVersion=^v(?<version>.+)$
ENV K9S_VERSION=0.50.18
# renovate: datasource=github-releases depName=stern/stern extractVersion=^v(?<version>.+)$
ENV STERN_VERSION=1.33.1
# renovate: datasource=github-releases depName=getsops/sops extractVersion=^v(?<version>.+)$
ENV SOPS_VERSION=3.12.2
# renovate: datasource=github-releases depName=FiloSottile/age extractVersion=^v(?<version>.+)$
ENV AGE_VERSION=1.3.1
# renovate: datasource=github-releases depName=orhun/git-cliff extractVersion=^v(?<version>.+)$
ENV GITCLIFF_VERSION=2.12.0

# Base dependencies — single layer to minimise image size
RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        unzip \
        git \
        jq \
        less \
        vim \
        bash-completion \
        groff \
        openssh-client \
    && rm -rf /var/lib/apt/lists/*

# kubectl
RUN curl -fsSL "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" -o /tmp/kubectl \
    && CHECKSUM=$(curl -fsSL "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl.sha256") \
    && echo "${CHECKSUM}  /tmp/kubectl" | sha256sum -c \
    && install -m 0755 /tmp/kubectl /usr/local/bin/kubectl \
    && rm /tmp/kubectl

# Helm
RUN curl -fsSL "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" -o /tmp/helm.tar.gz \
    && CHECKSUM=$(curl -fsSL "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz.sha256sum" | awk '{print $1}') \
    && echo "${CHECKSUM}  /tmp/helm.tar.gz" | sha256sum -c \
    && tar -xz -C /usr/local/bin --strip-components=1 linux-amd64/helm -f /tmp/helm.tar.gz \
    && chmod 0755 /usr/local/bin/helm \
    && rm /tmp/helm.tar.gz

# OpenTofu
RUN curl -fsSL "https://github.com/opentofu/opentofu/releases/download/v${OPENTOFU_VERSION}/tofu_${OPENTOFU_VERSION}_linux_amd64.zip" -o /tmp/tofu.zip \
    && CHECKSUM=$(curl -fsSL "https://github.com/opentofu/opentofu/releases/download/v${OPENTOFU_VERSION}/tofu_${OPENTOFU_VERSION}_SHA256SUMS" \
        | grep "tofu_${OPENTOFU_VERSION}_linux_amd64.zip" | awk '{print $1}') \
    && echo "${CHECKSUM}  /tmp/tofu.zip" | sha256sum -c \
    && unzip -q /tmp/tofu.zip -d /usr/local/bin tofu \
    && chmod 0755 /usr/local/bin/tofu \
    && rm /tmp/tofu.zip

# k9s
RUN curl -fsSL "https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/k9s_Linux_amd64.tar.gz" -o /tmp/k9s.tar.gz \
    && CHECKSUM=$(curl -fsSL "https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/checksums.sha256" \
        | grep "k9s_Linux_amd64.tar.gz$" | awk '{print $1}') \
    && echo "${CHECKSUM}  /tmp/k9s.tar.gz" | sha256sum -c \
    && tar -xz -C /usr/local/bin k9s -f /tmp/k9s.tar.gz \
    && chmod 0755 /usr/local/bin/k9s \
    && rm /tmp/k9s.tar.gz

# stern
RUN curl -fsSL "https://github.com/stern/stern/releases/download/v${STERN_VERSION}/stern_${STERN_VERSION}_linux_amd64.tar.gz" -o /tmp/stern.tar.gz \
    && CHECKSUM=$(curl -fsSL "https://github.com/stern/stern/releases/download/v${STERN_VERSION}/checksums.txt" \
        | grep "stern_${STERN_VERSION}_linux_amd64.tar.gz" | awk '{print $1}') \
    && echo "${CHECKSUM}  /tmp/stern.tar.gz" | sha256sum -c \
    && tar -xz -C /usr/local/bin stern -f /tmp/stern.tar.gz \
    && chmod 0755 /usr/local/bin/stern \
    && rm /tmp/stern.tar.gz

# sops
RUN curl -fsSL "https://github.com/getsops/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64" -o /tmp/sops \
    && CHECKSUM=$(curl -fsSL "https://github.com/getsops/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.checksums.txt" \
        | grep "sops-v${SOPS_VERSION}.linux.amd64$" | awk '{print $1}') \
    && echo "${CHECKSUM}  /tmp/sops" | sha256sum -c \
    && install -m 0755 /tmp/sops /usr/local/bin/sops \
    && rm /tmp/sops


# age — no SHA checksum published; .proof files are a custom transparency log format
# incompatible with cosign. Download integrity relies on TLS only.
RUN curl -fsSL "https://github.com/FiloSottile/age/releases/download/v${AGE_VERSION}/age-v${AGE_VERSION}-linux-amd64.tar.gz" -o /tmp/age.tar.gz \
    && tar -xz -C /usr/local/bin --strip-components=1 age/age age/age-keygen -f /tmp/age.tar.gz \
    && chmod 0755 /usr/local/bin/age /usr/local/bin/age-keygen \
    && rm /tmp/age.tar.gz

# git-cliff — .deb has no checksum; use the tarball which ships a .sha512
RUN curl -fsSL "https://github.com/orhun/git-cliff/releases/download/v${GITCLIFF_VERSION}/git-cliff-${GITCLIFF_VERSION}-x86_64-unknown-linux-gnu.tar.gz" -o /tmp/git-cliff.tar.gz \
    && CHECKSUM=$(curl -fsSL "https://github.com/orhun/git-cliff/releases/download/v${GITCLIFF_VERSION}/git-cliff-${GITCLIFF_VERSION}-x86_64-unknown-linux-gnu.tar.gz.sha512" \
        | awk '{print $1}') \
    && echo "${CHECKSUM}  /tmp/git-cliff.tar.gz" | sha512sum -c \
    && tar -xz -C /usr/local/bin --strip-components=1 --wildcards "*/git-cliff" -f /tmp/git-cliff.tar.gz \
    && chmod 0755 /usr/local/bin/git-cliff \
    && rm /tmp/git-cliff.tar.gz

# Non-root user — avoids running as root inside the container
RUN useradd -m -s /bin/bash tooling

# Mark ~/workspace as a safe git directory so git doesn't refuse to run there
RUN git config --system safe.directory /home/tooling/workspace

USER tooling
WORKDIR /home/tooling/workspace

# Shell quality-of-life: completions + aliases
COPY --chown=tooling:tooling .bashrc /home/tooling/.bashrc

CMD ["/bin/bash", "--login"]
