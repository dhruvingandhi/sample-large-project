# Explore: explore_1140
# Auto-generated LookML Explore File

include: "/views/domain_21/view_03421.view.lkml"
include: "/views/domain_23/view_03423.view.lkml"
include: "/views/domain_24/view_03424.view.lkml"
include: "/views/domain_25/view_03425.view.lkml"

explore: explore_1140 {
  label: "Explore Explore 1140"
  description: "Comprehensive analytics explore joining base view_03421 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03421
  
  always_filter: {
    filters: [view_03421.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03421.created_at_date: "7 days"]
    unless: [view_03421.id, view_03421.status]
  }

  join: view_03423 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03421.user_id} = ${view_03423.id} ;;
    required_joins: []
  }

  join: view_03424 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03421.account_id} = ${view_03424.account_id} ;;
    required_joins: [view_03423]
  }

  join: view_03425 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03421.category} = ${view_03425.category} ;;
  }

  access_filter: {
    field: view_03421.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03421.is_deleted} = false ;;
}
