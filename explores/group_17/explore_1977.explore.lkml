# Explore: explore_1977
# Auto-generated LookML Explore File

include: "/views/domain_32/view_05932.view.lkml"
include: "/views/domain_34/view_05934.view.lkml"
include: "/views/domain_35/view_05935.view.lkml"
include: "/views/domain_36/view_05936.view.lkml"

explore: explore_1977 {
  label: "Explore Explore 1977"
  description: "Comprehensive analytics explore joining base view_05932 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_05932
  
  always_filter: {
    filters: [view_05932.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05932.created_at_date: "7 days"]
    unless: [view_05932.id, view_05932.status]
  }

  join: view_05934 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05932.user_id} = ${view_05934.id} ;;
    required_joins: []
  }

  join: view_05935 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05932.account_id} = ${view_05935.account_id} ;;
    required_joins: [view_05934]
  }

  join: view_05936 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05932.category} = ${view_05936.category} ;;
  }

  access_filter: {
    field: view_05932.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05932.is_deleted} = false ;;
}
