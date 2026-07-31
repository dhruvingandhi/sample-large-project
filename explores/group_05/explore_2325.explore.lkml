# Update for 500 file diff target
# Explore: explore_2325
# Auto-generated LookML Explore File

include: "/views/domain_26/view_06976.view.lkml"
include: "/views/domain_28/view_06978.view.lkml"
include: "/views/domain_29/view_06979.view.lkml"
include: "/views/domain_30/view_06980.view.lkml"

explore: explore_2325 {
  label: "Explore Explore 2325"
  description: "Comprehensive analytics explore joining base view_06976 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06976
  
  always_filter: {
    filters: [view_06976.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06976.created_at_date: "7 days"]
    unless: [view_06976.id, view_06976.status]
  }

  join: view_06978 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06976.user_id} = ${view_06978.id} ;;
    required_joins: []
  }

  join: view_06979 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06976.account_id} = ${view_06979.account_id} ;;
    required_joins: [view_06978]
  }

  join: view_06980 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06976.category} = ${view_06980.category} ;;
  }

  access_filter: {
    field: view_06976.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06976.is_deleted} = false ;;
}
