# Explore: explore_1704
# Auto-generated LookML Explore File

include: "/views/domain_13/view_05113.view.lkml"
include: "/views/domain_15/view_05115.view.lkml"
include: "/views/domain_16/view_05116.view.lkml"
include: "/views/domain_17/view_05117.view.lkml"

explore: explore_1704 {
  label: "Explore Explore 1704"
  description: "Comprehensive analytics explore joining base view_05113 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_05113
  
  always_filter: {
    filters: [view_05113.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05113.created_at_date: "7 days"]
    unless: [view_05113.id, view_05113.status]
  }

  join: view_05115 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05113.user_id} = ${view_05115.id} ;;
    required_joins: []
  }

  join: view_05116 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05113.account_id} = ${view_05116.account_id} ;;
    required_joins: [view_05115]
  }

  join: view_05117 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05113.category} = ${view_05117.category} ;;
  }

  access_filter: {
    field: view_05113.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05113.is_deleted} = false ;;
}
