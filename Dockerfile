FROM goland as builder
WORKDIR /src
COPY src .
RUN CGO_ENEBLED=0 go build

FROM scratch
ADD ./html /html
COPY --from=builder /src/app .
ENTRYPOINT ["/app"]
EXPOSE 8080
