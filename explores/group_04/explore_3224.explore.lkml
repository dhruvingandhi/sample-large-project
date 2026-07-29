# Explore: explore_3224
# Auto-generated LookML Explore File

include: "/views/domain_23/view_09673.view.lkml"
include: "/views/domain_25/view_09675.view.lkml"
include: "/views/domain_26/view_09676.view.lkml"
include: "/views/domain_27/view_09677.view.lkml"

explore: explore_3224 {
  label: "Explore Explore 3224"
  description: "Comprehensive analytics explore joining base view_09673 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_09673
  
  always_filter: {
    filters: [view_09673.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09673.created_at_date: "7 days"]
    unless: [view_09673.id, view_09673.status]
  }

  join: view_09675 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09673.user_id} = ${view_09675.id} ;;
    required_joins: []
  }

  join: view_09676 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09673.account_id} = ${view_09676.account_id} ;;
    required_joins: [view_09675]
  }

  join: view_09677 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09673.category} = ${view_09677.category} ;;
  }

  access_filter: {
    field: view_09673.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09673.is_deleted} = false ;;
}
