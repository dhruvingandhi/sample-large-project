# Update for 2000 file diff target
# Explore: explore_1699
# Auto-generated LookML Explore File

include: "/views/domain_48/view_05098.view.lkml"
include: "/views/domain_50/view_05100.view.lkml"
include: "/views/domain_01/view_05101.view.lkml"
include: "/views/domain_02/view_05102.view.lkml"

explore: explore_1699 {
  label: "Explore Explore 1699"
  description: "Comprehensive analytics explore joining base view_05098 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_05098
  
  always_filter: {
    filters: [view_05098.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05098.created_at_date: "7 days"]
    unless: [view_05098.id, view_05098.status]
  }

  join: view_05100 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05098.user_id} = ${view_05100.id} ;;
    required_joins: []
  }

  join: view_05101 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05098.account_id} = ${view_05101.account_id} ;;
    required_joins: [view_05100]
  }

  join: view_05102 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05098.category} = ${view_05102.category} ;;
  }

  access_filter: {
    field: view_05098.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05098.is_deleted} = false ;;
}
