# Explore: explore_0325
# Auto-generated LookML Explore File

include: "/views/domain_26/view_00976.view.lkml"
include: "/views/domain_28/view_00978.view.lkml"
include: "/views/domain_29/view_00979.view.lkml"
include: "/views/domain_30/view_00980.view.lkml"

explore: explore_0325 {
  label: "Explore Explore 0325"
  description: "Comprehensive analytics explore joining base view_00976 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00976
  
  always_filter: {
    filters: [view_00976.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00976.created_at_date: "7 days"]
    unless: [view_00976.id, view_00976.status]
  }

  join: view_00978 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00976.user_id} = ${view_00978.id} ;;
    required_joins: []
  }

  join: view_00979 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00976.account_id} = ${view_00979.account_id} ;;
    required_joins: [view_00978]
  }

  join: view_00980 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00976.category} = ${view_00980.category} ;;
  }

  access_filter: {
    field: view_00976.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00976.is_deleted} = false ;;
}
