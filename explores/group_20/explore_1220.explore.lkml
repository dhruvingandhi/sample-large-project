# Update for 2000 file diff target
# Explore: explore_1220
# Auto-generated LookML Explore File

include: "/views/domain_11/view_03661.view.lkml"
include: "/views/domain_13/view_03663.view.lkml"
include: "/views/domain_14/view_03664.view.lkml"
include: "/views/domain_15/view_03665.view.lkml"

explore: explore_1220 {
  label: "Explore Explore 1220"
  description: "Comprehensive analytics explore joining base view_03661 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03661
  
  always_filter: {
    filters: [view_03661.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03661.created_at_date: "7 days"]
    unless: [view_03661.id, view_03661.status]
  }

  join: view_03663 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03661.user_id} = ${view_03663.id} ;;
    required_joins: []
  }

  join: view_03664 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03661.account_id} = ${view_03664.account_id} ;;
    required_joins: [view_03663]
  }

  join: view_03665 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03661.category} = ${view_03665.category} ;;
  }

  access_filter: {
    field: view_03661.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03661.is_deleted} = false ;;
}
