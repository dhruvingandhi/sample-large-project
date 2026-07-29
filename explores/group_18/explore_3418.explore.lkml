# Explore: explore_3418
# Auto-generated LookML Explore File

include: "/views/domain_05/view_10255.view.lkml"
include: "/views/domain_07/view_10257.view.lkml"
include: "/views/domain_08/view_10258.view.lkml"
include: "/views/domain_09/view_10259.view.lkml"

explore: explore_3418 {
  label: "Explore Explore 3418"
  description: "Comprehensive analytics explore joining base view_10255 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10255
  
  always_filter: {
    filters: [view_10255.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10255.created_at_date: "7 days"]
    unless: [view_10255.id, view_10255.status]
  }

  join: view_10257 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10255.user_id} = ${view_10257.id} ;;
    required_joins: []
  }

  join: view_10258 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10255.account_id} = ${view_10258.account_id} ;;
    required_joins: [view_10257]
  }

  join: view_10259 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10255.category} = ${view_10259.category} ;;
  }

  access_filter: {
    field: view_10255.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10255.is_deleted} = false ;;
}
