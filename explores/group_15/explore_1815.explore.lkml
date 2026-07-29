# Explore: explore_1815
# Auto-generated LookML Explore File

include: "/views/domain_46/view_05446.view.lkml"
include: "/views/domain_48/view_05448.view.lkml"
include: "/views/domain_49/view_05449.view.lkml"
include: "/views/domain_50/view_05450.view.lkml"

explore: explore_1815 {
  label: "Explore Explore 1815"
  description: "Comprehensive analytics explore joining base view_05446 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_05446
  
  always_filter: {
    filters: [view_05446.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05446.created_at_date: "7 days"]
    unless: [view_05446.id, view_05446.status]
  }

  join: view_05448 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05446.user_id} = ${view_05448.id} ;;
    required_joins: []
  }

  join: view_05449 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05446.account_id} = ${view_05449.account_id} ;;
    required_joins: [view_05448]
  }

  join: view_05450 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05446.category} = ${view_05450.category} ;;
  }

  access_filter: {
    field: view_05446.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05446.is_deleted} = false ;;
}
