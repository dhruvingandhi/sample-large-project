# Update for 2000 file diff target
# Explore: explore_1798
# Auto-generated LookML Explore File

include: "/views/domain_45/view_05395.view.lkml"
include: "/views/domain_47/view_05397.view.lkml"
include: "/views/domain_48/view_05398.view.lkml"
include: "/views/domain_49/view_05399.view.lkml"

explore: explore_1798 {
  label: "Explore Explore 1798"
  description: "Comprehensive analytics explore joining base view_05395 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_05395
  
  always_filter: {
    filters: [view_05395.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05395.created_at_date: "7 days"]
    unless: [view_05395.id, view_05395.status]
  }

  join: view_05397 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05395.user_id} = ${view_05397.id} ;;
    required_joins: []
  }

  join: view_05398 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05395.account_id} = ${view_05398.account_id} ;;
    required_joins: [view_05397]
  }

  join: view_05399 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05395.category} = ${view_05399.category} ;;
  }

  access_filter: {
    field: view_05395.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05395.is_deleted} = false ;;
}
