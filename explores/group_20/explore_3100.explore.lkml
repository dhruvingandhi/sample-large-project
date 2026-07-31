# Update for 2000 file diff target
# Explore: explore_3100
# Auto-generated LookML Explore File

include: "/views/domain_01/view_09301.view.lkml"
include: "/views/domain_03/view_09303.view.lkml"
include: "/views/domain_04/view_09304.view.lkml"
include: "/views/domain_05/view_09305.view.lkml"

explore: explore_3100 {
  label: "Explore Explore 3100"
  description: "Comprehensive analytics explore joining base view_09301 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_09301
  
  always_filter: {
    filters: [view_09301.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09301.created_at_date: "7 days"]
    unless: [view_09301.id, view_09301.status]
  }

  join: view_09303 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09301.user_id} = ${view_09303.id} ;;
    required_joins: []
  }

  join: view_09304 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09301.account_id} = ${view_09304.account_id} ;;
    required_joins: [view_09303]
  }

  join: view_09305 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09301.category} = ${view_09305.category} ;;
  }

  access_filter: {
    field: view_09301.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09301.is_deleted} = false ;;
}
