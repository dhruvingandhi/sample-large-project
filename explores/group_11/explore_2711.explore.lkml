# Explore: explore_2711
# Auto-generated LookML Explore File

include: "/views/domain_34/view_08134.view.lkml"
include: "/views/domain_36/view_08136.view.lkml"
include: "/views/domain_37/view_08137.view.lkml"
include: "/views/domain_38/view_08138.view.lkml"

explore: explore_2711 {
  label: "Explore Explore 2711"
  description: "Comprehensive analytics explore joining base view_08134 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_08134
  
  always_filter: {
    filters: [view_08134.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08134.created_at_date: "7 days"]
    unless: [view_08134.id, view_08134.status]
  }

  join: view_08136 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08134.user_id} = ${view_08136.id} ;;
    required_joins: []
  }

  join: view_08137 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08134.account_id} = ${view_08137.account_id} ;;
    required_joins: [view_08136]
  }

  join: view_08138 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08134.category} = ${view_08138.category} ;;
  }

  access_filter: {
    field: view_08134.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08134.is_deleted} = false ;;
}
