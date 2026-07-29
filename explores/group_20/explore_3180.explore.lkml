# Explore: explore_3180
# Auto-generated LookML Explore File

include: "/views/domain_41/view_09541.view.lkml"
include: "/views/domain_43/view_09543.view.lkml"
include: "/views/domain_44/view_09544.view.lkml"
include: "/views/domain_45/view_09545.view.lkml"

explore: explore_3180 {
  label: "Explore Explore 3180"
  description: "Comprehensive analytics explore joining base view_09541 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_09541
  
  always_filter: {
    filters: [view_09541.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09541.created_at_date: "7 days"]
    unless: [view_09541.id, view_09541.status]
  }

  join: view_09543 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09541.user_id} = ${view_09543.id} ;;
    required_joins: []
  }

  join: view_09544 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09541.account_id} = ${view_09544.account_id} ;;
    required_joins: [view_09543]
  }

  join: view_09545 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09541.category} = ${view_09545.category} ;;
  }

  access_filter: {
    field: view_09541.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09541.is_deleted} = false ;;
}
