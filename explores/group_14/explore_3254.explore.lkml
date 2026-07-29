# Explore: explore_3254
# Auto-generated LookML Explore File

include: "/views/domain_13/view_09763.view.lkml"
include: "/views/domain_15/view_09765.view.lkml"
include: "/views/domain_16/view_09766.view.lkml"
include: "/views/domain_17/view_09767.view.lkml"

explore: explore_3254 {
  label: "Explore Explore 3254"
  description: "Comprehensive analytics explore joining base view_09763 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_09763
  
  always_filter: {
    filters: [view_09763.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09763.created_at_date: "7 days"]
    unless: [view_09763.id, view_09763.status]
  }

  join: view_09765 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09763.user_id} = ${view_09765.id} ;;
    required_joins: []
  }

  join: view_09766 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09763.account_id} = ${view_09766.account_id} ;;
    required_joins: [view_09765]
  }

  join: view_09767 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09763.category} = ${view_09767.category} ;;
  }

  access_filter: {
    field: view_09763.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09763.is_deleted} = false ;;
}
