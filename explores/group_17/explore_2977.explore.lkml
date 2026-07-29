# Explore: explore_2977
# Auto-generated LookML Explore File

include: "/views/domain_32/view_08932.view.lkml"
include: "/views/domain_34/view_08934.view.lkml"
include: "/views/domain_35/view_08935.view.lkml"
include: "/views/domain_36/view_08936.view.lkml"

explore: explore_2977 {
  label: "Explore Explore 2977"
  description: "Comprehensive analytics explore joining base view_08932 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_08932
  
  always_filter: {
    filters: [view_08932.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08932.created_at_date: "7 days"]
    unless: [view_08932.id, view_08932.status]
  }

  join: view_08934 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08932.user_id} = ${view_08934.id} ;;
    required_joins: []
  }

  join: view_08935 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08932.account_id} = ${view_08935.account_id} ;;
    required_joins: [view_08934]
  }

  join: view_08936 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08932.category} = ${view_08936.category} ;;
  }

  access_filter: {
    field: view_08932.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08932.is_deleted} = false ;;
}
