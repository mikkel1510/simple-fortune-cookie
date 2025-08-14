FROM golang:1.22-alpine AS build
WORKDIR /app
COPY backend/go.mod ./
RUN go mod download
COPY backend/ .
RUN go build -o server .

FROM alpine:latest
WORKDIR /app
COPY --from=build /app/server .
CMD ["./server"]
