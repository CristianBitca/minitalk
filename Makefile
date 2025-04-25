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


SERVER_SRC = $(SRC_DIR)/server.c
CLIENT_SRC = $(SRC_DIR)/client.c


SERVER_OBJ = $(OBJ_DIR)/server.o
CLIENT_OBJ = $(OBJ_DIR)/client.o


SERVER  = server
CLIENT  = client


all: $(SERVER) $(CLIENT)


$(SERVER): $(SERVER_OBJ) $(LIBFT_DIR)/libft.a
	$(CC) $(CFLAGS) -o $@ $< -L$(LIBFT_DIR) -lft


$(CLIENT): $(CLIENT_OBJ) $(LIBFT_DIR)/libft.a
	$(CC) $(CFLAGS) -o $@ $< -L$(LIBFT_DIR) -lft


$(SERVER_OBJ): $(SERVER_SRC)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@


$(CLIENT_OBJ): $(CLIENT_SRC)
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