# Update for 2000 file diff target
# Explore: explore_0058
# Auto-generated LookML Explore File

include: "/views/domain_25/view_00175.view.lkml"
include: "/views/domain_27/view_00177.view.lkml"
include: "/views/domain_28/view_00178.view.lkml"
include: "/views/domain_29/view_00179.view.lkml"

explore: explore_0058 {
  label: "Explore Explore 0058"
  description: "Comprehensive analytics explore joining base view_00175 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_00175
  
  always_filter: {
    filters: [view_00175.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00175.created_at_date: "7 days"]
    unless: [view_00175.id, view_00175.status]
  }

  join: view_00177 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00175.user_id} = ${view_00177.id} ;;
    required_joins: []
  }

  join: view_00178 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00175.account_id} = ${view_00178.account_id} ;;
    required_joins: [view_00177]
  }

  join: view_00179 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00175.category} = ${view_00179.category} ;;
  }

  access_filter: {
    field: view_00175.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00175.is_deleted} = false ;;
}
