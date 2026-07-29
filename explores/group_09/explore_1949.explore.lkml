# Explore: explore_1949
# Auto-generated LookML Explore File

include: "/views/domain_48/view_05848.view.lkml"
include: "/views/domain_50/view_05850.view.lkml"
include: "/views/domain_01/view_05851.view.lkml"
include: "/views/domain_02/view_05852.view.lkml"

explore: explore_1949 {
  label: "Explore Explore 1949"
  description: "Comprehensive analytics explore joining base view_05848 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_05848
  
  always_filter: {
    filters: [view_05848.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05848.created_at_date: "7 days"]
    unless: [view_05848.id, view_05848.status]
  }

  join: view_05850 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05848.user_id} = ${view_05850.id} ;;
    required_joins: []
  }

  join: view_05851 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05848.account_id} = ${view_05851.account_id} ;;
    required_joins: [view_05850]
  }

  join: view_05852 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05848.category} = ${view_05852.category} ;;
  }

  access_filter: {
    field: view_05848.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05848.is_deleted} = false ;;
}
