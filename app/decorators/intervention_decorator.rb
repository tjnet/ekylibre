class InterventionDecorator < Draper::Decorator
  delegate_all

  def sum_targets_net_surface_area
    object
      .targets
      .map{ |intervention_target| intervention_target.product.net_surface_area.to_d }
      .sum
  end

  def many_targets?
    object.targets.count > 1
  end

  def inputs_cost
    parameter_cost(object.inputs)
  end

  def human_inputs_cost
    human_parameter_cost(inputs_cost)
  end

  def doers_cost
    parameter_cost(object.doers)
  end

  def human_doers_cost
    human_parameter_cost(doers_cost)
  end

  def tools_cost
    parameter_cost(object.tools)
  end

  def human_tools_cost
    human_parameter_cost(tools_cost)
  end

  def human_receptions_cost
    object
      .receptions_cost
      .to_f
      .round(2)
  end

  private

  def parameter_cost(parameters)
    parameters
      .map(&:cost)
      .compact
      .sum
  end

  def human_parameter_cost(cost)
    cost
      .to_f
      .round(2)
  end
end
