# Explore: explore_1636
# Auto-generated LookML Explore File

include: "/views/domain_09/view_04909.view.lkml"
include: "/views/domain_11/view_04911.view.lkml"
include: "/views/domain_12/view_04912.view.lkml"
include: "/views/domain_13/view_04913.view.lkml"

explore: explore_1636 {
  label: "Explore Explore 1636"
  description: "Comprehensive analytics explore joining base view_04909 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04909
  
  always_filter: {
    filters: [view_04909.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04909.created_at_date: "7 days"]
    unless: [view_04909.id, view_04909.status]
  }

  join: view_04911 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04909.user_id} = ${view_04911.id} ;;
    required_joins: []
  }

  join: view_04912 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04909.account_id} = ${view_04912.account_id} ;;
    required_joins: [view_04911]
  }

  join: view_04913 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04909.category} = ${view_04913.category} ;;
  }

  access_filter: {
    field: view_04909.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04909.is_deleted} = false ;;
}
