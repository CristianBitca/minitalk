/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cbitca <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/03/27 16:57:37 by cbitca            #+#    #+#             */
/*   Updated: 2025/03/27 16:57:38 by cbitca           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/minitalk.h"

void	signal_handler(int sig, siginfo_t *info, void *ucontext)
{
	static volatile sig_atomic_t	i = 8;
	static unsigned char			c = 0;

	if (i-- == 0)
	{
		write(1, &c, 1);
		i = 7;
		c = 0;
	}
	if (sig != SIGUSR2)
		kill(info->si_pid, SIGUSR1);
	else
	{
		c += (1 << i);
		kill(info->si_pid, SIGUSR2);
	}
	return ;
	(void)ucontext;
}

int	main(void)
{
	struct sigaction	action;

	action.sa_sigaction = signal_handler;
	sigemptyset(&action.sa_mask);
	action.sa_flags = SA_SIGINFO;
	sigaddset(&action.sa_mask, SIGUSR1);
	sigaddset(&action.sa_mask, SIGUSR2);
	sigaction(SIGUSR1, &action, NULL);
	sigaction(SIGUSR2, &action, NULL);
	ft_printf("The process ID is %d\n\n", getpid());
	while (1)
		pause();
}
