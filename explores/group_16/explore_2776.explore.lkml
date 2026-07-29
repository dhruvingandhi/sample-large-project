# Explore: explore_2776
# Auto-generated LookML Explore File

include: "/views/domain_29/view_08329.view.lkml"
include: "/views/domain_31/view_08331.view.lkml"
include: "/views/domain_32/view_08332.view.lkml"
include: "/views/domain_33/view_08333.view.lkml"

explore: explore_2776 {
  label: "Explore Explore 2776"
  description: "Comprehensive analytics explore joining base view_08329 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_08329
  
  always_filter: {
    filters: [view_08329.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08329.created_at_date: "7 days"]
    unless: [view_08329.id, view_08329.status]
  }

  join: view_08331 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08329.user_id} = ${view_08331.id} ;;
    required_joins: []
  }

  join: view_08332 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08329.account_id} = ${view_08332.account_id} ;;
    required_joins: [view_08331]
  }

  join: view_08333 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08329.category} = ${view_08333.category} ;;
  }

  access_filter: {
    field: view_08329.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08329.is_deleted} = false ;;
}
