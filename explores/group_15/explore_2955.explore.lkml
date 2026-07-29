# Explore: explore_2955
# Auto-generated LookML Explore File

include: "/views/domain_16/view_08866.view.lkml"
include: "/views/domain_18/view_08868.view.lkml"
include: "/views/domain_19/view_08869.view.lkml"
include: "/views/domain_20/view_08870.view.lkml"

explore: explore_2955 {
  label: "Explore Explore 2955"
  description: "Comprehensive analytics explore joining base view_08866 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08866
  
  always_filter: {
    filters: [view_08866.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08866.created_at_date: "7 days"]
    unless: [view_08866.id, view_08866.status]
  }

  join: view_08868 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08866.user_id} = ${view_08868.id} ;;
    required_joins: []
  }

  join: view_08869 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08866.account_id} = ${view_08869.account_id} ;;
    required_joins: [view_08868]
  }

  join: view_08870 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08866.category} = ${view_08870.category} ;;
  }

  access_filter: {
    field: view_08866.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08866.is_deleted} = false ;;
}
