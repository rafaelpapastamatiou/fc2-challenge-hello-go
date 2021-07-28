FROM golang as builder
WORKDIR /usr/src/app

COPY hello.go /usr/src/app/
RUN go build hello.go

FROM scratch
COPY --from=builder /usr/src/app/hello /

CMD [ "/hello" ]