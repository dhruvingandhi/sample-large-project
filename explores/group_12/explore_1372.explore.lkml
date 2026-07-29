# Explore: explore_1372
# Auto-generated LookML Explore File

include: "/views/domain_17/view_04117.view.lkml"
include: "/views/domain_19/view_04119.view.lkml"
include: "/views/domain_20/view_04120.view.lkml"
include: "/views/domain_21/view_04121.view.lkml"

explore: explore_1372 {
  label: "Explore Explore 1372"
  description: "Comprehensive analytics explore joining base view_04117 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_04117
  
  always_filter: {
    filters: [view_04117.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04117.created_at_date: "7 days"]
    unless: [view_04117.id, view_04117.status]
  }

  join: view_04119 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04117.user_id} = ${view_04119.id} ;;
    required_joins: []
  }

  join: view_04120 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04117.account_id} = ${view_04120.account_id} ;;
    required_joins: [view_04119]
  }

  join: view_04121 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04117.category} = ${view_04121.category} ;;
  }

  access_filter: {
    field: view_04117.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04117.is_deleted} = false ;;
}
