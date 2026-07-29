# Explore: explore_3161
# Auto-generated LookML Explore File

include: "/views/domain_34/view_09484.view.lkml"
include: "/views/domain_36/view_09486.view.lkml"
include: "/views/domain_37/view_09487.view.lkml"
include: "/views/domain_38/view_09488.view.lkml"

explore: explore_3161 {
  label: "Explore Explore 3161"
  description: "Comprehensive analytics explore joining base view_09484 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09484
  
  always_filter: {
    filters: [view_09484.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09484.created_at_date: "7 days"]
    unless: [view_09484.id, view_09484.status]
  }

  join: view_09486 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09484.user_id} = ${view_09486.id} ;;
    required_joins: []
  }

  join: view_09487 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09484.account_id} = ${view_09487.account_id} ;;
    required_joins: [view_09486]
  }

  join: view_09488 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09484.category} = ${view_09488.category} ;;
  }

  access_filter: {
    field: view_09484.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09484.is_deleted} = false ;;
}
