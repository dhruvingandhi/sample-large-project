# Explore: explore_2236
# Auto-generated LookML Explore File

include: "/views/domain_09/view_06709.view.lkml"
include: "/views/domain_11/view_06711.view.lkml"
include: "/views/domain_12/view_06712.view.lkml"
include: "/views/domain_13/view_06713.view.lkml"

explore: explore_2236 {
  label: "Explore Explore 2236"
  description: "Comprehensive analytics explore joining base view_06709 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_06709
  
  always_filter: {
    filters: [view_06709.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06709.created_at_date: "7 days"]
    unless: [view_06709.id, view_06709.status]
  }

  join: view_06711 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06709.user_id} = ${view_06711.id} ;;
    required_joins: []
  }

  join: view_06712 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06709.account_id} = ${view_06712.account_id} ;;
    required_joins: [view_06711]
  }

  join: view_06713 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06709.category} = ${view_06713.category} ;;
  }

  access_filter: {
    field: view_06709.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06709.is_deleted} = false ;;
}
