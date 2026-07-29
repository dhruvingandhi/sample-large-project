# Explore: explore_1371
# Auto-generated LookML Explore File

include: "/views/domain_14/view_04114.view.lkml"
include: "/views/domain_16/view_04116.view.lkml"
include: "/views/domain_17/view_04117.view.lkml"
include: "/views/domain_18/view_04118.view.lkml"

explore: explore_1371 {
  label: "Explore Explore 1371"
  description: "Comprehensive analytics explore joining base view_04114 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_04114
  
  always_filter: {
    filters: [view_04114.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04114.created_at_date: "7 days"]
    unless: [view_04114.id, view_04114.status]
  }

  join: view_04116 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04114.user_id} = ${view_04116.id} ;;
    required_joins: []
  }

  join: view_04117 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04114.account_id} = ${view_04117.account_id} ;;
    required_joins: [view_04116]
  }

  join: view_04118 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04114.category} = ${view_04118.category} ;;
  }

  access_filter: {
    field: view_04114.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04114.is_deleted} = false ;;
}
