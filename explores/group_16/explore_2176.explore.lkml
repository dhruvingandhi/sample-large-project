# Explore: explore_2176
# Auto-generated LookML Explore File

include: "/views/domain_29/view_06529.view.lkml"
include: "/views/domain_31/view_06531.view.lkml"
include: "/views/domain_32/view_06532.view.lkml"
include: "/views/domain_33/view_06533.view.lkml"

explore: explore_2176 {
  label: "Explore Explore 2176"
  description: "Comprehensive analytics explore joining base view_06529 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_06529
  
  always_filter: {
    filters: [view_06529.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06529.created_at_date: "7 days"]
    unless: [view_06529.id, view_06529.status]
  }

  join: view_06531 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06529.user_id} = ${view_06531.id} ;;
    required_joins: []
  }

  join: view_06532 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06529.account_id} = ${view_06532.account_id} ;;
    required_joins: [view_06531]
  }

  join: view_06533 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06529.category} = ${view_06533.category} ;;
  }

  access_filter: {
    field: view_06529.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06529.is_deleted} = false ;;
}
