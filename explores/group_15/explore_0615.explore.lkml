# Explore: explore_0615
# Auto-generated LookML Explore File

include: "/views/domain_46/view_01846.view.lkml"
include: "/views/domain_48/view_01848.view.lkml"
include: "/views/domain_49/view_01849.view.lkml"
include: "/views/domain_50/view_01850.view.lkml"

explore: explore_0615 {
  label: "Explore Explore 0615"
  description: "Comprehensive analytics explore joining base view_01846 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_01846
  
  always_filter: {
    filters: [view_01846.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01846.created_at_date: "7 days"]
    unless: [view_01846.id, view_01846.status]
  }

  join: view_01848 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01846.user_id} = ${view_01848.id} ;;
    required_joins: []
  }

  join: view_01849 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01846.account_id} = ${view_01849.account_id} ;;
    required_joins: [view_01848]
  }

  join: view_01850 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01846.category} = ${view_01850.category} ;;
  }

  access_filter: {
    field: view_01846.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01846.is_deleted} = false ;;
}
