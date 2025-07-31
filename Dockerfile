FROM golang:alpine AS builder

WORKDIR /app

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

RUN go build -o usque -ldflags="-s -w" .

# scratch won't be enough, because we need a cert store
FROM alpine:latest

WORKDIR /app

ENV SOCKS5_ADDR=0.0.0.0
ENV SOCKS5_PORT=1080
ENV SOCK5_USER=admin
ENV SOCK5_PASS=admin

COPY --from=builder /app/usque /bin/usque

CMD /bin/usque socks -b $SOCKS5_ADDR -p $SOCKS5_PORT -u $SOCK5_USER -w $SOCK5_PASS