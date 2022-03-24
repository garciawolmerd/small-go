# BUILD STAGE

FROM golang:1.18.0-alpine3.15 as builder

WORKDIR /usr/src/app

COPY . .

RUN go build -v -o printer .

# RUN STAGE

FROM scratch

COPY --from=builder /usr/src/app/printer .

CMD ["./printer"]
