cmake_minimum_required(VERSION 3.0.0)
project(SETR_TP5_SERVEUR)

add_executable(tp5serveurPC tp5serveur.c)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
