# Explore: explore_1197
# Auto-generated LookML Explore File

include: "/views/domain_42/view_03592.view.lkml"
include: "/views/domain_44/view_03594.view.lkml"
include: "/views/domain_45/view_03595.view.lkml"
include: "/views/domain_46/view_03596.view.lkml"

explore: explore_1197 {
  label: "Explore Explore 1197"
  description: "Comprehensive analytics explore joining base view_03592 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_03592
  
  always_filter: {
    filters: [view_03592.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03592.created_at_date: "7 days"]
    unless: [view_03592.id, view_03592.status]
  }

  join: view_03594 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03592.user_id} = ${view_03594.id} ;;
    required_joins: []
  }

  join: view_03595 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03592.account_id} = ${view_03595.account_id} ;;
    required_joins: [view_03594]
  }

  join: view_03596 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03592.category} = ${view_03596.category} ;;
  }

  access_filter: {
    field: view_03592.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03592.is_deleted} = false ;;
}
