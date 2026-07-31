# Update for 2000 file diff target
# Explore: explore_1920
# Auto-generated LookML Explore File

include: "/views/domain_11/view_05761.view.lkml"
include: "/views/domain_13/view_05763.view.lkml"
include: "/views/domain_14/view_05764.view.lkml"
include: "/views/domain_15/view_05765.view.lkml"

explore: explore_1920 {
  label: "Explore Explore 1920"
  description: "Comprehensive analytics explore joining base view_05761 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_05761
  
  always_filter: {
    filters: [view_05761.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05761.created_at_date: "7 days"]
    unless: [view_05761.id, view_05761.status]
  }

  join: view_05763 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05761.user_id} = ${view_05763.id} ;;
    required_joins: []
  }

  join: view_05764 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05761.account_id} = ${view_05764.account_id} ;;
    required_joins: [view_05763]
  }

  join: view_05765 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05761.category} = ${view_05765.category} ;;
  }

  access_filter: {
    field: view_05761.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05761.is_deleted} = false ;;
}
