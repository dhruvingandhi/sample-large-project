# Explore: explore_1703
# Auto-generated LookML Explore File

include: "/views/domain_10/view_05110.view.lkml"
include: "/views/domain_12/view_05112.view.lkml"
include: "/views/domain_13/view_05113.view.lkml"
include: "/views/domain_14/view_05114.view.lkml"

explore: explore_1703 {
  label: "Explore Explore 1703"
  description: "Comprehensive analytics explore joining base view_05110 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_05110
  
  always_filter: {
    filters: [view_05110.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05110.created_at_date: "7 days"]
    unless: [view_05110.id, view_05110.status]
  }

  join: view_05112 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05110.user_id} = ${view_05112.id} ;;
    required_joins: []
  }

  join: view_05113 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05110.account_id} = ${view_05113.account_id} ;;
    required_joins: [view_05112]
  }

  join: view_05114 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05110.category} = ${view_05114.category} ;;
  }

  access_filter: {
    field: view_05110.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05110.is_deleted} = false ;;
}
