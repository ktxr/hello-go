FROM golang:alpine AS builder

WORKDIR /app
COPY . .
ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64
RUN go mod tidy && go build -o /main main.go

FROM scratch
COPY --from=builder /main /main
CMD ["/main"]
