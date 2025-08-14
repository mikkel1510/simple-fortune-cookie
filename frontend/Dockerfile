FROM golang:1.22-alpine AS build
WORKDIR /app
COPY frontend/go.mod ./
RUN go mod download
COPY frontend/ .
RUN go build -o web .

FROM alpine:latest
WORKDIR /app
COPY --from=build /app/web .
COPY --from=build /app/static ./static
COPY --from=build /app/templates ./templates
CMD ["./web"]
