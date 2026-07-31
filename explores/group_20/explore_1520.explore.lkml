# Update for 2000 file diff target
# Explore: explore_1520
# Auto-generated LookML Explore File

include: "/views/domain_11/view_04561.view.lkml"
include: "/views/domain_13/view_04563.view.lkml"
include: "/views/domain_14/view_04564.view.lkml"
include: "/views/domain_15/view_04565.view.lkml"

explore: explore_1520 {
  label: "Explore Explore 1520"
  description: "Comprehensive analytics explore joining base view_04561 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_04561
  
  always_filter: {
    filters: [view_04561.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04561.created_at_date: "7 days"]
    unless: [view_04561.id, view_04561.status]
  }

  join: view_04563 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04561.user_id} = ${view_04563.id} ;;
    required_joins: []
  }

  join: view_04564 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04561.account_id} = ${view_04564.account_id} ;;
    required_joins: [view_04563]
  }

  join: view_04565 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04561.category} = ${view_04565.category} ;;
  }

  access_filter: {
    field: view_04561.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04561.is_deleted} = false ;;
}
