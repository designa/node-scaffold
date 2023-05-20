# Node Scaffold

This repository provides a scaffold for creating a new Node.js API project with TypeScript, along with Docker-related files for containerization.

## Getting Started

To use this scaffold, follow the steps below:

### Prerequisites

- Node.js (https://nodejs.org)
- Yarn package manager (https://yarnpkg.com)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/designa/node-scaffold.git
```
2. Navigate to the project directory:
```bash
cd node-scaffold
```

3. Run the install.sh script to install the designa-create command:

```bash
./install.sh
```

This script will move the designa-create.sh script to /usr/local/bin, set the execution permissions, and install it as the designa-create command.

4. Create a new project:

```bash
designa-create <nome_do_projeto>
```

5. Install project dependencies:

```bash
cd <nome_do_projeto>
yarn install
```

6. Start the development server:

```bash
yarn dev
```

### Docker

If you prefer to run the application using Docker, make sure you have Docker and Docker Compose installed on your system.

Build and run the Docker containers:

```bash
docker-compose up --build
```

This command will build the Docker image and start the containers for the Node.js application and PostgreSQL database.

Access the application in your browser at http://localhost:3000.

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue or submit a pull request.

## License

MIT License

Please note that this complete README includes instructions on how to download the repository, use the `designa-create.sh` script to initialize a new project, install dependencies, start the development server, and use Docker for containerization. It also includes sections for contributing and license information.

Feel free to customize the README further with additional information or specific details about your project as needed.