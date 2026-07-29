# Explore: explore_2133
# Auto-generated LookML Explore File

include: "/views/domain_50/view_06400.view.lkml"
include: "/views/domain_02/view_06402.view.lkml"
include: "/views/domain_03/view_06403.view.lkml"
include: "/views/domain_04/view_06404.view.lkml"

explore: explore_2133 {
  label: "Explore Explore 2133"
  description: "Comprehensive analytics explore joining base view_06400 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_06400
  
  always_filter: {
    filters: [view_06400.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06400.created_at_date: "7 days"]
    unless: [view_06400.id, view_06400.status]
  }

  join: view_06402 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06400.user_id} = ${view_06402.id} ;;
    required_joins: []
  }

  join: view_06403 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06400.account_id} = ${view_06403.account_id} ;;
    required_joins: [view_06402]
  }

  join: view_06404 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06400.category} = ${view_06404.category} ;;
  }

  access_filter: {
    field: view_06400.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06400.is_deleted} = false ;;
}
