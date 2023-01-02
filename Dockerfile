FROM golang:1.19 as builder

WORKDIR /usr/app

COPY . .

RUN go mod init hello_world && \
  go build


FROM scratch
WORKDIR /exec
COPY --from=builder /usr/app/hello_world .
CMD ["/exec/hello_world"]