FROM golang:1.19 as build 
WORKDIR /app
COPY ./werbserver .
RUN go mod init com.github.gabrielmonzato20.gitops
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server

FROM scratch 
WORKDIR /app
COPY --from=build /app/server .
ENTRYPOINT ["./server"]
