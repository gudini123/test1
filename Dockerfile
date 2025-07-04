FROM golang:1.22 AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o app
FROM gcr.io/distroless/static:nonroot
COPY --from=builder /app/app /
ENV PASSWORD_TEST_1="my_secter_password"
ENTRYPOINT ["/app"]
