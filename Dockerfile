# Odoo 19 — production-oriented image from this source tree (no dev mode).
FROM python:3.12-slim-bookworm

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    ODOO_DEV=

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    fonts-dejavu-core \
    fonts-font-awesome \
    fonts-inconsolata \
    fonts-noto-core \
    libffi-dev \
    libjpeg62-turbo-dev \
    libldap2-dev \
    libpq-dev \
    libsasl2-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/odoo

COPY requirements.txt MANIFEST.in setup.py LICENSE ./
COPY odoo/ odoo/
COPY setup/ setup/
RUN pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir -e .

# Custom addons (same layout as host ./modules); Compose also bind-mounts ./modules → /mnt/extra-addons.
COPY modules/ /opt/odoo/custom-addons/

RUN useradd --create-home --system --shell /bin/bash odoo \
    && mkdir -p /var/lib/odoo \
    && chown -R odoo:odoo /opt/odoo /var/lib/odoo

USER odoo
EXPOSE 8069 8072
CMD ["odoo", "--data-dir=/var/lib/odoo", "--addons-path=/opt/odoo/odoo/addons,/opt/odoo/custom-addons", "--without-demo=all"]
