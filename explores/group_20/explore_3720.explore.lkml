# Update for 2000 file diff target
# Explore: explore_3720
# Auto-generated LookML Explore File

include: "/views/domain_11/view_11161.view.lkml"
include: "/views/domain_13/view_11163.view.lkml"
include: "/views/domain_14/view_11164.view.lkml"
include: "/views/domain_15/view_11165.view.lkml"

explore: explore_3720 {
  label: "Explore Explore 3720"
  description: "Comprehensive analytics explore joining base view_11161 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_11161
  
  always_filter: {
    filters: [view_11161.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11161.created_at_date: "7 days"]
    unless: [view_11161.id, view_11161.status]
  }

  join: view_11163 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11161.user_id} = ${view_11163.id} ;;
    required_joins: []
  }

  join: view_11164 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11161.account_id} = ${view_11164.account_id} ;;
    required_joins: [view_11163]
  }

  join: view_11165 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11161.category} = ${view_11165.category} ;;
  }

  access_filter: {
    field: view_11161.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11161.is_deleted} = false ;;
}
