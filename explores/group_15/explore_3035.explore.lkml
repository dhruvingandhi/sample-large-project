# Explore: explore_3035
# Auto-generated LookML Explore File

include: "/views/domain_06/view_09106.view.lkml"
include: "/views/domain_08/view_09108.view.lkml"
include: "/views/domain_09/view_09109.view.lkml"
include: "/views/domain_10/view_09110.view.lkml"

explore: explore_3035 {
  label: "Explore Explore 3035"
  description: "Comprehensive analytics explore joining base view_09106 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_09106
  
  always_filter: {
    filters: [view_09106.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09106.created_at_date: "7 days"]
    unless: [view_09106.id, view_09106.status]
  }

  join: view_09108 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09106.user_id} = ${view_09108.id} ;;
    required_joins: []
  }

  join: view_09109 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09106.account_id} = ${view_09109.account_id} ;;
    required_joins: [view_09108]
  }

  join: view_09110 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09106.category} = ${view_09110.category} ;;
  }

  access_filter: {
    field: view_09106.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09106.is_deleted} = false ;;
}
