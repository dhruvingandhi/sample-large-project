# Explore: explore_0205
# Auto-generated LookML Explore File

include: "/views/domain_16/view_00616.view.lkml"
include: "/views/domain_18/view_00618.view.lkml"
include: "/views/domain_19/view_00619.view.lkml"
include: "/views/domain_20/view_00620.view.lkml"

explore: explore_0205 {
  label: "Explore Explore 0205"
  description: "Comprehensive analytics explore joining base view_00616 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00616
  
  always_filter: {
    filters: [view_00616.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00616.created_at_date: "7 days"]
    unless: [view_00616.id, view_00616.status]
  }

  join: view_00618 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00616.user_id} = ${view_00618.id} ;;
    required_joins: []
  }

  join: view_00619 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00616.account_id} = ${view_00619.account_id} ;;
    required_joins: [view_00618]
  }

  join: view_00620 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00616.category} = ${view_00620.category} ;;
  }

  access_filter: {
    field: view_00616.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00616.is_deleted} = false ;;
}
