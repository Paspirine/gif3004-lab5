#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <netdb.h> 
#include <netinet/in.h> 
#include <sys/socket.h> 
#include <sys/types.h> 
#include <unistd.h>
#include <arpa/inet.h>
#include <fcntl.h>
#define PORT 3004


int listenAndAccept(int socketFd){
    int connectionFd, cliLen;
    struct sockaddr_in clientAddress;

    if ((listen(socketFd, 5)) < 0) { 
        printf("Listen failed.\n"); 
        exit(0); 
    } 
    else printf("Server listening...\n"); 

    cliLen = sizeof(clientAddress);
    connectionFd = accept(socketFd, (struct sockaddr*) &clientAddress, &cliLen);

    if(connectionFd < 0){
        printf("Failed to accept.\n");
        exit(0);
    }
    printf("Connection Established! \n", connectionFd);
    fcntl(connectionFd, F_SETFL, O_NONBLOCK);
    return connectionFd;
}


int main(){
    int socketFd;
    struct sockaddr_in serverAddress;
    int connectionFd;
    char buff[64];
    FILE *setrKeypadFd;

    // Open the character device we created in TP4
    setrKeypadFd = fopen("/dev/claviersetr", "w");
    if(setrKeypadFd == NULL){
        printf("Could't open device.\n");
        exit(0);
    }
    
    // Create Socket
    socketFd = socket(AF_INET, SOCK_STREAM, 0);
    
    
    setsockopt(socketFd, SOL_SOCKET, SO_REUSEADDR, &(int){1}, sizeof(int));
    if(socketFd < 0){
        printf("Failed to create socket.\n");
        exit(0);
    }

    // Init TCP Socket
    bzero(&serverAddress, sizeof(serverAddress));
    serverAddress.sin_family = AF_INET;
    serverAddress.sin_addr.s_addr = htonl(INADDR_ANY);
    serverAddress.sin_port = htons(PORT); 

    // Bind
    if(bind(socketFd, (struct sockaddr*) &serverAddress, sizeof(serverAddress)) < 0){
        printf("Failed to bind.\n");
        exit(0);
    }

    while(1){
    connectionFd = listenAndAccept(socketFd);
    sleep(1);

        while(1){
            sleep(0.4); // Cant barely see the latency and improves performances
            bzero(buff, 64); 
            // If client closed, go back to listening.

            if(read(connectionFd, buff, sizeof(buff)) == 0){
                printf("Connection closed, going back to listening...\n");
                break;
            }

            if(strcmp(buff, "")){
               fputs(buff, setrKeypadFd);
               // ptit hack pour refresh le fichier, vraiment mauvais jimagime
               fclose(setrKeypadFd);
               setrKeypadFd = fopen("/dev/claviersetr", "a");
               printf("Data: %s", buff);
            }
        }
    }


    // Useless
    fclose(setrKeypadFd);
    close(socketFd);
    return 0;
}
