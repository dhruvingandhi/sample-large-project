# Explore: explore_1597
# Auto-generated LookML Explore File

include: "/views/domain_42/view_04792.view.lkml"
include: "/views/domain_44/view_04794.view.lkml"
include: "/views/domain_45/view_04795.view.lkml"
include: "/views/domain_46/view_04796.view.lkml"

explore: explore_1597 {
  label: "Explore Explore 1597"
  description: "Comprehensive analytics explore joining base view_04792 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_04792
  
  always_filter: {
    filters: [view_04792.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04792.created_at_date: "7 days"]
    unless: [view_04792.id, view_04792.status]
  }

  join: view_04794 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04792.user_id} = ${view_04794.id} ;;
    required_joins: []
  }

  join: view_04795 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04792.account_id} = ${view_04795.account_id} ;;
    required_joins: [view_04794]
  }

  join: view_04796 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04792.category} = ${view_04796.category} ;;
  }

  access_filter: {
    field: view_04792.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04792.is_deleted} = false ;;
}
