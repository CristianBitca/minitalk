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

volatile sig_atomic_t	g_sig_no = 0;

void	signal_handler(int sig)
{
	if (sig == SIGUSR1 || sig == SIGUSR2)
		g_sig_no = sig;
}

int	send_message(int pid, char *s)
{
	const size_t	len = ft_strlen(s);
	int				i;
	int				j;
	int				bit;

	j = -1;
	while (++j <= len)
	{
		i = 8;
		while (i--)
		{
			bit = (s[j] >> i);
			if (bit & 1)
				kill(pid, SIGUSR2);
			else
				kill(pid, SIGUSR1);
			usleep(10000);
		}
	}
	return (0);
}

int	main(int argc, char **argv)
{
	int	res;

	if (argc == 3)
	{
		signal(SIGUSR1, signal_handler);
		signal(SIGUSR2, signal_handler);
		res = send_message(ft_atoi(argv[1]), argv[2]);
		if (res)
			printf("Error");
		else
			printf("Done");
	}
	if (argc == 2)
		printf("You are missing the message.");
	if (argc == 1)
		printf("You need to enter the following data, PID and message.");
	if (argc > 3)
		printf("Too many arguments.");
}
