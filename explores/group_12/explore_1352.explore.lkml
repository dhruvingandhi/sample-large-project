# Explore: explore_1352
# Auto-generated LookML Explore File

include: "/views/domain_07/view_04057.view.lkml"
include: "/views/domain_09/view_04059.view.lkml"
include: "/views/domain_10/view_04060.view.lkml"
include: "/views/domain_11/view_04061.view.lkml"

explore: explore_1352 {
  label: "Explore Explore 1352"
  description: "Comprehensive analytics explore joining base view_04057 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_04057
  
  always_filter: {
    filters: [view_04057.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04057.created_at_date: "7 days"]
    unless: [view_04057.id, view_04057.status]
  }

  join: view_04059 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04057.user_id} = ${view_04059.id} ;;
    required_joins: []
  }

  join: view_04060 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04057.account_id} = ${view_04060.account_id} ;;
    required_joins: [view_04059]
  }

  join: view_04061 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04057.category} = ${view_04061.category} ;;
  }

  access_filter: {
    field: view_04057.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04057.is_deleted} = false ;;
}
