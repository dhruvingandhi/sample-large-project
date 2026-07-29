# Explore: explore_0815
# Auto-generated LookML Explore File

include: "/views/domain_46/view_02446.view.lkml"
include: "/views/domain_48/view_02448.view.lkml"
include: "/views/domain_49/view_02449.view.lkml"
include: "/views/domain_50/view_02450.view.lkml"

explore: explore_0815 {
  label: "Explore Explore 0815"
  description: "Comprehensive analytics explore joining base view_02446 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_02446
  
  always_filter: {
    filters: [view_02446.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02446.created_at_date: "7 days"]
    unless: [view_02446.id, view_02446.status]
  }

  join: view_02448 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02446.user_id} = ${view_02448.id} ;;
    required_joins: []
  }

  join: view_02449 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02446.account_id} = ${view_02449.account_id} ;;
    required_joins: [view_02448]
  }

  join: view_02450 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02446.category} = ${view_02450.category} ;;
  }

  access_filter: {
    field: view_02446.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02446.is_deleted} = false ;;
}
