# Update for 2000 file diff target
# Explore: explore_0499
# Auto-generated LookML Explore File

include: "/views/domain_48/view_01498.view.lkml"
include: "/views/domain_50/view_01500.view.lkml"
include: "/views/domain_01/view_01501.view.lkml"
include: "/views/domain_02/view_01502.view.lkml"

explore: explore_0499 {
  label: "Explore Explore 0499"
  description: "Comprehensive analytics explore joining base view_01498 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_01498
  
  always_filter: {
    filters: [view_01498.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01498.created_at_date: "7 days"]
    unless: [view_01498.id, view_01498.status]
  }

  join: view_01500 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01498.user_id} = ${view_01500.id} ;;
    required_joins: []
  }

  join: view_01501 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01498.account_id} = ${view_01501.account_id} ;;
    required_joins: [view_01500]
  }

  join: view_01502 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01498.category} = ${view_01502.category} ;;
  }

  access_filter: {
    field: view_01498.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01498.is_deleted} = false ;;
}
