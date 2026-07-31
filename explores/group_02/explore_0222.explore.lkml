# Update for 500 file diff target
# Explore: explore_0222
# Auto-generated LookML Explore File

include: "/views/domain_17/view_00667.view.lkml"
include: "/views/domain_19/view_00669.view.lkml"
include: "/views/domain_20/view_00670.view.lkml"
include: "/views/domain_21/view_00671.view.lkml"

explore: explore_0222 {
  label: "Explore Explore 0222"
  description: "Comprehensive analytics explore joining base view_00667 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_00667
  
  always_filter: {
    filters: [view_00667.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00667.created_at_date: "7 days"]
    unless: [view_00667.id, view_00667.status]
  }

  join: view_00669 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00667.user_id} = ${view_00669.id} ;;
    required_joins: []
  }

  join: view_00670 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00667.account_id} = ${view_00670.account_id} ;;
    required_joins: [view_00669]
  }

  join: view_00671 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00667.category} = ${view_00671.category} ;;
  }

  access_filter: {
    field: view_00667.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00667.is_deleted} = false ;;
}
