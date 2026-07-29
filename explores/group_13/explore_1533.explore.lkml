# Explore: explore_1533
# Auto-generated LookML Explore File

include: "/views/domain_50/view_04600.view.lkml"
include: "/views/domain_02/view_04602.view.lkml"
include: "/views/domain_03/view_04603.view.lkml"
include: "/views/domain_04/view_04604.view.lkml"

explore: explore_1533 {
  label: "Explore Explore 1533"
  description: "Comprehensive analytics explore joining base view_04600 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_04600
  
  always_filter: {
    filters: [view_04600.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04600.created_at_date: "7 days"]
    unless: [view_04600.id, view_04600.status]
  }

  join: view_04602 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04600.user_id} = ${view_04602.id} ;;
    required_joins: []
  }

  join: view_04603 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04600.account_id} = ${view_04603.account_id} ;;
    required_joins: [view_04602]
  }

  join: view_04604 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04600.category} = ${view_04604.category} ;;
  }

  access_filter: {
    field: view_04600.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04600.is_deleted} = false ;;
}
