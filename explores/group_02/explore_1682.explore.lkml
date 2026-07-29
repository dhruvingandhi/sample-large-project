# Explore: explore_1682
# Auto-generated LookML Explore File

include: "/views/domain_47/view_05047.view.lkml"
include: "/views/domain_49/view_05049.view.lkml"
include: "/views/domain_50/view_05050.view.lkml"
include: "/views/domain_01/view_05051.view.lkml"

explore: explore_1682 {
  label: "Explore Explore 1682"
  description: "Comprehensive analytics explore joining base view_05047 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_05047
  
  always_filter: {
    filters: [view_05047.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05047.created_at_date: "7 days"]
    unless: [view_05047.id, view_05047.status]
  }

  join: view_05049 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05047.user_id} = ${view_05049.id} ;;
    required_joins: []
  }

  join: view_05050 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05047.account_id} = ${view_05050.account_id} ;;
    required_joins: [view_05049]
  }

  join: view_05051 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05047.category} = ${view_05051.category} ;;
  }

  access_filter: {
    field: view_05047.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05047.is_deleted} = false ;;
}
