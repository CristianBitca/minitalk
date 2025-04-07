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

NAME_SERVER  = server
NAME_CLIENT  = client
CC           = cc
CFLAGS       = -Wall -Wextra -Werror -I./ -I./libft/include
LIBFT_DIR    = ./libft
LIBFT_A      = $(LIBFT_DIR)/libft.a


SRCS_SERVER  = server.c
SRCS_CLIENT  = client.c


OBJS_SERVER  = $(SRCS_SERVER:.c=.o)
OBJS_CLIENT  = $(SRCS_CLIENT:.c=.o)


all: $(LIBFT_A) $(NAME_SERVER) $(NAME_CLIENT)


$(LIBFT_A):
	$(MAKE) -C $(LIBFT_DIR)


$(NAME_SERVER): $(OBJS_SERVER)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBFT_A)


$(NAME_CLIENT): $(OBJS_CLIENT)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBFT_A)


clean:
	$(MAKE) -C $(LIBFT_DIR) clean
	rm -f $(OBJS_SERVER) $(OBJS_CLIENT)


fclean: clean
	$(MAKE) -C $(LIBFT_DIR) fclean
	rm -f $(NAME_SERVER) $(NAME_CLIENT)


re: fclean all


.PHONY: all clean fclean re
