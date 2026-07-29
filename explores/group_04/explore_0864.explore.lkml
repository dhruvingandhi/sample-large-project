# Explore: explore_0864
# Auto-generated LookML Explore File

include: "/views/domain_43/view_02593.view.lkml"
include: "/views/domain_45/view_02595.view.lkml"
include: "/views/domain_46/view_02596.view.lkml"
include: "/views/domain_47/view_02597.view.lkml"

explore: explore_0864 {
  label: "Explore Explore 0864"
  description: "Comprehensive analytics explore joining base view_02593 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_02593
  
  always_filter: {
    filters: [view_02593.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02593.created_at_date: "7 days"]
    unless: [view_02593.id, view_02593.status]
  }

  join: view_02595 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02593.user_id} = ${view_02595.id} ;;
    required_joins: []
  }

  join: view_02596 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02593.account_id} = ${view_02596.account_id} ;;
    required_joins: [view_02595]
  }

  join: view_02597 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02593.category} = ${view_02597.category} ;;
  }

  access_filter: {
    field: view_02593.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02593.is_deleted} = false ;;
}
