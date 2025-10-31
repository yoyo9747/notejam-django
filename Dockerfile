FROM python:2.7-slim

# 👉 buster 리포지토리를 archive로 교체 + 유효기간 체크 비활성화
RUN sed -i -e 's|deb.debian.org/debian|archive.debian.org/debian|g' \
           -e 's|security.debian.org/debian-security|archive.debian.org/debian-security|g' \
           /etc/apt/sources.list \
 && printf 'Acquire::Check-Valid-Until "false";\n' > /etc/apt/apt.conf.d/99no-check-valid

# 이제 업데이트/설치가 정상 동작
RUN apt-get -o Acquire::Check-Valid-Until=false update && apt-get install -y --no-install-recommends \
    build-essential \
    graphviz \
    libjpeg-dev zlib1g-dev \
    libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# ✅ django 하위가 아니라 현재 폴더의 requirements.txt 사용
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt \
    && pip install "pylint<2" "pydeps<2" django-extensions==1.6.7

# ✅ 현재 폴더 전체 복사 (manage.py가 들어있는 notejam/ 까지 포함)
COPY . /app

EXPOSE 8000
CMD ["/bin/bash"]
