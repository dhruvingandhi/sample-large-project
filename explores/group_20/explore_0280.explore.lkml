# Explore: explore_0280
# Auto-generated LookML Explore File

include: "/views/domain_41/view_00841.view.lkml"
include: "/views/domain_43/view_00843.view.lkml"
include: "/views/domain_44/view_00844.view.lkml"
include: "/views/domain_45/view_00845.view.lkml"

explore: explore_0280 {
  label: "Explore Explore 0280"
  description: "Comprehensive analytics explore joining base view_00841 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_00841
  
  always_filter: {
    filters: [view_00841.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00841.created_at_date: "7 days"]
    unless: [view_00841.id, view_00841.status]
  }

  join: view_00843 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00841.user_id} = ${view_00843.id} ;;
    required_joins: []
  }

  join: view_00844 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00841.account_id} = ${view_00844.account_id} ;;
    required_joins: [view_00843]
  }

  join: view_00845 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00841.category} = ${view_00845.category} ;;
  }

  access_filter: {
    field: view_00841.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00841.is_deleted} = false ;;
}
