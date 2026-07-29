# Explore: explore_3615
# Auto-generated LookML Explore File

include: "/views/domain_46/view_10846.view.lkml"
include: "/views/domain_48/view_10848.view.lkml"
include: "/views/domain_49/view_10849.view.lkml"
include: "/views/domain_50/view_10850.view.lkml"

explore: explore_3615 {
  label: "Explore Explore 3615"
  description: "Comprehensive analytics explore joining base view_10846 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10846
  
  always_filter: {
    filters: [view_10846.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10846.created_at_date: "7 days"]
    unless: [view_10846.id, view_10846.status]
  }

  join: view_10848 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10846.user_id} = ${view_10848.id} ;;
    required_joins: []
  }

  join: view_10849 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10846.account_id} = ${view_10849.account_id} ;;
    required_joins: [view_10848]
  }

  join: view_10850 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10846.category} = ${view_10850.category} ;;
  }

  access_filter: {
    field: view_10846.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10846.is_deleted} = false ;;
}
