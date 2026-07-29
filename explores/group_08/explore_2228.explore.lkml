# Explore: explore_2228
# Auto-generated LookML Explore File

include: "/views/domain_35/view_06685.view.lkml"
include: "/views/domain_37/view_06687.view.lkml"
include: "/views/domain_38/view_06688.view.lkml"
include: "/views/domain_39/view_06689.view.lkml"

explore: explore_2228 {
  label: "Explore Explore 2228"
  description: "Comprehensive analytics explore joining base view_06685 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_06685
  
  always_filter: {
    filters: [view_06685.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06685.created_at_date: "7 days"]
    unless: [view_06685.id, view_06685.status]
  }

  join: view_06687 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06685.user_id} = ${view_06687.id} ;;
    required_joins: []
  }

  join: view_06688 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06685.account_id} = ${view_06688.account_id} ;;
    required_joins: [view_06687]
  }

  join: view_06689 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06685.category} = ${view_06689.category} ;;
  }

  access_filter: {
    field: view_06685.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06685.is_deleted} = false ;;
}
