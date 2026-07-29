# Explore: explore_0149
# Auto-generated LookML Explore File

include: "/views/domain_48/view_00448.view.lkml"
include: "/views/domain_50/view_00450.view.lkml"
include: "/views/domain_01/view_00451.view.lkml"
include: "/views/domain_02/view_00452.view.lkml"

explore: explore_0149 {
  label: "Explore Explore 0149"
  description: "Comprehensive analytics explore joining base view_00448 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_00448
  
  always_filter: {
    filters: [view_00448.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00448.created_at_date: "7 days"]
    unless: [view_00448.id, view_00448.status]
  }

  join: view_00450 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00448.user_id} = ${view_00450.id} ;;
    required_joins: []
  }

  join: view_00451 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00448.account_id} = ${view_00451.account_id} ;;
    required_joins: [view_00450]
  }

  join: view_00452 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00448.category} = ${view_00452.category} ;;
  }

  access_filter: {
    field: view_00448.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00448.is_deleted} = false ;;
}
