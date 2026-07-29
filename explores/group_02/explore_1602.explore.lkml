# Explore: explore_1602
# Auto-generated LookML Explore File

include: "/views/domain_07/view_04807.view.lkml"
include: "/views/domain_09/view_04809.view.lkml"
include: "/views/domain_10/view_04810.view.lkml"
include: "/views/domain_11/view_04811.view.lkml"

explore: explore_1602 {
  label: "Explore Explore 1602"
  description: "Comprehensive analytics explore joining base view_04807 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_04807
  
  always_filter: {
    filters: [view_04807.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04807.created_at_date: "7 days"]
    unless: [view_04807.id, view_04807.status]
  }

  join: view_04809 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04807.user_id} = ${view_04809.id} ;;
    required_joins: []
  }

  join: view_04810 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04807.account_id} = ${view_04810.account_id} ;;
    required_joins: [view_04809]
  }

  join: view_04811 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04807.category} = ${view_04811.category} ;;
  }

  access_filter: {
    field: view_04807.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04807.is_deleted} = false ;;
}
