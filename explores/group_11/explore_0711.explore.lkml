# Explore: explore_0711
# Auto-generated LookML Explore File

include: "/views/domain_34/view_02134.view.lkml"
include: "/views/domain_36/view_02136.view.lkml"
include: "/views/domain_37/view_02137.view.lkml"
include: "/views/domain_38/view_02138.view.lkml"

explore: explore_0711 {
  label: "Explore Explore 0711"
  description: "Comprehensive analytics explore joining base view_02134 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02134
  
  always_filter: {
    filters: [view_02134.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02134.created_at_date: "7 days"]
    unless: [view_02134.id, view_02134.status]
  }

  join: view_02136 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02134.user_id} = ${view_02136.id} ;;
    required_joins: []
  }

  join: view_02137 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02134.account_id} = ${view_02137.account_id} ;;
    required_joins: [view_02136]
  }

  join: view_02138 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02134.category} = ${view_02138.category} ;;
  }

  access_filter: {
    field: view_02134.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02134.is_deleted} = false ;;
}
