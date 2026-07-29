# Explore: explore_2208
# Auto-generated LookML Explore File

include: "/views/domain_25/view_06625.view.lkml"
include: "/views/domain_27/view_06627.view.lkml"
include: "/views/domain_28/view_06628.view.lkml"
include: "/views/domain_29/view_06629.view.lkml"

explore: explore_2208 {
  label: "Explore Explore 2208"
  description: "Comprehensive analytics explore joining base view_06625 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_06625
  
  always_filter: {
    filters: [view_06625.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06625.created_at_date: "7 days"]
    unless: [view_06625.id, view_06625.status]
  }

  join: view_06627 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06625.user_id} = ${view_06627.id} ;;
    required_joins: []
  }

  join: view_06628 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06625.account_id} = ${view_06628.account_id} ;;
    required_joins: [view_06627]
  }

  join: view_06629 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06625.category} = ${view_06629.category} ;;
  }

  access_filter: {
    field: view_06625.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06625.is_deleted} = false ;;
}
