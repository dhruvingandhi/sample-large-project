# Explore: explore_2226
# Auto-generated LookML Explore File

include: "/views/domain_29/view_06679.view.lkml"
include: "/views/domain_31/view_06681.view.lkml"
include: "/views/domain_32/view_06682.view.lkml"
include: "/views/domain_33/view_06683.view.lkml"

explore: explore_2226 {
  label: "Explore Explore 2226"
  description: "Comprehensive analytics explore joining base view_06679 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06679
  
  always_filter: {
    filters: [view_06679.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06679.created_at_date: "7 days"]
    unless: [view_06679.id, view_06679.status]
  }

  join: view_06681 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06679.user_id} = ${view_06681.id} ;;
    required_joins: []
  }

  join: view_06682 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06679.account_id} = ${view_06682.account_id} ;;
    required_joins: [view_06681]
  }

  join: view_06683 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06679.category} = ${view_06683.category} ;;
  }

  access_filter: {
    field: view_06679.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06679.is_deleted} = false ;;
}
