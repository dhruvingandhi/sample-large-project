# Explore: explore_2285
# Auto-generated LookML Explore File

include: "/views/domain_06/view_06856.view.lkml"
include: "/views/domain_08/view_06858.view.lkml"
include: "/views/domain_09/view_06859.view.lkml"
include: "/views/domain_10/view_06860.view.lkml"

explore: explore_2285 {
  label: "Explore Explore 2285"
  description: "Comprehensive analytics explore joining base view_06856 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06856
  
  always_filter: {
    filters: [view_06856.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06856.created_at_date: "7 days"]
    unless: [view_06856.id, view_06856.status]
  }

  join: view_06858 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06856.user_id} = ${view_06858.id} ;;
    required_joins: []
  }

  join: view_06859 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06856.account_id} = ${view_06859.account_id} ;;
    required_joins: [view_06858]
  }

  join: view_06860 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06856.category} = ${view_06860.category} ;;
  }

  access_filter: {
    field: view_06856.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06856.is_deleted} = false ;;
}
