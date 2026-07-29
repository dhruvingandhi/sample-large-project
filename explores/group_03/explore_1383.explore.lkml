# Explore: explore_1383
# Auto-generated LookML Explore File

include: "/views/domain_50/view_04150.view.lkml"
include: "/views/domain_02/view_04152.view.lkml"
include: "/views/domain_03/view_04153.view.lkml"
include: "/views/domain_04/view_04154.view.lkml"

explore: explore_1383 {
  label: "Explore Explore 1383"
  description: "Comprehensive analytics explore joining base view_04150 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_04150
  
  always_filter: {
    filters: [view_04150.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04150.created_at_date: "7 days"]
    unless: [view_04150.id, view_04150.status]
  }

  join: view_04152 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04150.user_id} = ${view_04152.id} ;;
    required_joins: []
  }

  join: view_04153 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04150.account_id} = ${view_04153.account_id} ;;
    required_joins: [view_04152]
  }

  join: view_04154 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04150.category} = ${view_04154.category} ;;
  }

  access_filter: {
    field: view_04150.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04150.is_deleted} = false ;;
}
