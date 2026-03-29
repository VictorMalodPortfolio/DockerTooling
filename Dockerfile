FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Pinned versions for reproducibility
# renovate: datasource=github-releases depName=kubernetes/kubernetes extractVersion=^v(?<version>.+)$
ENV KUBECTL_VERSION=1.28.3
# renovate: datasource=github-releases depName=helm/helm extractVersion=^v(?<version>.+)$
ENV HELM_VERSION=3.13.1
# renovate: datasource=github-releases depName=opentofu/opentofu extractVersion=^v(?<version>.+)$
ENV OPENTOFU_VERSION=1.7.3
# renovate: datasource=github-releases depName=derailed/k9s extractVersion=^v(?<version>.+)$
ENV K9S_VERSION=0.28.2
# renovate: datasource=github-releases depName=stern/stern extractVersion=^v(?<version>.+)$
ENV STERN_VERSION=1.26.0
# renovate: datasource=github-releases depName=getsops/sops extractVersion=^v(?<version>.+)$
ENV SOPS_VERSION=3.8.1
# renovate: datasource=github-releases depName=FiloSottile/age extractVersion=^v(?<version>.+)$
ENV AGE_VERSION=1.1.1
# renovate: datasource=github-releases depName=orhun/git-cliff extractVersion=^v(?<version>.+)$
ENV GITCLIFF_VERSION=2.4.0

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
RUN curl -fsSL "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl \
    && chmod 0755 /usr/local/bin/kubectl

# Helm
RUN curl -fsSL "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" \
        | tar -xz -C /usr/local/bin --strip-components=1 linux-amd64/helm \
    && chmod 0755 /usr/local/bin/helm

# OpenTofu
RUN curl -fsSL "https://github.com/opentofu/opentofu/releases/download/v${OPENTOFU_VERSION}/tofu_${OPENTOFU_VERSION}_linux_amd64.zip" -o /tmp/tofu.zip \
    && unzip -q /tmp/tofu.zip -d /usr/local/bin tofu \
    && chmod 0755 /usr/local/bin/tofu \
    && rm /tmp/tofu.zip

# k9s
RUN curl -fsSL "https://github.com/derailed/k9s/releases/download/v${K9S_VERSION}/k9s_Linux_amd64.tar.gz" \
        | tar -xz -C /usr/local/bin k9s \
    && chmod 0755 /usr/local/bin/k9s

# stern
RUN curl -fsSL "https://github.com/stern/stern/releases/download/v${STERN_VERSION}/stern_${STERN_VERSION}_linux_amd64.tar.gz" \
        | tar -xz -C /usr/local/bin stern \
    && chmod 0755 /usr/local/bin/stern

# sops
RUN curl -fsSL "https://github.com/getsops/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64" \
        -o /usr/local/bin/sops \
    && chmod 0755 /usr/local/bin/sops

# age
RUN curl -fsSL "https://github.com/FiloSottile/age/releases/download/v${AGE_VERSION}/age-v${AGE_VERSION}-linux-amd64.tar.gz" \
        | tar -xz -C /usr/local/bin --strip-components=1 age/age age/age-keygen \
    && chmod 0755 /usr/local/bin/age /usr/local/bin/age-keygen

# git-cliff
RUN curl -fsSL "https://github.com/orhun/git-cliff/releases/download/v${GITCLIFF_VERSION}/git-cliff-${GITCLIFF_VERSION}.deb" \
        -o /tmp/git-cliff.deb \
    && dpkg -i /tmp/git-cliff.deb \
    && rm /tmp/git-cliff.deb

# Non-root user — avoids running as root inside the container
RUN useradd -m -s /bin/bash tooling

USER tooling
WORKDIR /home/tooling

# Shell quality-of-life: completions + aliases
COPY --chown=tooling:tooling .bashrc /home/tooling/.bashrc

CMD ["/bin/bash", "--login"]
