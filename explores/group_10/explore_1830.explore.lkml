# Explore: explore_1830
# Auto-generated LookML Explore File

include: "/views/domain_41/view_05491.view.lkml"
include: "/views/domain_43/view_05493.view.lkml"
include: "/views/domain_44/view_05494.view.lkml"
include: "/views/domain_45/view_05495.view.lkml"

explore: explore_1830 {
  label: "Explore Explore 1830"
  description: "Comprehensive analytics explore joining base view_05491 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05491
  
  always_filter: {
    filters: [view_05491.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05491.created_at_date: "7 days"]
    unless: [view_05491.id, view_05491.status]
  }

  join: view_05493 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05491.user_id} = ${view_05493.id} ;;
    required_joins: []
  }

  join: view_05494 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05491.account_id} = ${view_05494.account_id} ;;
    required_joins: [view_05493]
  }

  join: view_05495 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05491.category} = ${view_05495.category} ;;
  }

  access_filter: {
    field: view_05491.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05491.is_deleted} = false ;;
}
