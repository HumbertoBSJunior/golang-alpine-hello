FROM golang:1.11-alpine3.7 AS builder

WORKDIR /app
COPY main.go .
ARG CGO_ENABLED=0
RUN go build -o main .

FROM scratch

WORKDIR /app
COPY --from=builder /app .

ENTRYPOINT ["./main"]
