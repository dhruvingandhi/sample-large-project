# Explore: explore_0977
# Auto-generated LookML Explore File

include: "/views/domain_32/view_02932.view.lkml"
include: "/views/domain_34/view_02934.view.lkml"
include: "/views/domain_35/view_02935.view.lkml"
include: "/views/domain_36/view_02936.view.lkml"

explore: explore_0977 {
  label: "Explore Explore 0977"
  description: "Comprehensive analytics explore joining base view_02932 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_02932
  
  always_filter: {
    filters: [view_02932.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02932.created_at_date: "7 days"]
    unless: [view_02932.id, view_02932.status]
  }

  join: view_02934 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02932.user_id} = ${view_02934.id} ;;
    required_joins: []
  }

  join: view_02935 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02932.account_id} = ${view_02935.account_id} ;;
    required_joins: [view_02934]
  }

  join: view_02936 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02932.category} = ${view_02936.category} ;;
  }

  access_filter: {
    field: view_02932.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02932.is_deleted} = false ;;
}
