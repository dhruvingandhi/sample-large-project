# Explore: explore_3497
# Auto-generated LookML Explore File

include: "/views/domain_42/view_10492.view.lkml"
include: "/views/domain_44/view_10494.view.lkml"
include: "/views/domain_45/view_10495.view.lkml"
include: "/views/domain_46/view_10496.view.lkml"

explore: explore_3497 {
  label: "Explore Explore 3497"
  description: "Comprehensive analytics explore joining base view_10492 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_10492
  
  always_filter: {
    filters: [view_10492.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10492.created_at_date: "7 days"]
    unless: [view_10492.id, view_10492.status]
  }

  join: view_10494 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10492.user_id} = ${view_10494.id} ;;
    required_joins: []
  }

  join: view_10495 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10492.account_id} = ${view_10495.account_id} ;;
    required_joins: [view_10494]
  }

  join: view_10496 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10492.category} = ${view_10496.category} ;;
  }

  access_filter: {
    field: view_10492.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10492.is_deleted} = false ;;
}
