/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cbitca <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/27 16:57:25 by cbitca            #+#    #+#             */
/*   Updated: 2025/03/27 16:57:28 by cbitca           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

int	main(int argc, char **argv)
{
	if (argc == 3)
		kill(*argv[1], SIGKILL);
	if (argc == 2)
		printf("You are missing the message.");
	if (argc == 1)
		printf("You need to enter the following data, PID and message.");
	if (argc > 3)
		printf("Too many arguments.");
}