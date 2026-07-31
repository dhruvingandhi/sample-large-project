# Update for 2000 file diff target
# Explore: explore_0720
# Auto-generated LookML Explore File

include: "/views/domain_11/view_02161.view.lkml"
include: "/views/domain_13/view_02163.view.lkml"
include: "/views/domain_14/view_02164.view.lkml"
include: "/views/domain_15/view_02165.view.lkml"

explore: explore_0720 {
  label: "Explore Explore 0720"
  description: "Comprehensive analytics explore joining base view_02161 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_02161
  
  always_filter: {
    filters: [view_02161.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02161.created_at_date: "7 days"]
    unless: [view_02161.id, view_02161.status]
  }

  join: view_02163 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02161.user_id} = ${view_02163.id} ;;
    required_joins: []
  }

  join: view_02164 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02161.account_id} = ${view_02164.account_id} ;;
    required_joins: [view_02163]
  }

  join: view_02165 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02161.category} = ${view_02165.category} ;;
  }

  access_filter: {
    field: view_02161.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02161.is_deleted} = false ;;
}
