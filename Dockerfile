FROM golang:latest as build
WORKDIR /go/src/github.com/kylegrantlucas/transmission-exporter
COPY . .
RUN go build -o app ./cmd/transmission-exporter

FROM gcr.io/distroless/base
COPY --from=build /go/src/github.com/kylegrantlucas/transmission-exporter /
EXPOSE 19091
ENTRYPOINT ["/app"]
