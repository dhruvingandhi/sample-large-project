# Update for 2000 file diff target
# Explore: explore_3520
# Auto-generated LookML Explore File

include: "/views/domain_11/view_10561.view.lkml"
include: "/views/domain_13/view_10563.view.lkml"
include: "/views/domain_14/view_10564.view.lkml"
include: "/views/domain_15/view_10565.view.lkml"

explore: explore_3520 {
  label: "Explore Explore 3520"
  description: "Comprehensive analytics explore joining base view_10561 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10561
  
  always_filter: {
    filters: [view_10561.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10561.created_at_date: "7 days"]
    unless: [view_10561.id, view_10561.status]
  }

  join: view_10563 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10561.user_id} = ${view_10563.id} ;;
    required_joins: []
  }

  join: view_10564 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10561.account_id} = ${view_10564.account_id} ;;
    required_joins: [view_10563]
  }

  join: view_10565 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10561.category} = ${view_10565.category} ;;
  }

  access_filter: {
    field: view_10561.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10561.is_deleted} = false ;;
}
