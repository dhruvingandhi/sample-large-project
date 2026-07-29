# Explore: explore_0497
# Auto-generated LookML Explore File

include: "/views/domain_42/view_01492.view.lkml"
include: "/views/domain_44/view_01494.view.lkml"
include: "/views/domain_45/view_01495.view.lkml"
include: "/views/domain_46/view_01496.view.lkml"

explore: explore_0497 {
  label: "Explore Explore 0497"
  description: "Comprehensive analytics explore joining base view_01492 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01492
  
  always_filter: {
    filters: [view_01492.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01492.created_at_date: "7 days"]
    unless: [view_01492.id, view_01492.status]
  }

  join: view_01494 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01492.user_id} = ${view_01494.id} ;;
    required_joins: []
  }

  join: view_01495 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01492.account_id} = ${view_01495.account_id} ;;
    required_joins: [view_01494]
  }

  join: view_01496 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01492.category} = ${view_01496.category} ;;
  }

  access_filter: {
    field: view_01492.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01492.is_deleted} = false ;;
}
