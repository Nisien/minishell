/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_clean_ms.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nrossa <nrossa@student.42perpignan.fr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/12 21:29:23 by nrossa            #+#    #+#             */
/*   Updated: 2024/01/12 23:05:39 by hnogared         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minishell.h"

void	ft_clean_ms(t_data *data)
{
	ft_free_array(data->env);
	ft_envlst_clear(&data->envlst);
	close(data->std[IN]);
	close(data->std[OUT]);
	rl_clear_history();
}
