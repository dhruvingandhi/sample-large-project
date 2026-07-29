# Explore: explore_0224
# Auto-generated LookML Explore File

include: "/views/domain_23/view_00673.view.lkml"
include: "/views/domain_25/view_00675.view.lkml"
include: "/views/domain_26/view_00676.view.lkml"
include: "/views/domain_27/view_00677.view.lkml"

explore: explore_0224 {
  label: "Explore Explore 0224"
  description: "Comprehensive analytics explore joining base view_00673 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00673
  
  always_filter: {
    filters: [view_00673.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00673.created_at_date: "7 days"]
    unless: [view_00673.id, view_00673.status]
  }

  join: view_00675 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00673.user_id} = ${view_00675.id} ;;
    required_joins: []
  }

  join: view_00676 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00673.account_id} = ${view_00676.account_id} ;;
    required_joins: [view_00675]
  }

  join: view_00677 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00673.category} = ${view_00677.category} ;;
  }

  access_filter: {
    field: view_00673.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00673.is_deleted} = false ;;
}
