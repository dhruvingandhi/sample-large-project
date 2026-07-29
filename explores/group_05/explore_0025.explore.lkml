# Explore: explore_0025
# Auto-generated LookML Explore File

include: "/views/domain_26/view_00076.view.lkml"
include: "/views/domain_28/view_00078.view.lkml"
include: "/views/domain_29/view_00079.view.lkml"
include: "/views/domain_30/view_00080.view.lkml"

explore: explore_0025 {
  label: "Explore Explore 0025"
  description: "Comprehensive analytics explore joining base view_00076 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00076
  
  always_filter: {
    filters: [view_00076.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00076.created_at_date: "7 days"]
    unless: [view_00076.id, view_00076.status]
  }

  join: view_00078 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00076.user_id} = ${view_00078.id} ;;
    required_joins: []
  }

  join: view_00079 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00076.account_id} = ${view_00079.account_id} ;;
    required_joins: [view_00078]
  }

  join: view_00080 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00076.category} = ${view_00080.category} ;;
  }

  access_filter: {
    field: view_00076.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00076.is_deleted} = false ;;
}
