FROM golang:1.16.0-alpine AS builder

WORKDIR /go/src/app

COPY . .

RUN go build main.go

FROM scratch

WORKDIR /home

COPY --from=builder /go/src/app/main .

CMD [ "./main" ]