# Explore: explore_1615
# Auto-generated LookML Explore File

include: "/views/domain_46/view_04846.view.lkml"
include: "/views/domain_48/view_04848.view.lkml"
include: "/views/domain_49/view_04849.view.lkml"
include: "/views/domain_50/view_04850.view.lkml"

explore: explore_1615 {
  label: "Explore Explore 1615"
  description: "Comprehensive analytics explore joining base view_04846 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04846
  
  always_filter: {
    filters: [view_04846.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04846.created_at_date: "7 days"]
    unless: [view_04846.id, view_04846.status]
  }

  join: view_04848 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04846.user_id} = ${view_04848.id} ;;
    required_joins: []
  }

  join: view_04849 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04846.account_id} = ${view_04849.account_id} ;;
    required_joins: [view_04848]
  }

  join: view_04850 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04846.category} = ${view_04850.category} ;;
  }

  access_filter: {
    field: view_04846.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04846.is_deleted} = false ;;
}
