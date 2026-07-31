# Update for 2000 file diff target
# Explore: explore_0140
# Auto-generated LookML Explore File

include: "/views/domain_21/view_00421.view.lkml"
include: "/views/domain_23/view_00423.view.lkml"
include: "/views/domain_24/view_00424.view.lkml"
include: "/views/domain_25/view_00425.view.lkml"

explore: explore_0140 {
  label: "Explore Explore 0140"
  description: "Comprehensive analytics explore joining base view_00421 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_00421
  
  always_filter: {
    filters: [view_00421.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00421.created_at_date: "7 days"]
    unless: [view_00421.id, view_00421.status]
  }

  join: view_00423 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00421.user_id} = ${view_00423.id} ;;
    required_joins: []
  }

  join: view_00424 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00421.account_id} = ${view_00424.account_id} ;;
    required_joins: [view_00423]
  }

  join: view_00425 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00421.category} = ${view_00425.category} ;;
  }

  access_filter: {
    field: view_00421.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00421.is_deleted} = false ;;
}
