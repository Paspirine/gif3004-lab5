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
#define MAX 15


int connectToServer(struct sockaddr_in serverAddress){
    int connectionFd = -1;
    int socketFd;

    // Create Socket and reuse it if possible
    socketFd = socket(AF_INET, SOCK_STREAM, 0);
    setsockopt(socketFd, SOL_SOCKET, SO_REUSEADDR, &(int){1}, sizeof(int));
    fcntl(socketFd, F_SETFL, O_NONBLOCK);
    if(socketFd < 0) printf("Failed to create socket.\n");

    printf("Waiting for server...\n");
    while(connectionFd < 0){
        connectionFd = connect(socketFd, (struct sockaddr*) &serverAddress, sizeof(serverAddress));
        sleep(1);
    }
    printf("Connection Established!\n");
    return socketFd;
}


int main(int argc, char**argv){
    (void)argc;
    struct sockaddr_in serverAddress;
    char buff[MAX];
    int socketFd;
    FILE *setrKeypadFd;

    // Open the character device we created in TP4
    setrKeypadFd = fopen("/dev/claviersetr", "r");
    if(setrKeypadFd == NULL){
        printf("Could't open device.\n");
        exit(0);
    }

    // Init TCP Socket
    bzero(&serverAddress, sizeof(serverAddress));
    serverAddress.sin_family = AF_INET;
    serverAddress.sin_addr.s_addr = inet_addr(argv[1]); 
    serverAddress.sin_port = htons(PORT); 

    // Connect to PC Server
    while(1){
    socketFd = connectToServer(serverAddress);
    sleep(1);
        while(1){
            sleep(0.4); // Cant barely see the latency and improves performances
            bzero(buff, MAX); 
            
            //ptit hack pour refresh le fichier, vraiment mauvais jimagime
            setrKeypadFd = fopen("/dev/claviersetr", "r");
            fgets(buff, MAX, setrKeypadFd);
            fclose(setrKeypadFd);
            //printf("Buff: %s \n", buff);
            if(strcmp(buff, "")){
               printf("Clavier SETR: %s \n", buff);
               write(socketFd, buff, sizeof(buff));
            }

            // If socket closed.
            if(read(socketFd, buff, sizeof(buff)) == 0){
                printf("Connection Lost.\n");
                break;
            }
        }
    }
    
    fclose(setrKeypadFd);
    close(socketFd);
    return 0;
}
