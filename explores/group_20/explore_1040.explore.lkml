# Explore: explore_1040
# Auto-generated LookML Explore File

include: "/views/domain_21/view_03121.view.lkml"
include: "/views/domain_23/view_03123.view.lkml"
include: "/views/domain_24/view_03124.view.lkml"
include: "/views/domain_25/view_03125.view.lkml"

explore: explore_1040 {
  label: "Explore Explore 1040"
  description: "Comprehensive analytics explore joining base view_03121 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03121
  
  always_filter: {
    filters: [view_03121.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03121.created_at_date: "7 days"]
    unless: [view_03121.id, view_03121.status]
  }

  join: view_03123 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03121.user_id} = ${view_03123.id} ;;
    required_joins: []
  }

  join: view_03124 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03121.account_id} = ${view_03124.account_id} ;;
    required_joins: [view_03123]
  }

  join: view_03125 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03121.category} = ${view_03125.category} ;;
  }

  access_filter: {
    field: view_03121.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03121.is_deleted} = false ;;
}
