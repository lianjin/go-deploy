# Use the official Go image with version 1.23
FROM golang:1.23

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files
COPY go.mod go.sum ./

# Download the dependencies
RUN go mod tidy

# Copy the rest of the application code
COPY . .

# Build the Go application
RUN go build -ldflags="-s -w" -o main .

RUN chmod +x main

EXPOSE 8080

# Command to run the application
CMD ["./main"]

