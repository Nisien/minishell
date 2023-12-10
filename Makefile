# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nrossa <nrossa@student.42perpignan.fr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/17 03:47:11 by nrossa            #+#    #+#              #
#    Updated: 2023/12/10 21:13:23 by nrossa           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: clean fclean norme compilation noflags

NAME = minishell
LIBFT_DIR = ./libft/
LIBFT = $(LIBFT_DIR)libft.a

CC = gcc
CFLAGS = -Wall -Wextra -Werror
RM = /bin/rm -f

HDR = minishell.h builtins/builtins.h

SRC = minishell.c
OBJS = $(SRC:.c=.o)

BLACK = \033[30m
RED = \033[31m
GREEN = \033[32m
YELLOW = \033[33m
BLUE = \033[34m
WHITE = \033[37m
NC = \033[0m

.c.o:
	@$(CC) $(CFLAGS) -c $< -o $(<:.c=.o)

$(NAME): $(LIBFT) $(OBJS)
	@echo "$(RED)Compilation in progress...$(NC)"
	@$(CC) $(CFLAGS) -o $(NAME) $(OBJS) $(LIBFT) -lreadline
	@echo "$(GREEN)Compilation complete !$(NC)"

all: $(NAME)

$(LIBFT):
	@echo "$(YELLOW)Creating libft...$(NC)"
	@make -s -C $(LIBFT_DIR) all

clean:
	@echo "$(YELLOW)Cleaning object files...$(NC)"
	@make -s -C $(LIBFT_DIR) clean
	@$(RM) $(OBJS)
	@echo "$(GREEN)Cleaning complete !$(NC)"

fclean: clean
	@echo "$(YELLOW)Cleaning...$(NC)"
	@make -s -C $(LIBFT_DIR) fclean
	@$(RM) $(NAME)
	@echo "$(GREEN)Cleaning complete !$(NC)"

re: fclean all

norme:
	@echo "$(YELLOW)Checking Norme...$(NC)"
	@norminette $(SRC) $(HDR)
	@echo "$(GREEN)Checking complete !$(NC)"

compilation: $(LIBFT)
	$(CC) $(CFLAGS) -g -o $(NAME) $(SRC) $(LIBFT) -lreadline

noflags: $(LIBFT)
	$(CC) -g -o $(NAME) $(SRC) $(LIBFT) -lreadline
