# Explore: explore_1483
# Auto-generated LookML Explore File

include: "/views/domain_50/view_04450.view.lkml"
include: "/views/domain_02/view_04452.view.lkml"
include: "/views/domain_03/view_04453.view.lkml"
include: "/views/domain_04/view_04454.view.lkml"

explore: explore_1483 {
  label: "Explore Explore 1483"
  description: "Comprehensive analytics explore joining base view_04450 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_04450
  
  always_filter: {
    filters: [view_04450.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04450.created_at_date: "7 days"]
    unless: [view_04450.id, view_04450.status]
  }

  join: view_04452 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04450.user_id} = ${view_04452.id} ;;
    required_joins: []
  }

  join: view_04453 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04450.account_id} = ${view_04453.account_id} ;;
    required_joins: [view_04452]
  }

  join: view_04454 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04450.category} = ${view_04454.category} ;;
  }

  access_filter: {
    field: view_04450.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04450.is_deleted} = false ;;
}
