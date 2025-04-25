# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbitca <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/06 17:24:40 by cbitca            #+#    #+#              #
#    Updated: 2025/04/06 17:24:41 by cbitca           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC      = gcc
CFLAGS  = -Wall -Wextra -Werror -Iinclude -Ilibft

SRC_DIR = srcs
OBJ_DIR = obj
LIBFT_DIR = libft
INCLUDE_DIR = include

SRCS    = $(wildcard $(SRC_DIR)/*.c)
OBJS    = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

SERVER  = server
CLIENT  = client

all: $(SERVER) $(CLIENT)


$(SERVER): $(OBJ_DIR)/server.o $(LIBFT_DIR)/libft.a
	$(CC) $(CFLAGS) -o $@ $< -L$(LIBFT_DIR) -lft


$(CLIENT): $(OBJ_DIR)/client.o $(LIBFT_DIR)/libft.a
	$(CC) $(CFLAGS) -o $@ $< -L$(LIBFT_DIR) -lft


$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@


$(LIBFT_DIR)/libft.a:
	$(MAKE) -C $(LIBFT_DIR)


clean:
	rm -rf $(OBJ_DIR)
	$(MAKE) -C $(LIBFT_DIR) clean


fclean: clean
	rm -f $(SERVER) $(CLIENT)
	$(MAKE) -C $(LIBFT_DIR) fclean


re: fclean all


.PHONY: all clean fclean re
